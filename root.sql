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


CREATE DATABASE EMPLOYEE;

GRANT ALL PRIVILEGES ON EMPLOYEE.* TO 'gangnam'@'%';

SHOW GRANTS FOR 'gangnam'@'%';

-- 영화관 DB맹글기
CREATE DATABASE CINEMA;

GRANT ALL PRIVILEGES ON CINEMA.* TO 'gangnam'@'%';

SHOW GRANTS FOR 'gangnam'@'%';






