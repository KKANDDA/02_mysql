create user 'gangnam'@'%' identified by 'gangnam';

show databases;

-- mysql 기본 제공 database 접근
use mysql;

select * from user;

-- 데이터베이스(스키마) 생성
create database menudb;

grant all PRIVILEGES on menudb.* to 'gangnam'@'%';

show grants for 'gangnam'@'%';

use menudb;