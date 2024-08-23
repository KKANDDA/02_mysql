-- DDL (DATA DEFINITION LANGUAGE)
-- 데이터베이스의 스키마를 정의하거나 수정하는 데 사용되는 SQL의 한 부분이다.
-- 스키마 = 데이터베이스 전체 또는 일부의 논리적인 구조를 표현하는 것.

-- CREATE - 테이블 생성을 위한 구문

-- TB1 테이블 생성
CREATE TABLE IF NOT EXISTS TB1(
		-- 컬럼명, 자료형, 제약조건
        PK INT PRIMARY KEY, -- 제약조건(유일한, 중복 없는)
        FK INT, -- 정수형
        COL1 VARCHAR(255) -- 문자형이란 뜻
        CHECK(COL1 IN ('Y','N')) -- 제약조건(괄호 안의 값만 받는)
)ENGINE = INNODB;
-- INNODB : 트랜잭션 기능을 제공해 동시성과 무결성을 높이고 복구 기능을 지원해 시스템이 예기치 않게 중단되더라도 데이터의 일관성을 보장한다.
-- MYISAM, NDB, CLUSTER

-- 테이블 구조 확인
DESCRIBE TB1;

INSERT INTO TB1 VALUES(1,10,'Y');
INSERT INTO TB1 VALUES(2,NULL,'Y');
SELECT * FROM TB1;


-- AUTO_INCREMENT
-- INSERT 시에 컬럼에 자동으로 번호를 발생시킴(중복되지 않게)

CREATE TABLE IF NOT EXISTS TB2(
		PK INT AUTO_INCREMENT PRIMARY KEY, -- 다른 키에도 쓸 수 있으나 보통 식별키에만 사용
        FK INT,
        COL1 VARCHAR(255),
        CHECK(COL1 IN ('Y','N'))
)ENGINE = InnoDB;

INSERT INTO TB2 VALUES(NULL,10,'Y');
INSERT INTO TB2 VALUES(NULL,20,'Y');

SELECT * FROM TB2;


-- ALTER
-- 테이블에 추가/ 변경/ 수정/ 삭제 하는 모든 것은 ALTER 명령어를 적용한다.
-- 종류가 많아 대표적인 것들만 살펴보자.

-- 열 추가 (테이블에 컬럼 추가)
ALTER TABLE TB2
ADD COL2 INT NOT NULL;

DESCRIBE TB2;

-- 열 삭제 (테이블에서 컬럼 삭제)
ALTER TABLE TB2
DROP COLUMN COL2;

DESCRIBE TB2;

-- 제약조건 추가 및 삭제
ALTER TABLE TB2
DROP PRIMARY KEY; -- 오토인크리먼트 때문에 바로 삭제가 안 된다.

DESCRIBE TB2;

ALTER TABLE TB2
MODIFY PK INT; -- 오토인크리먼트를 지우고

DESCRIBE TB2;

ALTER TABLE TB2
DROP PRIMARY KEY; -- 프라이머리 키를 삭제하였다.

DESCRIBE TB2;


-- DROP
-- 테이블을 삭제하기 위한 구문

CREATE TABLE IF NOT EXISTS TB3(
		PK INT AUTO_INCREMENT PRIMARY KEY, -- 다른 키에도 쓸 수 있으나 보통 식별키에만 사용
        FK INT,
        COL1 VARCHAR(255),
        CHECK(COL1 IN ('Y','N'))
)ENGINE=InnoDB;

DESCRIBE TB;

DROP TABLE IF EXISTS TB1, TB2;
