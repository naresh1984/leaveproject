CREATE TABLE admin_locations ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "admin_locations" VALUES(1,'Hyderabad','2013-09-12 11:35:15.431060','2013-09-12 11:35:15.431060');
INSERT INTO "admin_locations" VALUES(2,'Banglore','2013-09-12 11:35:24.120920','2013-09-12 11:35:24.120920');
INSERT INTO "admin_locations" VALUES(3,'USA','2013-09-12 11:35:33.131313','2013-09-12 11:35:33.131313');
DROP TABLE IF EXISTS "admin_roles";
CREATE TABLE "admin_roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
DROP TABLE IF EXISTS "employees";
CREATE TABLE "employees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "empid" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "email" varchar(255), "password_digest" varchar(255), "manager_id" varchar(255), "contact_no" varchar(255), "address" text, "createdby" integer, "modifiedby" integer, "location_id" integer);
INSERT INTO "employees" VALUES(1,'2013-09-10 11:28:41.413235','2013-09-13 09:34:40.610260','LT/160','naresh babu','nookala','naresh.nookal@gmail.com','$2a$10$ND5G7swDPa36k/DU0aLDrudVbmvq4c4hohgSwmAIi8g5IfoTsY0AK','18','9490644170','N.Naresh babu Nookala,
Seetarampet village,
Pullampet (MD),
Kadapa(DT),
Andhrapradesh',NULL,NULL,1);
INSERT INTO "employees" VALUES(2,'2013-09-10 11:40:09.748057','2013-09-13 09:34:03.439304','LT/153','venkat','nookala','venkat.nookal@gmail.com','$2a$10$7Fhiab07Dzz/ULY8UKkPIujt2YhEjM79A/cRZU3JVkeQwa8468CtK','17','9490644170','Test',NULL,NULL,1);
INSERT INTO "employees" VALUES(16,'2013-09-13 07:06:51.328970','2013-09-13 10:31:30.758149','LT/161','srikanth','adapa','sri.designer.2289@gmail.com','$2a$10$MKTExn73Jq6ceu1Gg89G6.MHD14SR/iAhy.3z37QW1XUn5oi09.ym','2','9490644170','hyd',NULL,NULL,1);
INSERT INTO "employees" VALUES(17,'2013-09-13 08:39:04.880975','2013-09-24 09:22:26.223557','LT/152','satish','nookala','satish.nookal@gmail.com','$2a$10$WofBK2tmdUEEQJ6s7S5lmuP2zA7Itva0GGRCxq2Cj2RAcfM.RrPii','17','9490644170','hyd',NULL,NULL,3);
INSERT INTO "employees" VALUES(18,'2013-09-13 08:52:36.344706','2013-09-16 07:48:42.533750','LT/154','ramesh','nookala','ramesh.nookal1984@gmail.com','$2a$10$kcNmmTHKuUNPRk9nQfpeOOT9oe/JCyxx57v8S1Qwuz91j2GCtmHCe','17','9490644170','hyd',NULL,NULL,1);
INSERT INTO "employees" VALUES(19,'2013-09-13 08:55:55.235664','2013-09-13 09:34:32.722958','LT/155','visvanadh','nookala','visvanadh.nookal@gmail.com','$2a$10$6fwAycd.NNO9bKoMhWxIj.3PuAmbz7h/tqngxXgQavU0VXSzUYabW','17','9490644170','hyd',NULL,NULL,1);
INSERT INTO "employees" VALUES(20,'2013-09-16 08:14:54.757544','2013-09-26 05:10:19.615091','LT/162','mahesh','nookala','mahesh.nookal@gmail.com','$2a$10$uSsHBIDc450myvsgSAImlOsN3xr08Pk6MRrScRnFvUy7WM794LANS','18','9490644170','hyd',NULL,NULL,2);
INSERT INTO "employees" VALUES(24,'2013-09-26 04:51:32.147393','2013-09-26 04:51:32.147393','LT/165','shirisha','nookala','shirisha1984.nookala@gmail.com','$2a$10$tukGvIkepZYOfp20JOemROJptISR3u2xlheo1ArexvJvsLDThiio6','2','9490644170','hyd',NULL,NULL,1);
INSERT INTO "employees" VALUES(25,'2013-09-26 05:01:16.390985','2013-09-26 06:03:17.949705','LT/166','sreedhar','nookala','sreedhar.nookal@gmail.com','$2a$10$arKH.rJNGVXlO3s98ZykcuquYIzDmbl4bpekdBm/FJWUwBu7/W0M2','20','9490644170','Banglore',NULL,NULL,2);
DROP TABLE IF EXISTS "employees_roles";
CREATE TABLE "employees_roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer, "role_id" integer, "createdby" integer, "modifiedby" varchar(255), "title" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "employees_roles" VALUES(82,19,2,1,'1',NULL,'2013-09-13 09:34:33.374655','2013-09-13 09:34:33.374655');
INSERT INTO "employees_roles" VALUES(83,19,3,1,'1',NULL,'2013-09-13 09:34:33.524635','2013-09-13 09:34:33.524635');
INSERT INTO "employees_roles" VALUES(89,16,2,1,'1',NULL,'2013-09-13 10:31:31.210115','2013-09-13 10:31:31.210115');
INSERT INTO "employees_roles" VALUES(96,2,1,1,'1',NULL,'2013-09-16 05:38:39.530987','2013-09-16 05:38:39.530987');
INSERT INTO "employees_roles" VALUES(97,2,2,1,'1',NULL,'2013-09-16 05:38:39.686931','2013-09-16 05:38:39.686931');
INSERT INTO "employees_roles" VALUES(98,2,3,1,'1',NULL,'2013-09-16 05:38:39.847576','2013-09-16 05:38:39.847576');
INSERT INTO "employees_roles" VALUES(114,18,2,1,'1',NULL,'2013-09-16 07:48:49.666556','2013-09-16 07:48:49.666556');
INSERT INTO "employees_roles" VALUES(115,18,3,1,'1',NULL,'2013-09-16 07:48:49.816262','2013-09-16 07:48:49.816262');
INSERT INTO "employees_roles" VALUES(120,17,1,1,'1',NULL,'2013-09-24 09:22:26.610211','2013-09-24 09:22:26.610211');
INSERT INTO "employees_roles" VALUES(121,17,2,1,'1',NULL,'2013-09-24 09:22:26.796311','2013-09-24 09:22:26.796311');
INSERT INTO "employees_roles" VALUES(122,17,3,1,'1',NULL,'2013-09-24 09:22:26.971826','2013-09-24 09:22:26.971826');
INSERT INTO "employees_roles" VALUES(123,17,4,1,'1',NULL,'2013-09-24 09:22:27.151734','2013-09-24 09:22:27.151734');
INSERT INTO "employees_roles" VALUES(126,24,1,17,'17',NULL,'2013-09-26 04:51:32.535476','2013-09-26 04:51:32.535476');
INSERT INTO "employees_roles" VALUES(127,24,2,17,'17',NULL,'2013-09-26 04:51:32.703158','2013-09-26 04:51:32.703158');
INSERT INTO "employees_roles" VALUES(129,1,2,17,'17',NULL,'2013-09-26 04:52:29.041549','2013-09-26 04:52:29.041549');
INSERT INTO "employees_roles" VALUES(132,20,2,17,'17',NULL,'2013-09-26 05:10:20.083235','2013-09-26 05:10:20.083235');
INSERT INTO "employees_roles" VALUES(133,20,3,17,'17',NULL,'2013-09-26 05:10:20.277563','2013-09-26 05:10:20.277563');
INSERT INTO "employees_roles" VALUES(134,25,1,17,'17',NULL,'2013-09-26 06:03:18.384602','2013-09-26 06:03:18.384602');
INSERT INTO "employees_roles" VALUES(135,25,2,17,'17',NULL,'2013-09-26 06:03:18.533897','2013-09-26 06:03:18.533897');
DROP TABLE IF EXISTS "leave_requests";
DROP TABLE IF EXISTS "leaves";
CREATE TABLE "leaves" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer, "els" decimal, "nels" decimal, "lops" decimal, "compoffs" decimal, "is_special" decimal, "createdby" integer, "modifiedby" integer);
INSERT INTO "leaves" VALUES(1,17,65,-62,0,0,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(2,2,0,-9,0,0,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(3,18,0,-6,0,0,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(4,19,0,-17,0,0,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(5,1,9.5,-20.5,7,3,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(6,16,0,-7,0,0,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(7,20,15,4,0,14,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(8,21,15,25,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(11,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "leaves" VALUES(12,25,1,1,NULL,NULL,NULL,NULL,NULL);

