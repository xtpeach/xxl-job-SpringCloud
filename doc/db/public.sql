/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : PostgreSQL
 Source Server Version : 110008
 Source Host           : 127.0.0.1:5432
 Source Catalog        : xxl_job
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110008
 File Encoding         : 65001

 Date: 21/10/2021 16:52:16
*/


-- ----------------------------
-- Sequence structure for seq_xxl_job_group
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_group";
CREATE SEQUENCE "public"."seq_xxl_job_group" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seq_xxl_job_info
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_info";
CREATE SEQUENCE "public"."seq_xxl_job_info" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seq_xxl_job_log
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_log";
CREATE SEQUENCE "public"."seq_xxl_job_log" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seq_xxl_job_log_report
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_log_report";
CREATE SEQUENCE "public"."seq_xxl_job_log_report" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seq_xxl_job_logglue
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_logglue";
CREATE SEQUENCE "public"."seq_xxl_job_logglue" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seq_xxl_job_registry
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_registry";
CREATE SEQUENCE "public"."seq_xxl_job_registry" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for seq_xxl_job_user
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."seq_xxl_job_user";
CREATE SEQUENCE "public"."seq_xxl_job_user" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_group";
CREATE TABLE "public"."xxl_job_group" (
  "id" int4 NOT NULL DEFAULT nextval('seq_xxl_job_group'::regclass),
  "app_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "address_type" int2 NOT NULL,
  "address_list" text COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."xxl_job_group"."app_name" IS '?????????AppName';
COMMENT ON COLUMN "public"."xxl_job_group"."title" IS '???????????????';
COMMENT ON COLUMN "public"."xxl_job_group"."address_type" IS '????????????????????????0=???????????????1=????????????';
COMMENT ON COLUMN "public"."xxl_job_group"."address_list" IS '?????????????????????????????????????????????';

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO "public"."xxl_job_group" VALUES (1, 'xxl-job-executor-sample', '???????????????', 0, NULL, '2021-10-21 16:51:50.679');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_info";
CREATE TABLE "public"."xxl_job_info" (
  "id" int4 NOT NULL,
  "job_group" int4 NOT NULL,
  "job_desc" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6),
  "author" varchar(64) COLLATE "pg_catalog"."default",
  "alarm_email" varchar(255) COLLATE "pg_catalog"."default",
  "schedule_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "schedule_conf" varchar(128) COLLATE "pg_catalog"."default",
  "misfire_strategy" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "executor_route_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_block_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_timeout" int4 NOT NULL,
  "executor_fail_retry_count" int4 NOT NULL,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default",
  "glue_updatetime" timestamp(6),
  "child_jobid" varchar(255) COLLATE "pg_catalog"."default",
  "trigger_status" int2 NOT NULL,
  "trigger_last_time" int8 NOT NULL,
  "trigger_next_time" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."xxl_job_info"."job_group" IS '???????????????ID';
COMMENT ON COLUMN "public"."xxl_job_info"."author" IS '??????';
COMMENT ON COLUMN "public"."xxl_job_info"."alarm_email" IS '????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."schedule_type" IS '????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."schedule_conf" IS '?????????????????????????????????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."misfire_strategy" IS '??????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."executor_route_strategy" IS '?????????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."executor_handler" IS '???????????????handler';
COMMENT ON COLUMN "public"."xxl_job_info"."executor_param" IS '?????????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."executor_block_strategy" IS '??????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."executor_timeout" IS '????????????????????????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."executor_fail_retry_count" IS '??????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."glue_type" IS 'GLUE??????';
COMMENT ON COLUMN "public"."xxl_job_info"."glue_source" IS 'GLUE?????????';
COMMENT ON COLUMN "public"."xxl_job_info"."glue_remark" IS 'GLUE??????';
COMMENT ON COLUMN "public"."xxl_job_info"."glue_updatetime" IS 'GLUE????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."child_jobid" IS '?????????ID?????????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."trigger_status" IS '???????????????0-?????????1-??????';
COMMENT ON COLUMN "public"."xxl_job_info"."trigger_last_time" IS '??????????????????';
COMMENT ON COLUMN "public"."xxl_job_info"."trigger_next_time" IS '??????????????????';

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_lock";
CREATE TABLE "public"."xxl_job_lock" (
  "lock_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."xxl_job_lock"."lock_name" IS '?????????';

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO "public"."xxl_job_lock" VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_log";
CREATE TABLE "public"."xxl_job_log" (
  "id" int8 NOT NULL DEFAULT nextval('seq_xxl_job_log'::regclass),
  "job_group" int4 NOT NULL,
  "job_id" int4 NOT NULL,
  "executor_address" varchar(255) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_sharding_param" varchar(20) COLLATE "pg_catalog"."default",
  "executor_fail_retry_count" int4 NOT NULL,
  "trigger_time" timestamp(6),
  "trigger_code" int4 NOT NULL,
  "trigger_msg" text COLLATE "pg_catalog"."default",
  "handle_time" timestamp(6),
  "handle_code" int4 NOT NULL,
  "handle_msg" text COLLATE "pg_catalog"."default",
  "alarm_status" int2
)
;
COMMENT ON COLUMN "public"."xxl_job_log"."job_group" IS '???????????????ID';
COMMENT ON COLUMN "public"."xxl_job_log"."job_id" IS '???????????????ID';
COMMENT ON COLUMN "public"."xxl_job_log"."executor_address" IS '???????????????????????????????????????';
COMMENT ON COLUMN "public"."xxl_job_log"."executor_handler" IS '???????????????handler';
COMMENT ON COLUMN "public"."xxl_job_log"."executor_param" IS '?????????????????????';
COMMENT ON COLUMN "public"."xxl_job_log"."executor_sharding_param" IS '??????????????????????????????????????? 1/2';
COMMENT ON COLUMN "public"."xxl_job_log"."executor_fail_retry_count" IS '??????????????????';
COMMENT ON COLUMN "public"."xxl_job_log"."trigger_time" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log"."trigger_code" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log"."trigger_msg" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log"."handle_time" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log"."handle_code" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log"."handle_msg" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log"."alarm_status" IS '???????????????0-?????????1-???????????????2-???????????????3-????????????';

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_log_report";
CREATE TABLE "public"."xxl_job_log_report" (
  "id" int4 NOT NULL DEFAULT nextval('seq_xxl_job_log_report'::regclass),
  "trigger_day" timestamp(6),
  "running_count" int4 NOT NULL,
  "suc_count" int4 NOT NULL,
  "fail_count" int4 NOT NULL,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."xxl_job_log_report"."trigger_day" IS '??????-??????';
COMMENT ON COLUMN "public"."xxl_job_log_report"."running_count" IS '?????????-????????????';
COMMENT ON COLUMN "public"."xxl_job_log_report"."suc_count" IS '????????????-????????????';
COMMENT ON COLUMN "public"."xxl_job_log_report"."fail_count" IS '????????????-????????????';

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO "public"."xxl_job_log_report" VALUES (4, '2021-10-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO "public"."xxl_job_log_report" VALUES (1, '2021-10-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO "public"."xxl_job_log_report" VALUES (2, '2021-10-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO "public"."xxl_job_log_report" VALUES (3, '2021-10-18 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_logglue";
CREATE TABLE "public"."xxl_job_logglue" (
  "id" int4 NOT NULL DEFAULT nextval('seq_xxl_job_logglue'::regclass),
  "job_id" int4 NOT NULL,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default",
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."xxl_job_logglue"."job_id" IS '???????????????ID';
COMMENT ON COLUMN "public"."xxl_job_logglue"."glue_type" IS 'GLUE??????';
COMMENT ON COLUMN "public"."xxl_job_logglue"."glue_source" IS 'GLUE?????????';
COMMENT ON COLUMN "public"."xxl_job_logglue"."glue_remark" IS 'GLUE??????';

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_registry";
CREATE TABLE "public"."xxl_job_registry" (
  "id" int4 NOT NULL DEFAULT nextval('seq_xxl_job_registry'::regclass),
  "registry_group" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."xxl_job_user";
CREATE TABLE "public"."xxl_job_user" (
  "id" int4 NOT NULL DEFAULT nextval('seq_xxl_job_user'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL,
  "permission" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."xxl_job_user"."username" IS '??????';
COMMENT ON COLUMN "public"."xxl_job_user"."password" IS '??????';
COMMENT ON COLUMN "public"."xxl_job_user"."role" IS '?????????0-???????????????1-?????????';
COMMENT ON COLUMN "public"."xxl_job_user"."permission" IS '??????????????????ID???????????????????????????';

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO "public"."xxl_job_user" VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_group"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_info"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_log"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_log_report"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_logglue"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_registry"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."seq_xxl_job_user"', 2, false);

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "public"."xxl_job_group" ADD CONSTRAINT "xxl_job_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "public"."xxl_job_info" ADD CONSTRAINT "xxl_job_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "public"."xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pkey" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "public"."xxl_job_log" ADD CONSTRAINT "xxl_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "public"."xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "public"."xxl_job_logglue" ADD CONSTRAINT "xxl_job_loggule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "public"."xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "public"."xxl_job_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");
