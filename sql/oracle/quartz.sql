/*
 注意：仅仅需要 Quartz 定时任务的场景，可选！！！

 Date: 15/06/2022 08:20:08
*/

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE "QRTZ_BLOB_TRIGGERS";
CREATE TABLE "QRTZ_BLOB_TRIGGERS" (
                                      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                      "BLOB_DATA" BLOB
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE "QRTZ_CALENDARS";
CREATE TABLE "QRTZ_CALENDARS" (
                                  "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                  "CALENDAR_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                  "CALENDAR" BLOB NOT NULL
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE "QRTZ_CRON_TRIGGERS";
CREATE TABLE "QRTZ_CRON_TRIGGERS" (
                                      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                      "CRON_EXPRESSION" VARCHAR2(120 BYTE) NOT NULL,
                                      "TIME_ZONE_ID" VARCHAR2(80 BYTE)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO "QRTZ_CRON_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP", "CRON_EXPRESSION", "TIME_ZONE_ID") VALUES ('schedulerName', 'userSessionTimeoutJob', 'DEFAULT', '0 * * * * ? *', 'Asia/Shanghai');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE "QRTZ_FIRED_TRIGGERS";
CREATE TABLE "QRTZ_FIRED_TRIGGERS" (
                                       "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                       "ENTRY_ID" VARCHAR2(95 BYTE) NOT NULL,
                                       "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                       "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                       "INSTANCE_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                       "FIRED_TIME" NUMBER(13,0) NOT NULL,
                                       "SCHED_TIME" NUMBER(13,0) NOT NULL,
                                       "PRIORITY" NUMBER(13,0) NOT NULL,
                                       "STATE" VARCHAR2(16 BYTE) NOT NULL,
                                       "JOB_NAME" VARCHAR2(200 BYTE),
                                       "JOB_GROUP" VARCHAR2(200 BYTE),
                                       "IS_NONCONCURRENT" VARCHAR2(1 BYTE),
                                       "REQUESTS_RECOVERY" VARCHAR2(1 BYTE)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE "QRTZ_JOB_DETAILS";
CREATE TABLE "QRTZ_JOB_DETAILS" (
                                    "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                    "JOB_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                    "JOB_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                    "DESCRIPTION" VARCHAR2(250 BYTE),
                                    "JOB_CLASS_NAME" VARCHAR2(250 BYTE) NOT NULL,
                                    "IS_DURABLE" VARCHAR2(1 BYTE) NOT NULL,
                                    "IS_NONCONCURRENT" VARCHAR2(1 BYTE) NOT NULL,
                                    "IS_UPDATE_DATA" VARCHAR2(1 BYTE) NOT NULL,
                                    "REQUESTS_RECOVERY" VARCHAR2(1 BYTE) NOT NULL,
                                    "JOB_DATA" BLOB
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP", "DESCRIPTION", "JOB_CLASS_NAME", "IS_DURABLE", "IS_NONCONCURRENT", "IS_UPDATE_DATA", "REQUESTS_RECOVERY", "JOB_DATA") VALUES ('schedulerName', 'userSessionTimeoutJob', 'DEFAULT', NULL, 'cn.iocoder.yudao.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', HEXTORAW('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000007400104A4F425F48414E444C45525F4E414D457400157573657253657373696F6E54696D656F75744A6F627800'));
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE "QRTZ_LOCKS";
CREATE TABLE "QRTZ_LOCKS" (
                              "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                              "LOCK_NAME" VARCHAR2(40 BYTE) NOT NULL
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO "QRTZ_LOCKS" ("SCHED_NAME", "LOCK_NAME") VALUES ('schedulerName', 'STATE_ACCESS');
INSERT INTO "QRTZ_LOCKS" ("SCHED_NAME", "LOCK_NAME") VALUES ('schedulerName', 'TRIGGER_ACCESS');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE "QRTZ_PAUSED_TRIGGER_GRPS";
CREATE TABLE "QRTZ_PAUSED_TRIGGER_GRPS" (
                                            "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                            "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE "QRTZ_SCHEDULER_STATE";
CREATE TABLE "QRTZ_SCHEDULER_STATE" (
                                        "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                        "INSTANCE_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                        "LAST_CHECKIN_TIME" NUMBER(13,0) NOT NULL,
                                        "CHECKIN_INTERVAL" NUMBER(13,0) NOT NULL
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO "QRTZ_SCHEDULER_STATE" ("SCHED_NAME", "INSTANCE_NAME", "LAST_CHECKIN_TIME", "CHECKIN_INTERVAL") VALUES ('schedulerName', 'Yunai.local1651409076356', '1651409097967', '15000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE "QRTZ_SIMPLE_TRIGGERS";
CREATE TABLE "QRTZ_SIMPLE_TRIGGERS" (
                                        "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                        "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                        "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                        "REPEAT_COUNT" NUMBER(7,0) NOT NULL,
                                        "REPEAT_INTERVAL" NUMBER(12,0) NOT NULL,
                                        "TIMES_TRIGGERED" NUMBER(10,0) NOT NULL
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE "QRTZ_SIMPROP_TRIGGERS";
CREATE TABLE "QRTZ_SIMPROP_TRIGGERS" (
                                         "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                         "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                         "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                         "STR_PROP_1" VARCHAR2(512 BYTE),
                                         "STR_PROP_2" VARCHAR2(512 BYTE),
                                         "STR_PROP_3" VARCHAR2(512 BYTE),
                                         "INT_PROP_1" NUMBER(10,0),
                                         "INT_PROP_2" NUMBER(10,0),
                                         "LONG_PROP_1" NUMBER(13,0),
                                         "LONG_PROP_2" NUMBER(13,0),
                                         "DEC_PROP_1" NUMBER(13,4),
                                         "DEC_PROP_2" NUMBER(13,4),
                                         "BOOL_PROP_1" VARCHAR2(1 BYTE),
                                         "BOOL_PROP_2" VARCHAR2(1 BYTE)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE "QRTZ_TRIGGERS";
CREATE TABLE "QRTZ_TRIGGERS" (
                                 "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL,
                                 "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                 "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                 "JOB_NAME" VARCHAR2(200 BYTE) NOT NULL,
                                 "JOB_GROUP" VARCHAR2(200 BYTE) NOT NULL,
                                 "DESCRIPTION" VARCHAR2(250 BYTE),
                                 "NEXT_FIRE_TIME" NUMBER(13,0),
                                 "PREV_FIRE_TIME" NUMBER(13,0),
                                 "PRIORITY" NUMBER(13,0),
                                 "TRIGGER_STATE" VARCHAR2(16 BYTE) NOT NULL,
                                 "TRIGGER_TYPE" VARCHAR2(8 BYTE) NOT NULL,
                                 "START_TIME" NUMBER(13,0) NOT NULL,
                                 "END_TIME" NUMBER(13,0),
                                 "CALENDAR_NAME" VARCHAR2(200 BYTE),
                                 "MISFIRE_INSTR" NUMBER(2,0),
                                 "JOB_DATA" BLOB
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP", "JOB_NAME", "JOB_GROUP", "DESCRIPTION", "NEXT_FIRE_TIME", "PREV_FIRE_TIME", "PRIORITY", "TRIGGER_STATE", "TRIGGER_TYPE", "START_TIME", "END_TIME", "CALENDAR_NAME", "MISFIRE_INSTR", "JOB_DATA") VALUES ('schedulerName', 'userSessionTimeoutJob', 'DEFAULT', 'userSessionTimeoutJob', 'DEFAULT', NULL, '1651409160000', '1651409100000', '5', 'WAITING', 'CRON', '1651409043000', '0', NULL, '0', HEXTORAW('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000007D074000F4A4F425F52455452595F434F554E547371007E0009000000037800'));
COMMIT;
COMMIT;

-- ----------------------------
-- Primary Key structure for table QRTZ_BLOB_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_BLOB_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "SYS_C008266" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "SYS_C008267" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "SYS_C008268" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "SYS_C008653" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "SYS_C008654" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "SYS_C008655" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_CALENDARS
-- ----------------------------
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "QRTZ_CALENDARS_PK" PRIMARY KEY ("SCHED_NAME", "CALENDAR_NAME");

-- ----------------------------
-- Checks structure for table QRTZ_CALENDARS
-- ----------------------------
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "SYS_C008271" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "SYS_C008272" CHECK ("CALENDAR_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "SYS_C008273" CHECK ("CALENDAR" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "SYS_C008656" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "SYS_C008657" CHECK ("CALENDAR_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "SYS_C008658" CHECK ("CALENDAR" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_CRON_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_CRON_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008255" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008256" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008257" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008258" CHECK ("CRON_EXPRESSION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008659" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008660" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008661" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "SYS_C008662" CHECK ("CRON_EXPRESSION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_FIRED_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "QRTZ_FIRED_TRIGGER_PK" PRIMARY KEY ("SCHED_NAME", "ENTRY_ID");

-- ----------------------------
-- Checks structure for table QRTZ_FIRED_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008278" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008279" CHECK ("ENTRY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008280" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008281" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008282" CHECK ("INSTANCE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008283" CHECK ("FIRED_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008284" CHECK ("SCHED_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008285" CHECK ("PRIORITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008286" CHECK ("STATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008663" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008664" CHECK ("ENTRY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008665" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008666" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008667" CHECK ("INSTANCE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008668" CHECK ("FIRED_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008669" CHECK ("SCHED_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008670" CHECK ("PRIORITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "SYS_C008671" CHECK ("STATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table QRTZ_FIRED_TRIGGERS
-- ----------------------------
CREATE INDEX "IDX_QRTZ_FT_INST_JOB_REQ_RCVRY"
    ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME" ASC, "INSTANCE_NAME" ASC, "REQUESTS_RECOVERY" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_FT_JG"
    ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME" ASC, "JOB_GROUP" ASC)
    LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_FT_J_G"
    ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME" ASC, "JOB_NAME" ASC, "JOB_GROUP" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_FT_TG"
    ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME" ASC, "TRIGGER_GROUP" ASC) LOCAL
  LOGGING
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table QRTZ_JOB_DETAILS
-- ----------------------------
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "QRTZ_JOB_DETAILS_PK" PRIMARY KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_JOB_DETAILS
-- ----------------------------
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008228" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008229" CHECK ("JOB_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008230" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008231" CHECK ("JOB_CLASS_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008232" CHECK ("IS_DURABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008233" CHECK ("IS_NONCONCURRENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008234" CHECK ("IS_UPDATE_DATA" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "SYS_C008235" CHECK ("REQUESTS_RECOVERY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table QRTZ_JOB_DETAILS
-- ----------------------------
CREATE INDEX "IDX_QRTZ_J_GRP"
    ON "QRTZ_JOB_DETAILS" ("SCHED_NAME" ASC, "JOB_GROUP" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_J_REQ_RECOVERY"
    ON "QRTZ_JOB_DETAILS" ("SCHED_NAME" ASC, "REQUESTS_RECOVERY" ASC) LOCAL
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table QRTZ_LOCKS
-- ----------------------------
ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "QRTZ_LOCKS_PK" PRIMARY KEY ("SCHED_NAME", "LOCK_NAME");

-- ----------------------------
-- Checks structure for table QRTZ_LOCKS
-- ----------------------------
ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "SYS_C008293" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "SYS_C008294" CHECK ("LOCK_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "SYS_C008672" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "SYS_C008673" CHECK ("LOCK_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "QRTZ_PAUSED_TRIG_GRPS_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "SYS_C008275" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "SYS_C008276" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "SYS_C008674" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "SYS_C008675" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_SCHEDULER_STATE
-- ----------------------------
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "QRTZ_SCHEDULER_STATE_PK" PRIMARY KEY ("SCHED_NAME", "INSTANCE_NAME");

-- ----------------------------
-- Checks structure for table QRTZ_SCHEDULER_STATE
-- ----------------------------
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008288" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008289" CHECK ("INSTANCE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008290" CHECK ("LAST_CHECKIN_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008291" CHECK ("CHECKIN_INTERVAL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008676" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008677" CHECK ("INSTANCE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008678" CHECK ("LAST_CHECKIN_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "SYS_C008679" CHECK ("CHECKIN_INTERVAL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008247" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008248" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008249" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008250" CHECK ("REPEAT_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008251" CHECK ("REPEAT_INTERVAL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008252" CHECK ("TIMES_TRIGGERED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008680" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008681" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008682" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008683" CHECK ("REPEAT_COUNT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008684" CHECK ("REPEAT_INTERVAL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "SYS_C008685" CHECK ("TIMES_TRIGGERED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "SYS_C008261" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "SYS_C008262" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "SYS_C008263" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "SYS_C008686" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "SYS_C008687" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "SYS_C008688" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table QRTZ_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGERS_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");

-- ----------------------------
-- Checks structure for table QRTZ_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008237" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008238" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008239" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008240" CHECK ("JOB_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008241" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008242" CHECK ("TRIGGER_STATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008243" CHECK ("TRIGGER_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008244" CHECK ("START_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008689" CHECK ("SCHED_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008690" CHECK ("TRIGGER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008691" CHECK ("TRIGGER_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008692" CHECK ("JOB_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008693" CHECK ("JOB_GROUP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008694" CHECK ("TRIGGER_STATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008695" CHECK ("TRIGGER_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "SYS_C008696" CHECK ("START_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table QRTZ_TRIGGERS
-- ----------------------------
CREATE INDEX "IDX_QRTZ_T_C"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "CALENDAR_NAME" ASC) LOCAL
  LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_T_J"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "JOB_NAME" ASC, "JOB_GROUP" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_T_JG"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "JOB_GROUP" ASC) LOCAL
  LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_T_NEXT_FIRE_TIME"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "NEXT_FIRE_TIME" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_T_NFT_ST"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "TRIGGER_STATE" ASC, "NEXT_FIRE_TIME" ASC) LOCAL
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "MISFIRE_INSTR" ASC, "NEXT_FIRE_TIME" ASC, "TRIGGER_STATE" ASC) LOCAL
  LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);
CREATE INDEX "IDX_QRTZ_T_STATE"
    ON "QRTZ_TRIGGERS" ("SCHED_NAME" ASC, "TRIGGER_STATE" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  FREELISTS 1
  FREELIST GROUPS 1
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Foreign Keys structure for table QRTZ_BLOB_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table QRTZ_CRON_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;