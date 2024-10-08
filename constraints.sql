-- CONSTRAINTS
-- 제약조건. 테이블에 데이터가 입력되거나 수정될 때의 규칙을 정의한다.
-- 테이블 작성 시 각 컬럼에 값에 대한 제약조건을 설정할 수 있다.
-- 입력/ 수정하는 데이터에 문제가 없는지 자동으로 검사해 준다.
-- 종류 == PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY

-- NOT NULL
-- NULL 값을 허용하지 않는 제약조건
-- 데이터를 입력 받을 때 꼭 들어가야 하는 내용.

DROP TABLE IF EXISTS USER_NOTNULL;
CREATE TABLE IF NOT EXISTS USER_NOTNULL(
		USER_NO INT NOT NULL,
        USER_ID VARCHAR(255) NOT NULL,
        USER_PWD VARCHAR(255) NOT NULL,
        USER_NAME VARCHAR(255) NOT NULL,
        GENDER VARCHAR(3),
        PHONE VARCHAR(255) NOT NULL,
        EMAIL VARCHAR(255)
)ENGINE=InnoDB;

INSERT INTO USER_NOTNULL
(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL)
VALUES
	(1,"USER01","PASS01","홍길동","남","010-1234-5678", NULL),
    (2,"USER02","PASS02","유관순","여","010-1111-1111", "Y@GMAIL.COM");
    
SELECT * FROM USER_NOTNULL;
INSERT INTO USER_NOTNULL
(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL)
VALUES
	(3,"USER01",NULL,"홍길동","남","010-1234-5678", NULL);
    
-- UNIQUE
-- 중복값을 허용하지 않는 제약조건
DROP TABLE IF EXISTS USER_UNIQUE;
CREATE TABLE IF NOT EXISTS USER_UNIQUE(
		USER_NO INT NOT NULL UNIQUE,
        USER_ID VARCHAR(255) NOT NULL,
        USER_PWD VARCHAR(255) NOT NULL,
        USER_NAME VARCHAR(255) NOT NULL,
        GENDER VARCHAR(3),
        PHONE VARCHAR(255) NOT NULL,
        EMAIL VARCHAR(255),
        UNIQUE (PHONE)
)ENGINE = InnoDB;
    
INSERT INTO USER_UNIQUE
(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL)
VALUES
	(1,"USER01","PASS01","홍길동","남","010-1234-5678", NULL),
    (2,"USER02","PASS02","유관순","여","010-2234-5678", "Y@GMAIL.COM");
    
SELECT * FROM USER_UNIQUE;

-- PRIMARY KEY
-- 테이블에서 한 행의 정보를  찾기 위해 사용할 컴럼을 의미한다.
-- 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
-- NOT NULL + UNIQUE 제약조건을 가진다. 그리고 보통 INT 로 설정한다. 오토인크리먼트를 사용하기 위함도, 포린키를 이용할 때 적은 최소한의 데이터를 사용하기 위함도 있다.
-- 한 테이블 당 한 개만 설정할 수 있다.
-- 한 개의 컬럼에 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수도 있다.(복합키)

DROP TABLE IF EXISTS USER_PRIMARYKEY;
CREATE TABLE IF NOT EXISTS USER_PRIMARYKEY(
		USER_NO INT PRIMARY KEY,
		USER_ID VARCHAR(255) NOT NULL,
        USER_PWD VARCHAR(255) NOT NULL,
        USER_NAME VARCHAR(255) NOT NULL,
        GENDER VARCHAR(3),
        PHONE VARCHAR(255) NOT NULL,
        EMAIL VARCHAR(255)
        -- 또는 PRIMARY KEY(USER_NO)
)ENGINE=InnoDB;

INSERT INTO USER_PRIMARYKEY
(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL)
VALUES
	(1,"USER01","PASS01","홍길동","남","010-1234-5678", NULL),
    (2,"USER02","PASS02","유관순","여","010-2234-5678", "Y@GMAIL.COM");
    
SELECT * FROM USER_PRIMARYKEY;

/*
INSERT INTO USER_PRIMARYKEY
(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL)
VALUES
	(1,"USER01","PASS01","홍길동","남","010-1234-5678", NULL)
    (NULL,"USER01","PASS01","홍길동","남","010-1234-5678", NULL); -- 중복도 널로 비워두면 안 됨도 확인해 보자.
*/

-- FOREIGN KEY
-- 참조된 다른 테이블에서 제공하는 값만 사용할 수 있음.
-- FOREIGN KEY 제약조건에 의해 테이블 간의 관계가 형성됨.
-- 제공되는 값 외에는 NULL 을 사용할 수 있음.
-- 설정되어 있는 경우에는 컬럼을 변경하지 못함.

DROP TABLE IF EXISTS USER_GRADE;
CREATE TABLE IF NOT EXISTS USER_GRADE(
	GRADE_CODE INT NOT NULL UNIQUE,
    GRADE_NAME VARCHAR(255) NOT NULL
)ENGINE=InnoDB;

INSERT INTO USER_GRADE
VALUES
	(10, "일반회원"),
    (20, "우수회원"),
    (30, "특별회원");
    
SELECT * FROM USER_GRADE;

DROP TABLE IF EXISTS USER_FOREIGNKEY1;
CREATE TABLE IF NOT EXISTS USER_FOREIGNKEY1(
	USER_NO INT PRIMARY KEY,
    USER_ID VARCHAR(255) NOT NULL,
    USER_PWD VARCHAR(255) NOT NULL,
    USER_NAME VARCHAR(255) NOT NULL,
    GENDER VARCHAR(3),
    PHONE VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255),
    GRADE_CODE INT NOT NULL,
    FOREIGN KEY (GRADE_CODE) 
    REFERENCES USER_GRADE(GRADE_CODE)
)ENGINE = InnoDB;

INSERT INTO USER_FOREIGNKEY1
	(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL, GRADE_CODE)
  VALUES
	(1,"USER01","PASS01","홍길동","남","010-1234-5678", NULL, 10),
    (2,"USER02","PASS02","유관순","여","010-2234-5678", "Y@GMAIL.COM", 20);
    
SELECT * FROM USER_FOREIGNKEY1;

INSERT INTO USER_FOREIGNKEY1
	(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL, GRADE_CODE)
  VALUES
	(3,"USER01","PASS01","홍길동","남","010-1234-5678", NULL, NULL);
    
    
-- DELETE, UPDATE 룰

DROP TABLE IF EXISTS USER_FOREIGNKEY2;
CREATE TABLE IF NOT EXISTS USER_FOREIGNKEY2(
		USER_NO INT PRIMARY KEY,
        USER_ID VARCHAR(255) NOT NULL,
		USER_PWD VARCHAR(255) NOT NULL,
		USER_NAME VARCHAR(255) NOT NULL,
		GENDER VARCHAR(3),
		PHONE VARCHAR(255) NOT NULL,
		EMAIL VARCHAR(255),
		GRADE_CODE INT,
        FOREIGN KEY(GRADE_CODE)
        REFERENCES USER_GRADE(GRADE_CODE)
			ON UPDATE SET NULL 
            ON DELETE SET NULL -- 연관관계가 있으면 부모를 수정할 수 없다. 하지만 이렇게 쓰면 가능은 하다.
)ENGINE=InnoDB;

INSERT INTO USER_FOREIGNKEY2
	(USER_NO, USER_ID, USER_PWD, USER_NAME, GENDER, PHONE, EMAIL, GRADE_CODE)
VALUES
		(1,"USER01","PASS01","홍길동","남","010-1234-5678", NULL, 10),
		(2,"USER02","PASS02","유관순","여","010-1234-5678", NULL, 20);
        
SELECT * FROM USER_FOREIGNKEY2;

UPDATE USER_GRADE
	SET GRADE_CODE = 1
  WHERE GRADE_CODE = 10;
  
DELETE FROM USER_GRADE
	WHERE GRADE_CODE = 20;
    
SELECT * FROM USER_FOREIGNKEY2;

-- CHECK
-- CHECK 제약조건 위반시 허용하지 않게 만드는 제약조건 키
DROP TABLE IF EXISTS USER_CHECK;
CREATE TABLE IF NOT EXISTS USER_CHECK(
		USER_NO INT AUTO_INCREMENT PRIMARY KEY,
        USER_NAME VARCHAR(255) NOT NULL,
        GENDER VARCHAR(3) CHECK (GENDER IN ('남', '여')),
        AGE INT CHECK (AGE>=19)
)ENGINE=InnoDB;

INSERT INTO USER_CHECK
VALUES
	(NULL, "홍길동", "남", 25),
    (NULL, "이순신", "남", 33);
    
SELECT * FROM USER_CHECK;

INSERT INTO USER_CHECK
VALUES (NULL, "안중근", "남", 17); -- 나이 성별이 문제

-- DEFAULT
-- 컬럼에 NULL 대신에 기본 값 적용
-- 컬럼 타입이 DATE 일 경우 - CURRENT_DATE 만 사용 가능
-- DATETIME 일 경우 - CURRENT_TIME, CURRENT_TIMESTAMP, NOW() 모두 가능

DROP TABLE IF EXISTS TBL_COUNTRY;
CREATE TABLE IF NOT EXISTS TBL_COUNTRY(
	COOUNTRY_CODE INT AUTO_INCREMENT PRIMARY KEY,
    COOUNTRY_NAME VARCHAR(255) DEFAULT "한국",
    POPULATION VARCHAR(255) DEFAULT "0명",
	ADD_DAY DATE DEFAULT (current_date()),
    ADD_TIME DATETIME DEFAULT(current_time())
)ENGINE=InnoDB;

INSERT INTO TBL_COUNTRY
VALUES(NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT); -- 아무 것도 입력되지 않아도 디폴트 값이 출력되게 만들었다.

SELECT * FROM TBL_COUNTRY;








    
    