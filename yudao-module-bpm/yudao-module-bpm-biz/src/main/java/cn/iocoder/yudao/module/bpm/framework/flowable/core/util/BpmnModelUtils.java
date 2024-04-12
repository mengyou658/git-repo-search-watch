package cn.iocoder.yudao.module.bpm.framework.flowable.core.util;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.number.NumberUtils;
import cn.iocoder.yudao.module.bpm.controller.admin.definition.vo.simple.BpmSimpleModelNodeVO;
import cn.iocoder.yudao.module.bpm.enums.definition.BpmSimpleModelNodeType;
import cn.iocoder.yudao.module.bpm.framework.flowable.core.enums.BpmnModelConstants;
import org.flowable.bpmn.BpmnAutoLayout;
import org.flowable.bpmn.converter.BpmnXMLConverter;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.*;
import org.flowable.common.engine.impl.scripting.ScriptingEngines;
import org.flowable.common.engine.impl.util.io.BytesStreamSource;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.flowable.bpmn.constants.BpmnXMLConstants.*;

/**
 * 流程模型转操作工具类
 */
public class BpmnModelUtils {

    public static final String BPMN_SIMPLE_COPY_EXECUTION_SCRIPT = "#{bpmSimpleNodeService.copy(execution)}";

    public static Integer parseCandidateStrategy(FlowElement userTask) {
        return NumberUtils.parseInt(userTask.getAttributeValue(
                BpmnModelConstants.NAMESPACE, BpmnModelConstants.USER_TASK_CANDIDATE_STRATEGY));
    }

    public static String parseCandidateParam(FlowElement userTask) {
        return userTask.getAttributeValue(
                BpmnModelConstants.NAMESPACE, BpmnModelConstants.USER_TASK_CANDIDATE_PARAM);
    }

    /**
     * 根据节点，获取入口连线
     *
     * @param source 起始节点
     * @return 入口连线列表
     */
    public static List<SequenceFlow> getElementIncomingFlows(FlowElement source) {
        if (source instanceof FlowNode) {
            return ((FlowNode) source).getIncomingFlows();
        }
        return new ArrayList<>();
    }

    /**
     * 根据节点，获取出口连线
     *
     * @param source 起始节点
     * @return 出口连线列表
     */
    public static List<SequenceFlow> getElementOutgoingFlows(FlowElement source) {
        if (source instanceof FlowNode) {
            return ((FlowNode) source).getOutgoingFlows();
        }
        return new ArrayList<>();
    }

    /**
     * 获取流程元素信息
     *
     * @param model         bpmnModel 对象
     * @param flowElementId 元素 ID
     * @return 元素信息
     */
    public static FlowElement getFlowElementById(BpmnModel model, String flowElementId) {
        Process process = model.getMainProcess();
        return process.getFlowElement(flowElementId);
    }

    /**
     * 获得 BPMN 流程中，指定的元素们
     *
     * @param model 模型
     * @param clazz 指定元素。例如说，{@link UserTask}、{@link Gateway} 等等
     * @return 元素们
     */
    public static <T extends FlowElement> List<T> getBpmnModelElements(BpmnModel model, Class<T> clazz) {
        List<T> result = new ArrayList<>();
        model.getProcesses().forEach(process -> {
            process.getFlowElements().forEach(flowElement -> {
                if (flowElement.getClass().isAssignableFrom(clazz)) {
                    result.add((T) flowElement);
                }
            });
        });
        return result;
    }

    public static StartEvent getStartEvent(BpmnModel model) {
        Process process = model.getMainProcess();
        // 从 initialFlowElement 找
        FlowElement startElement = process.getInitialFlowElement();
        if (startElement instanceof StartEvent) {
            return (StartEvent) startElement;
        }
        // 从 flowElementList 找
        return (StartEvent) CollUtil.findOne(process.getFlowElements(), flowElement -> flowElement instanceof StartEvent);
    }

    public static BpmnModel getBpmnModel(byte[] bpmnBytes) {
        if (ArrayUtil.isEmpty(bpmnBytes)) {
            return null;
        }
        BpmnXMLConverter converter = new BpmnXMLConverter();
        // 补充说明：由于在 Flowable 中自定义了属性，所以 validateSchema 传递 false
        return converter.convertToBpmnModel(new BytesStreamSource(bpmnBytes), false, false);
    }

    public static String getBpmnXml(BpmnModel model) {
        if (model == null) {
            return null;
        }
        BpmnXMLConverter converter = new BpmnXMLConverter();
        return new String(converter.convertToXML(model));
    }

    // ========== 遍历相关的方法 ==========

    /**
     * 找到 source 节点之前的所有用户任务节点
     *
     * @param source          起始节点
     * @param hasSequenceFlow 已经经过的连线的 ID，用于判断线路是否重复
     * @param userTaskList    已找到的用户任务节点
     * @return 用户任务节点 数组
     */
    public static List<UserTask> getPreviousUserTaskList(FlowElement source, Set<String> hasSequenceFlow, List<UserTask> userTaskList) {
        userTaskList = userTaskList == null ? new ArrayList<>() : userTaskList;
        hasSequenceFlow = hasSequenceFlow == null ? new HashSet<>() : hasSequenceFlow;
        // 如果该节点为开始节点，且存在上级子节点，则顺着上级子节点继续迭代
        if (source instanceof StartEvent && source.getSubProcess() != null) {
            userTaskList = getPreviousUserTaskList(source.getSubProcess(), hasSequenceFlow, userTaskList);
        }

        // 根据类型，获取入口连线
        List<SequenceFlow> sequenceFlows = getElementIncomingFlows(source);
        if (sequenceFlows == null) {
            return userTaskList;
        }
        // 循环找到目标元素
        for (SequenceFlow sequenceFlow : sequenceFlows) {
            // 如果发现连线重复，说明循环了，跳过这个循环
            if (hasSequenceFlow.contains(sequenceFlow.getId())) {
                continue;
            }
            // 添加已经走过的连线
            hasSequenceFlow.add(sequenceFlow.getId());
            // 类型为用户节点，则新增父级节点
            if (sequenceFlow.getSourceFlowElement() instanceof UserTask) {
                userTaskList.add((UserTask) sequenceFlow.getSourceFlowElement());
            }
            // 类型为子流程，则添加子流程开始节点出口处相连的节点
            if (sequenceFlow.getSourceFlowElement() instanceof SubProcess) {
                // 获取子流程用户任务节点
                List<UserTask> childUserTaskList = findChildProcessUserTaskList((StartEvent) ((SubProcess) sequenceFlow.getSourceFlowElement()).getFlowElements().toArray()[0], null, null);
                // 如果找到节点，则说明该线路找到节点，不继续向下找，反之继续
                if (CollUtil.isNotEmpty(childUserTaskList)) {
                    userTaskList.addAll(childUserTaskList);
                }
            }
            // 继续迭代
            userTaskList = getPreviousUserTaskList(sequenceFlow.getSourceFlowElement(), hasSequenceFlow, userTaskList);
        }
        return userTaskList;
    }

    /**
     * 迭代获取子流程用户任务节点
     *
     * @param source          起始节点
     * @param hasSequenceFlow 已经经过的连线的 ID，用于判断线路是否重复
     * @param userTaskList    需要撤回的用户任务列表
     * @return 用户任务节点
     */
    public static List<UserTask> findChildProcessUserTaskList(FlowElement source, Set<String> hasSequenceFlow, List<UserTask> userTaskList) {
        hasSequenceFlow = hasSequenceFlow == null ? new HashSet<>() : hasSequenceFlow;
        userTaskList = userTaskList == null ? new ArrayList<>() : userTaskList;

        // 根据类型，获取出口连线
        List<SequenceFlow> sequenceFlows = getElementOutgoingFlows(source);
        if (sequenceFlows == null) {
            return userTaskList;
        }
        // 循环找到目标元素
        for (SequenceFlow sequenceFlow : sequenceFlows) {
            // 如果发现连线重复，说明循环了，跳过这个循环
            if (hasSequenceFlow.contains(sequenceFlow.getId())) {
                continue;
            }
            // 添加已经走过的连线
            hasSequenceFlow.add(sequenceFlow.getId());
            // 如果为用户任务类型，且任务节点的 Key 正在运行的任务中存在，添加
            if (sequenceFlow.getTargetFlowElement() instanceof UserTask) {
                userTaskList.add((UserTask) sequenceFlow.getTargetFlowElement());
                continue;
            }
            // 如果节点为子流程节点情况，则从节点中的第一个节点开始获取
            if (sequenceFlow.getTargetFlowElement() instanceof SubProcess) {
                List<UserTask> childUserTaskList = findChildProcessUserTaskList((FlowElement) (((SubProcess) sequenceFlow.getTargetFlowElement()).getFlowElements().toArray()[0]), hasSequenceFlow, null);
                // 如果找到节点，则说明该线路找到节点，不继续向下找，反之继续
                if (CollUtil.isNotEmpty(childUserTaskList)) {
                    userTaskList.addAll(childUserTaskList);
                    continue;
                }
            }
            // 继续迭代
            userTaskList = findChildProcessUserTaskList(sequenceFlow.getTargetFlowElement(), hasSequenceFlow, userTaskList);
        }
        return userTaskList;
    }


    /**
     * 迭代从后向前扫描，判断目标节点相对于当前节点是否是串行
     * 不存在直接回退到子流程中的情况，但存在从子流程出去到父流程情况
     *
     * @param source          起始节点
     * @param target          目标节点
     * @param visitedElements 已经经过的连线的 ID，用于判断线路是否重复
     * @return 结果
     */
    public static boolean isSequentialReachable(FlowElement source, FlowElement target, Set<String> visitedElements) {
        visitedElements = visitedElements == null ? new HashSet<>() : visitedElements;
        // 不能是开始事件和子流程
        if (source instanceof StartEvent && isInEventSubprocess(source)) {
            return false;
        }

        // 根据类型，获取入口连线
        List<SequenceFlow> sequenceFlows = getElementIncomingFlows(source);
        if (CollUtil.isEmpty(sequenceFlows)) {
            return true;
        }
        // 循环找到目标元素
        for (SequenceFlow sequenceFlow : sequenceFlows) {
            // 如果发现连线重复，说明循环了，跳过这个循环
            if (visitedElements.contains(sequenceFlow.getId())) {
                continue;
            }
            // 添加已经走过的连线
            visitedElements.add(sequenceFlow.getId());
            // 这条线路存在目标节点，这条线路完成，进入下个线路
            FlowElement sourceFlowElement = sequenceFlow.getSourceFlowElement();
            if (target.getId().equals(sourceFlowElement.getId())) {
                continue;
            }
            // 如果目标节点为并行网关，则不继续
            if (sourceFlowElement instanceof ParallelGateway) {
                return false;
            }
            // 否则就继续迭代
            if (!isSequentialReachable(sourceFlowElement, target, visitedElements)) {
                return false;
            }
        }
        return true;
    }

    /**
     * 判断当前节点是否属于不同的子流程
     *
     * @param flowElement 被判断的节点
     * @return true 表示属于子流程
     */
    private static boolean isInEventSubprocess(FlowElement flowElement) {
        FlowElementsContainer flowElementsContainer = flowElement.getParentContainer();
        while (flowElementsContainer != null) {
            if (flowElementsContainer instanceof EventSubProcess) {
                return true;
            }

            if (flowElementsContainer instanceof FlowElement) {
                flowElementsContainer = ((FlowElement) flowElementsContainer).getParentContainer();
            } else {
                flowElementsContainer = null;
            }
        }
        return false;
    }

    /**
     * 根据正在运行的任务节点，迭代获取子级任务节点列表，向后找
     *
     * @param source          起始节点
     * @param runTaskKeyList  正在运行的任务 Key，用于校验任务节点是否是正在运行的节点
     * @param hasSequenceFlow 已经经过的连线的 ID，用于判断线路是否重复
     * @param userTaskList    需要撤回的用户任务列表
     * @return 子级任务节点列表
     */
    public static List<UserTask> iteratorFindChildUserTasks(FlowElement source, List<String> runTaskKeyList,
                                                            Set<String> hasSequenceFlow, List<UserTask> userTaskList) {
        hasSequenceFlow = hasSequenceFlow == null ? new HashSet<>() : hasSequenceFlow;
        userTaskList = userTaskList == null ? new ArrayList<>() : userTaskList;
        // 如果该节点为开始节点，且存在上级子节点，则顺着上级子节点继续迭代
        if (source instanceof StartEvent && source.getSubProcess() != null) {
            userTaskList = iteratorFindChildUserTasks(source.getSubProcess(), runTaskKeyList, hasSequenceFlow, userTaskList);
        }

        // 根据类型，获取出口连线
        List<SequenceFlow> sequenceFlows = getElementOutgoingFlows(source);
        if (sequenceFlows == null) {
            return userTaskList;
        }
        // 循环找到目标元素
        for (SequenceFlow sequenceFlow : sequenceFlows) {
            // 如果发现连线重复，说明循环了，跳过这个循环
            if (hasSequenceFlow.contains(sequenceFlow.getId())) {
                continue;
            }
            // 添加已经走过的连线
            hasSequenceFlow.add(sequenceFlow.getId());
            // 如果为用户任务类型，且任务节点的 Key 正在运行的任务中存在，添加
            if (sequenceFlow.getTargetFlowElement() instanceof UserTask && runTaskKeyList.contains((sequenceFlow.getTargetFlowElement()).getId())) {
                userTaskList.add((UserTask) sequenceFlow.getTargetFlowElement());
                continue;
            }
            // 如果节点为子流程节点情况，则从节点中的第一个节点开始获取
            if (sequenceFlow.getTargetFlowElement() instanceof SubProcess) {
                List<UserTask> childUserTaskList = iteratorFindChildUserTasks((FlowElement) (((SubProcess) sequenceFlow.getTargetFlowElement()).getFlowElements().toArray()[0]), runTaskKeyList, hasSequenceFlow, null);
                // 如果找到节点，则说明该线路找到节点，不继续向下找，反之继续
                if (CollUtil.isNotEmpty(childUserTaskList)) {
                    userTaskList.addAll(childUserTaskList);
                    continue;
                }
            }
            // 继续迭代
            userTaskList = iteratorFindChildUserTasks(sequenceFlow.getTargetFlowElement(), runTaskKeyList, hasSequenceFlow, userTaskList);
        }
        return userTaskList;
    }

    // ========== TODO 芋艿：这里得捉摸下； ==========

    /**
     * 仿钉钉流程设计模型数据结构(json) 转换成 Bpmn Model (待完善）
     *
     * @param processId       流程标识
     * @param processName     流程名称
     * @param simpleModelNode 仿钉钉流程设计模型数据结构
     * @return Bpmn Model
     */
    public static BpmnModel convertSimpleModelToBpmnModel(String processId, String processName, BpmSimpleModelNodeVO simpleModelNode) {
        BpmnModel bpmnModel = new BpmnModel();
        Process mainProcess = new Process();
        mainProcess.setId(processId);
        mainProcess.setName(processName);
        mainProcess.setExecutable(Boolean.TRUE);
        bpmnModel.addProcess(mainProcess);
        // 前端模型数据结构。 有 start event 节点. 没有 end event 节点。
        // 添加 FlowNode
        addBpmnFlowNode(mainProcess, simpleModelNode);
        // 单独添加 end event 节点
        addBpmnEndEventNode(mainProcess);
        // 添加节点之间的连线 Sequence Flow
        addBpmnSequenceFlow(mainProcess, simpleModelNode, BpmnModelConstants.END_EVENT_ID);
        // 自动布局
        new BpmnAutoLayout(bpmnModel).execute();
        return bpmnModel;
    }

    private static void addBpmnSequenceFlow(Process mainProcess, BpmSimpleModelNodeVO node, String endId) {
        // 节点为 null 退出
        if (node == null || node.getId() == null) {
            return;
        }
        BpmSimpleModelNodeVO childNode = node.getChildNode();
        // 如果不是网关节点、且后续节点为 null. 添加与结束节点的连线
        if (!BpmSimpleModelNodeType.isGatewayNode(node.getType()) && (childNode == null || childNode.getId() == null)) {
            addBpmnSequenceFlowElement(mainProcess, node.getId(), endId, null, null);
            return;
        }
        BpmSimpleModelNodeType nodeType = BpmSimpleModelNodeType.valueOf(node.getType());
        Assert.notNull(nodeType, "模型节点类型不支持");
        switch (nodeType) {
            case START_EVENT_NODE:
            case APPROVE_USER_NODE:
            case SCRIPT_TASK_NODE: {
                addBpmnSequenceFlowElement(mainProcess, node.getId(), childNode.getId(), null, null);
                // 递归调用后续节点
                addBpmnSequenceFlow(mainProcess, childNode, endId);
                break;
            }
            case EXCLUSIVE_GATEWAY_NODE: {
                String gateWayEndId = (childNode == null || childNode.getId() == null) ? BpmnModelConstants.END_EVENT_ID : childNode.getId();
                List<BpmSimpleModelNodeVO> conditionNodes = node.getConditionNodes();
                Assert.notEmpty(conditionNodes, "网关节点的条件节点不能为空");
                for (int i = 0; i < conditionNodes.size(); i++) {
                    BpmSimpleModelNodeVO item = conditionNodes.get(i);
                    BpmSimpleModelNodeVO nextNodeOnCondition = item.getChildNode();
                    if (nextNodeOnCondition != null && nextNodeOnCondition.getId() != null) {
                        addBpmnSequenceFlowElement(mainProcess, node.getId(), nextNodeOnCondition.getId(),
                                String.format("%s_SequenceFlow_%d", node.getId(), i + 1), null);
                        addBpmnSequenceFlow(mainProcess, nextNodeOnCondition, gateWayEndId);
                    } else {
                        addBpmnSequenceFlowElement(mainProcess, node.getId(), gateWayEndId,
                                String.format("%s_SequenceFlow_%d", node.getId(), i + 1), null);
                    }
                }
                // 递归调用后续节点
                addBpmnSequenceFlow(mainProcess, childNode, endId);
                break;
            }
            default: {
                // TODO 其它节点类型的实现
            }
        }

    }

    private static void addBpmnSequenceFlowElement(Process mainProcess, String sourceId, String targetId, String seqFlowId, String conditionExpression) {
        SequenceFlow sequenceFlow = new SequenceFlow(sourceId, targetId);
        if (StrUtil.isNotEmpty(conditionExpression)) {
            sequenceFlow.setConditionExpression(conditionExpression);
        }
        if (StrUtil.isNotEmpty(seqFlowId)) {
            sequenceFlow.setId(seqFlowId);
        }
        mainProcess.addFlowElement(sequenceFlow);
    }

    private static void addBpmnFlowNode(Process mainProcess, BpmSimpleModelNodeVO simpleModelNode) {
        // 节点为 null 退出
        if (simpleModelNode == null || simpleModelNode.getId() == null) {
            return;
        }
        BpmSimpleModelNodeType nodeType = BpmSimpleModelNodeType.valueOf(simpleModelNode.getType());
        Assert.notNull(nodeType, "模型节点类型不支持");
        switch (nodeType) {
            case START_EVENT_NODE:
                addBpmnStartEventNode(mainProcess, simpleModelNode);
                break;
            case APPROVE_USER_NODE:
                addBpmnUserTaskNode(mainProcess, simpleModelNode);
                break;
            case SCRIPT_TASK_NODE:
                addBpmnScriptTaSskNode(mainProcess, simpleModelNode);
                break;
            case EXCLUSIVE_GATEWAY_NODE:
                addBpmnExclusiveGatewayNode(mainProcess, simpleModelNode);
                break;
            default: {
                // TODO 其它节点类型的实现
            }
        }

        // 如果不是网关类型的接口， 并且chileNode为空退出
        if (!BpmSimpleModelNodeType.isGatewayNode(simpleModelNode.getType()) && simpleModelNode.getChildNode() == null) {
            return;
        }

        // 如果是网关类型接口. 递归添加条件节点
        if (BpmSimpleModelNodeType.isGatewayNode(simpleModelNode.getType()) && ArrayUtil.isNotEmpty(simpleModelNode.getConditionNodes())) {
            for (BpmSimpleModelNodeVO node : simpleModelNode.getConditionNodes()) {
                addBpmnFlowNode(mainProcess, node.getChildNode());
            }
        }

        // chileNode不为空，递归添加子节点
        if (simpleModelNode.getChildNode() != null) {
            addBpmnFlowNode(mainProcess, simpleModelNode.getChildNode());
        }
    }

    private static void addBpmnScriptTaSskNode(Process mainProcess, BpmSimpleModelNodeVO node) {
        ScriptTask scriptTask = new ScriptTask();
        scriptTask.setId(node.getId());
        scriptTask.setName(node.getName());
        scriptTask.setScriptFormat(ScriptingEngines.DEFAULT_SCRIPTING_LANGUAGE);
        scriptTask.setScript(BPMN_SIMPLE_COPY_EXECUTION_SCRIPT);
        // 添加自定义属性
        addExtensionAttributes(node, scriptTask);
        mainProcess.addFlowElement(scriptTask);
    }

    private static void addExtensionAttributes(BpmSimpleModelNodeVO node, FlowElement flowElement) {
        Integer candidateStrategy = MapUtil.getInt(node.getAttributes(), BpmnModelConstants.USER_TASK_CANDIDATE_STRATEGY);
        addExtensionAttributes(flowElement, BpmnModelConstants.NAMESPACE, BpmnModelConstants.USER_TASK_CANDIDATE_STRATEGY,
                candidateStrategy == null ? null : String.valueOf(candidateStrategy));
        addExtensionAttributes(flowElement, BpmnModelConstants.NAMESPACE, BpmnModelConstants.USER_TASK_CANDIDATE_PARAM,
                MapUtil.getStr(node.getAttributes(), BpmnModelConstants.USER_TASK_CANDIDATE_PARAM));
    }

    private static void addBpmnExclusiveGatewayNode(Process mainProcess, BpmSimpleModelNodeVO node) {
        Assert.notEmpty(node.getConditionNodes(), "网关节点的条件节点不能为空");
        ExclusiveGateway exclusiveGateway = new ExclusiveGateway();
        exclusiveGateway.setId(node.getId());
        // 条件节点的最后一个条件为 网关的 default sequence flow
        exclusiveGateway.setDefaultFlow(String.format("%s_SequenceFlow_%d", node.getId(), node.getConditionNodes().size()));
        mainProcess.addFlowElement(exclusiveGateway);
    }

    private static void addBpmnEndEventNode(Process mainProcess) {
        EndEvent endEvent = new EndEvent();
        endEvent.setId(BpmnModelConstants.END_EVENT_ID);
        endEvent.setName("结束");
        mainProcess.addFlowElement(endEvent);
    }

    private static void addBpmnUserTaskNode(Process mainProcess, BpmSimpleModelNodeVO node) {
        UserTask userTask = new UserTask();
        userTask.setId(node.getId());
        userTask.setName(node.getName());
        addExtensionAttributes(node, userTask);
        mainProcess.addFlowElement(userTask);
    }

    private static void addExtensionAttributes(FlowElement element, String namespace, String name, String value) {
        if (value == null) {
            return;
        }
        ExtensionAttribute extensionAttribute = new ExtensionAttribute(name, value);
        extensionAttribute.setNamespace(namespace);
        extensionAttribute.setNamespacePrefix(FLOWABLE_EXTENSIONS_PREFIX);
        element.addAttribute(extensionAttribute);
    }

    private static void addBpmnStartEventNode(Process mainProcess, BpmSimpleModelNodeVO node) {
        StartEvent startEvent = new StartEvent();
        startEvent.setId(node.getId());
        startEvent.setName(node.getName());
        mainProcess.addFlowElement(startEvent);
    }

}
