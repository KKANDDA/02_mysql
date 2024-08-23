-- DML(Data Manipulation Language)

-- 테이블에 값을 삽입하거나 수정하거나 삭제하는 SQL의 한 부분이다.
-- INSERT, UPDATE, DELETE, SELECT(DQL- DATA QUERY LANGUAGE)

-- 값을 등록하거나 수정하는 경우 아래의 내용을 주의해야 한다.
  -- 1. 데이터 타입
  -- 2. 제약 조건
  
-- INSERT
-- 새로운 행을 추가하는 구문
-- 테이블의 행의 수가 증가한다.

INSERT INTO tbl_menu(
	
    menu_name,
    menu_price,
    category_code,
    orderable_status
)VALUES(
	-- d오토 인크리즈가 있으면 널을 빼도 가능
    "바나나해장국",
    8500,
    4,
    'Y' -- 매칭은 상기 순서와 맟춰야 한다.
);
SELECT * FROM tbl_menu;

INSERT INTO tbl_menu VALUES(NULL, "바나나해장국",8500,4,'Y'); -- 이렇게도 가능 하지만 널은 빼지 못한다. 순서대로 입력해야 함.

-- 컬럼의 순서를 변경하는 경우 순서에 맞게 값을 넣어주면 된다.ALTER

INSERT INTO tbl_menu (ORDERABLE_STATUS, MENU_PRICE, MENU_NAME, CATEGORY_CODE)
VALUES('Y',5500, "파인애플탕",4);

SELECT * FROM tbl_menu;


-- INSERT 안에 서브쿼리 사용 가능 (거의 안 씀)
INSERT INTO tbl_menu VALUES(
	NULL,
    "순대국밥",
    8500,
    (SELECT CATEGORY_CODE FROM TBL_CATEGORY WHERE CATEGORY_NAME = "한식"),
    'Y'
);
SELECT * FROM tbl_menu;

-- MULTI INSERT
INSERT INTO
	tbl_menu
    VALUES
		(NULL, "차무치맛아스크림", 1700, 12, 'Y'),
        (NULL, "며루치맛아이스크림", 1500, 11, 'Y'),
		(NULL, "소시지아이스크림", 2500, 8, 'Y');
        
SELECT * FROM tbl_menu;


-- UPDATE 업데이트 구문은 데이터의 정보 보호를 위해 처음엔 막혀져 있다. EDIT > PREFERENCES > SQL EDITOR > SAFE UPDATE 체크 해제 이후 사용 가능.
-- 테이블에 기록된 값을 수정하는 구문이다.
-- 테이블 전체 행 갯수는 변화가 없다.

use menudb;

SELECT
	*
  FROM tbl_menu
WHERE menu_name = "바나나해장국";

UPDATE tbl_menu
	SET MENU_NAME = "델몬트바나나"
  WHERE MENU_NAME = "바나나해장국";
  
SELECT
	*
  FROM tbl_menu
WHERE menu_name = "델몬트바나나";


-- 서브쿼리 활용
UPDATE TBL_MENU -- 동시성 문제
	SET CATEGORY_CODE = 6
WHERE MENU_PRICE IN(
		SELECT
			MENU_PRICE
		  FROM (SELECT * FROM TBL_MENU) AS A  -- 동시성 문제로 어떤 것을 먼저 실행해야 할 지 모르기 때문에 순서를 정해줘야 한다. 별칭은 프롬절 안에 서브쿼리를 스려면 별칭을 지어야한다.
          WHERE MENU_NAME = "델몬트바나나"
);


-- 여러 컬럼도 한 번에 가능
UPDATE TBL_MENU -- 동시성 문제
	SET CATEGORY_CODE = 6,
    MENU_NAME = "맛있는바나나"
WHERE MENU_PRICE IN(
		SELECT
			MENU_PRICE
		  FROM (SELECT * FROM TBL_MENU) AS A  -- 동시성 문제로 어떤 것을 먼저 실행해야 할 지 모르기 때문에 순서를 정해줘야 한다. 별칭은 프롬절 안에 서브쿼리를 스려면 별칭을 지어야한다.
          WHERE MENU_NAME = "델몬트바나나"
);

SELECT * FROM TBL_MENU WHERE MENU_NAME = "맛있는바나나";

-- DELETE
-- 테이블의 행으 삭제하는 구문이다.
-- 테이블의 행의 갯수가 줄어든다.

-- WHERE 절을 이용한 단일 행 삭제
DELETE FROM TBL_MENU
  WHERE MENU_NAME = "맛있는바나나";
  
SELECT * FROM TBL_MENU;

-- LIMIT 를 활용한 행 삭제
DELETE FROM TBL_MENU
  ORDER BY MENU_CODE DESC
  LIMIT 2;
  
SELECT * FROM TBL_MENU;

-- 테이블의 값을 전체 삭제하는 경우 - 실행하지 않는 것이 좋다.
-- DELETE FROM TBL_MENU;

-- 데이터를 중요하게 관리해야 하기 떄문에 DELETE QUERY 는 잘 사용하지 않으며
-- 삭제를 해야하는 경우 아래와 같이 상태를 업데이트 하는 방식으로 진행한다.
SELECT
	*
  FROM TBL_MENU
WHERE ORDERABLE_STATUS = 'Y';

UPDATE TBL_MENU
	SET ORDERABLE_STATUS = 'N'
  WHERE MENU_CODE = 80;
  


-- REPLACE
-- 이미 존재하고 있다면 UPDATE, 없으면 INSERT
INSERT INTO TBL_MENU VALUES(26,"참기름소주",5000,10,'Y');
REPLACE INTO TBL_MENU VALUES(27,"참기름소주",5000,10,'Y');

SELECT * FROM TBL_MENU;


	