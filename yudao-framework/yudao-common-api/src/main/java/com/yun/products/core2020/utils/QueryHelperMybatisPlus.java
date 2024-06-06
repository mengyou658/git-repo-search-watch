package com.yun.products.core2020.utils;

import cn.hutool.cache.CacheUtil;
import cn.hutool.cache.impl.FIFOCache;
import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.ReflectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.conditions.AbstractWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.yun.products.core2020.annotations.BindEntity;
import com.yun.products.core2020.annotations.Query;
import com.yun.products.core2020.model.BindEntityInfo;
import com.yun.products.core2020.model.QueryParam;
import com.yun.products.core2020.mybatisplus.exceptions.BadException;
import com.yun.products.core2020.mybatisplus.wrapper.JoinQueryWrapper;
import lombok.extern.slf4j.Slf4j;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class QueryHelperMybatisPlus {
    protected static final FIFOCache<Class, Map<String, List<BindEntityInfo>>> CACHE_JOIN_INFO = CacheUtil.newFIFOCache(100, DateUnit.DAY.getMillis());

    /**
     * mybatis-plus QueryWrapper构造方法
     *
     * @param criteria 实现`Criteria`接口的查询实体
     */
    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, QueryWrapper<T>> buildQuery(Q criteria, Class<T> clazz) {
        try {
            return buildQuery(new QueryWrapper<T>(clazz.getDeclaredConstructor().newInstance()), null, criteria);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, QueryWrapper<T>> getPredicate(Q criteria, Class<T> clazz) {
        try {
            return buildQuery(new QueryWrapper<T>(clazz.getDeclaredConstructor().newInstance()), null, criteria);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, QueryWrapper<T>> buildQuery(QueryWrapper<T> queryWrapper, Q criteria) {
        return buildQuery(queryWrapper, null, criteria);
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, UpdateWrapper<T>> buildUpdateQuery(Q criteria, Class<T> clazz) {
        try {
            return buildQuery(new UpdateWrapper<T>(clazz.getDeclaredConstructor().newInstance()), null, criteria);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, UpdateWrapper<T>> getUpdatePredicate(Q criteria, Class<T> clazz) {
        try {
            return buildQuery(new UpdateWrapper<T>(clazz.getDeclaredConstructor().newInstance()), null, criteria);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, UpdateWrapper<T>> buildUpdateQuery(UpdateWrapper<T> queryWrapper, Q criteria) {
        return buildQuery(queryWrapper, null, criteria);
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, QueryWrapper<T>> buildJoinQuery(Class<T> entityClass, Q criteria) {
        return buildQuery(new JoinQueryWrapper<T>(), entityClass, criteria);
    }

    public static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, Children> buildQuery(AbstractWrapper<T, String, Children> queryWrapper, Class<T> entityClass, Q criteria) {
        if (criteria != null) {

            final Class<?> typeClass = criteria.getClass();
            // 包含父级字段
            final Field[] fields = ReflectUtil.getFields(typeClass);
            for (Field field : fields) {

                int modifiers = field.getModifiers();
                if (Modifier.isStatic(modifiers) || Modifier.isTransient(modifiers)) {
                    continue;
                }

                // 获取字段所有注解
                Query annotation = AnnotationUtil.getAnnotation(field, Query.class);
                if (null == annotation) {
                    continue;
                }
                List<Query> queryList = Arrays.asList(annotation);
                Object value = ReflectUtil.getFieldValue(criteria, field);

                for (Query query : queryList) {
                    List<String> colNames = new ArrayList<>();
                    List<String> colNamesTmp = Arrays.asList(query.propName());
                    if (CollUtil.isNotEmpty(colNamesTmp)) {
                        colNamesTmp.stream().filter(it -> StrUtil.isNotBlank(it)).forEach(it -> {
                            colNames.add(StrUtil.toUnderlineCase(it.trim()));
                        });
                    } else {
                        colNames.add(StrUtil.toUnderlineCase(field.getName()));
                    }

                    String blurry = query.blurry();

                    if (CollUtil.isEmpty(colNames) && ObjectUtil.isEmpty(blurry)) {
                        continue;
                    }
                    // 多字段模糊查询
                    if (value == null || (value instanceof Collection && CollUtil.isEmpty((Collection) value))) {
                        continue;
                    }

                    // 模糊多字段
                    if (ObjectUtil.isNotEmpty(blurry)) {
                        String[] blurrys = blurry.split(",");
                        //queryWrapper.or();
                        queryWrapper.and(wrapper -> {
                            for (String blurry1 : blurrys) {
                                String column = StrUtil.toUnderlineCase(blurry1);
                                wrapper.or();
                                wrapper.like(column, value);
                            }
                        });
                        continue;
                    }

                    // 为空不在这里处理
                    if (!StringPool.EMPTY.equals(value) || ( value instanceof String && StrUtil.isNotBlank((String) value))) {
                        queryWrapper = getQueryWrapper(queryWrapper, value, query, colNames);
                    }
                    // 这里处理为空的逻辑
                    queryWrapper = getQueryWrapperExtra(queryWrapper, query, colNames);

                    buildQueryOverride(field, query, colNames, queryWrapper, entityClass, criteria);
                }
            }

        }

        // join 逻辑
        genJoin(queryWrapper, entityClass, criteria);

        return queryWrapper;
    }

    protected static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, Children> getQueryWrapperExtra(AbstractWrapper<T, String, Children> queryWrapper, Query query, List<String> colNames) {
        switch (query.type()) {
            case IS_NULL:
                queryWrapper = queryWrapper.and(qu -> {
                    colNames.forEach(it -> {
                        qu.or().isNull(it);
                    });
                });
                break;
            case IS_NULL_OR_EMPTY:
                queryWrapper = queryWrapper.and(qu -> {
                    colNames.forEach(it -> {
                        qu.or().isNull(it).or().eq(it, StringPool.EMPTY);
                    });
                });
                break;
            case IS_NOT_NULL:
                queryWrapper = queryWrapper.and(qu -> {
                    colNames.forEach(it -> {
                        qu.or().isNotNull(it);
                    });
                });
                break;
            case IS_NOT_NULL_AND_NOT_EMPTY:
                queryWrapper = queryWrapper.and(qu -> {
                    colNames.forEach(it -> {
                        qu.or().isNotNull(it).ne(it, StringPool.EMPTY);
                    });
                });
                break;
        }
        return queryWrapper;
    }

    protected static <Q, T, Children extends AbstractWrapper<T, String, Children>> AbstractWrapper<T, String, Children> getQueryWrapper(AbstractWrapper<T, String, Children> queryWrapper, Object value, Query query, List<String> colNames) {
        switch (query.type()) {
            case LIKE:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().like(it, value);
                    });
                });
                break;
            case LIKE_LEFT:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().likeLeft(it, value);
                    });
                });
                break;
            case LIKE_RIGHT:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().likeRight(it, value);
                    });
                });
                break;
            case IN:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        if (value instanceof Collection) {
                            qu.or().in(it, (Collection) value);
                        } else if (value instanceof String && StrUtil.isNotBlank(query.separator()) && StrUtil.contains((String) value, query.separator())) {
                            List<String> strings = StrUtil.splitTrim((String) value, query.separator());
                            qu.or().in(it, strings);
                        } else {
                            qu.or().in(it, value);
                        }
                    });
                });
                break;
            case NOT_IN:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        if (value instanceof Collection) {
                            qu.or().notIn(it, (Collection) value);
                        } else if (value instanceof String && StrUtil.isNotBlank(query.separator()) && StrUtil.contains((String) value, query.separator())) {
                            List<String> strings = StrUtil.splitTrim((String) value, query.separator());
                            qu.or().notIn(it, strings);
                        } else {
                            qu.or().notIn(it, value);
                        }
                    });
                });
                break;
            case GT:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().gt(it, value);
                    });
                });
                break;
            case GE:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().ge(it, value);
                    });
                });
                break;
            case LE:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().le(it, value);
                    });
                });
                break;
            case LT:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().lt(it, value);
                    });
                });
                break;
            case NOT_LIKE:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().notLike(it, value);
                    });
                });
                break;
            case BETWEEN:
                boolean betweenFlag = false;
                if ((value instanceof Collection && ((Collection) value).size() > 0) || (value instanceof Object[] && ((Object[])value).length > 0)) {
                    betweenFlag = true;
                } else if (value instanceof String && StrUtil.isNotBlank((String)value)) {
                    betweenFlag = true;
                }
                queryWrapper = queryWrapper.and(betweenFlag, qu -> {
                    colNames.forEach(it -> {
                        Children or = qu.or();
                        if (value instanceof Collection) {
                            List valueTmp = new ArrayList((Collection) value);
                            Object start = null;
                            Object end = null;
                            if (valueTmp.size() == 1) {
                                start = valueTmp.get(0);
                            } else if (valueTmp.size() >= 2) {
                                start = valueTmp.get(0);
                                end = valueTmp.get(1);
                            }
                            if (null != start) {
                                or.ge(it, start);
                            }
                            if (null != end) {
                                or.le(it, end);
                            }
                        } else if (value instanceof Object[]) {
                            List valueTmp = CollUtil.newArrayList((Object[]) value);
                            Object start = null;
                            Object end = null;
                            if (valueTmp.size() == 1) {
                                start = valueTmp.get(0);
                            } else if (valueTmp.size() >= 2) {
                                start = valueTmp.get(0);
                                end = valueTmp.get(1);
                            }
                            if (null != start) {
                                or.ge(it, start);
                            }
                            if (null != end) {
                                or.le(it, end);
                            }
                        } else if (value instanceof String && StrUtil.isNotBlank(query.separator())) {
                            String start = null;
                            String end = null;
                            if (StrUtil.contains((String) value, query.separator())) {
                                List<String> valueTmp = StrUtil.splitTrim((String) value, query.separator());
                                if (valueTmp.size() == 1) {
                                    start = valueTmp.get(0);
                                } else if (valueTmp.size() >= 2) {
                                    start = valueTmp.get(0);
                                    end = valueTmp.get(1);
                                }
                            } else {
                                start = (String) value;
                            }
                            if (null != start) {
                                or.ge(it, start);
                            }
                            if (null != end) {
                                or.le(it, end);
                            }
                        } else {
                            log.warn("Query.Type.BETWEEN 使用方式错误：List数据，或者String使用Query.separator分割数据");
                        }
                    });
                });
                break;
            case NE:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().ne(it, value);
                    });
                });
                break;
            case EQ:
                queryWrapper = queryWrapper.and(ObjectUtil.isNotEmpty(value), qu -> {
                    colNames.forEach(it -> {
                        qu.or().eq(it, value);
                    });
                });
                break;
        }
        return queryWrapper;
    }

    protected static <T, Q, Children extends AbstractWrapper<T, String, Children>> void buildQueryOverride(Field field, Query query, List<String> colNames, AbstractWrapper<T, String, Children> queryWrapper, Class<T> entityClass, Q criteria) {
        // 覆盖实现
    }

    protected static <Q, T, Children extends AbstractWrapper<T, String, Children>> void genJoin(AbstractWrapper<T, String, Children> queryWrapper, Class<T> entityClass, Q criteria) {
        if (!(queryWrapper instanceof JoinQueryWrapper)) {
            return;
        }
        JoinQueryWrapper joinQueryWrapper = (JoinQueryWrapper) queryWrapper;
        if (null == entityClass) {
            log.warn("JoinQueryWrapper需要传递entityClass参数，此处忽略join查询");
            return;
        }
        boolean extraFlag = null != entityClass;

        if (criteria instanceof QueryParam) {

        }
        String queryJoinGroup = (criteria instanceof QueryParam) ? ((QueryParam) criteria).getQueryJoinGroup() : BindEntity.QueryGroup.DEFAULT;

        // join 逻辑
        Map<String, List<BindEntityInfo>> bindEntityMap = null;
        if (extraFlag) {
            bindEntityMap = CACHE_JOIN_INFO.get(entityClass);
            if (null == bindEntityMap) {
                bindEntityMap = getBindEntityMap(entityClass);
            }
            if (CollUtil.isNotEmpty(bindEntityMap)) {
                List<BindEntityInfo> bindEntityInfos = bindEntityMap.get(queryJoinGroup);
                if (CollUtil.isNotEmpty(bindEntityInfos)) {
                    List<String> sqlSelectJoinList = new ArrayList<>();
                    List<String> sqlFromJoinList = new ArrayList<>();
                    List<String> extraWhereList = new ArrayList<>();
                    // Map<String, Integer> tableAliaMap = new HashMap<>();
                    bindEntityInfos.forEach(it -> {
                        // TODO 设置join
                        BindEntity bindEntity = it.getBindEntity();

                        // select 片段
                        String tableName = getTableName(bindEntity.value());
                        String tableAlias = bindEntity.tableAlias();
                        if (StrUtil.isBlank(tableAlias)) {
                            throw new BadException("BindEntity tableAlias 连表别名不能为空");
                                /*Integer idx = tableAliaMap.get(tableName);
                                if (idx != null) {
                                    tableAlias = tableName + (++idx);
                                } else {
                                    idx = 0;
                                    tableAlias = tableName;
                                }
                                tableAliaMap.put(tableName, idx);*/
                        }
                        String[] queryFields = bindEntity.queryFields();
                        if (ArrayUtil.isAllEmpty(queryFields)) {
                            throw new BadException("BindEntity queryFields 不能为空");
                        }
                        if (ArrayUtil.contains(queryFields, StringPool.STAR)) {
                            queryFields = getAllFields(bindEntity.value());
                        }

                        for (String queryField : queryFields) {
                            if (queryField.indexOf(StringPool.DOT) == -1) {
                                sqlSelectJoinList.add(String.format("%s.%s %s_%s", tableAlias, queryField, tableAlias, queryField));
                            } else {
                                sqlSelectJoinList.add(queryField);
                            }
                        }

                        String joinCondition = bindEntity.joinCondition();
                        if (StrUtil.isBlank(joinCondition)) {
                            throw new BadException("BindEntity joinCondition：on条件不能为空");
                        }
                        String joinStr = "";
                        switch (bindEntity.joinType()) {
                            case LEFT:
                                joinStr = "left outer join";
                                break;
                            case RIGHT:
                                joinStr = "right outer join";
                                break;
                            case INNER:
                                joinStr = "inner join";
                                break;

                        }
                        sqlFromJoinList.add(String.format(" %s %s %s on %s", joinStr, tableName, tableAlias, joinCondition));

                        // extraWhereList
                        String extraWhere = bindEntity.extraWhere();
                        if (StrUtil.isNotBlank(extraWhere)) {
                            String str = StrUtil.subAfter(extraWhere.trim().toLowerCase(), StringPool.AND, false);
                            extraWhereList.add(str);
                        }
                    });

                    joinQueryWrapper.setSqlSelectJoin(CollUtil.join(sqlSelectJoinList, StringPool.COMMA));
                    joinQueryWrapper.setSqlFromJoin(CollUtil.join(sqlFromJoinList, StringPool.SPACE));
                    joinQueryWrapper.setExtraWhere(CollUtil.join(extraWhereList, StringPool.AND));
                    joinQueryWrapper.setExtraParam(criteria);
                }
            }
        }
    }

    protected static String getTableName(Class<?> cls) {
        TableName annotation = AnnotationUtil.getAnnotation(cls, TableName.class);
        String tableName = annotation.value();
        if (StrUtil.isBlank(tableName)) {
            tableName = StrUtil.toUnderlineCase(cls.getSimpleName()).toLowerCase();
        }
        String[] split = tableName.split(StringPool.SPACE);
        if (split.length > 1) {
            tableName = split[0];
        }
        String schema = annotation.schema();
        if (StrUtil.isNotBlank(schema)) {
            return String.format("%s.%s", schema, tableName);
        }
        return tableName;
    }

    protected static String[] getAllFields(Class<?> cls) {
        List<String> resList = new ArrayList<>();
        Field[] fields = ReflectUtil.getFields(cls);
        String fieldName = null;
        for (Field field : fields) {
            TableField tableField = AnnotationUtil.getAnnotation(field, TableField.class);
            if (null != tableField) {
                if (tableField.exist()) {
                    fieldName = tableField.value();
                    if (StrUtil.isBlank(fieldName)) {
                        fieldName = StrUtil.toUnderlineCase(field.getName());
                    }
                    List<String> split = StrUtil.split(fieldName, StringPool.DOT);
                    resList.add(split.get(split.size() - 1));
                }
            } else {
                TableId tableId = AnnotationUtil.getAnnotation(field, TableId.class);
                fieldName = tableId.value();
                if (StrUtil.isBlank(fieldName)) {
                    fieldName = StrUtil.toUnderlineCase(field.getName());
                }
                List<String> split = StrUtil.split(fieldName, StringPool.DOT);
                resList.add(split.get(split.size() - 1));
            }
        }
        return resList.toArray(new String[0]);
    }

    protected static <T> Map<String, List<BindEntityInfo>> getBindEntityMap(Class<T> entityClass) {
        Map<String, List<BindEntityInfo>> bindEntityMap = new HashMap<>();
        Field[] fields = ReflectUtil.getFields(entityClass);
        for (Field field : fields) {
            int modifiers = field.getModifiers();
            if (Modifier.isStatic(modifiers) || Modifier.isTransient(modifiers)) {
                continue;
            }
            Annotation[] annotations = AnnotationUtil.getAnnotations(field, false);
            if (ArrayUtil.isNotEmpty(annotations)) {
                for (Annotation annotation : annotations) {
                    if (annotation instanceof BindEntity) {
                        BindEntity bindEntity = (BindEntity) annotation;
                        String[] group = bindEntity.queryJoinGroup();
                        if (ArrayUtil.isNotEmpty(group)) {
                            for (String g : group) {
                                List<BindEntityInfo> bindEntities = bindEntityMap.get(g);
                                BindEntityInfo build = BindEntityInfo.builder().bindEntity(bindEntity).field(field).group(g).build();
                                if (CollUtil.isEmpty(bindEntities)) {
                                    bindEntities = new ArrayList<>();
                                    bindEntities.add(build);
                                    bindEntityMap.put(g, bindEntities);
                                } else {
                                    // 查询是否有重复的
                                    boolean dupFlag = false;
                                    for (int i = 0; i < bindEntities.size(); i++) {
                                        BindEntityInfo entity = bindEntities.get(i);
                                        if (entity.getField().equals(field) && entity.getGroup().equals(g)) {
                                            log.warn("字段{}分组{}存在重复的BindEntity配置", field.getName(), g);
                                            bindEntities.set(i, build);
                                            dupFlag = true;
                                            break;
                                        }
                                    }
                                    if (!dupFlag) {
                                        bindEntities.add(build);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return bindEntityMap;
    }

}
