-- TRANSACTION
-- 데이터베이스에서 한 번에 수앵되는 작업의 단위
-- 시작, 진행, 종료 단계를 가지며, 만약 중간에 오류가 발생하면
-- 롤백을 수행하고 데이터 베이스에 제대로 반영하기 위해서는 커밋을 진행한다.

-- COMMIT
/*
트랜잭션 처리에 사용되는 명령문 중 하나로 여러 SQL 문을 하나의 트랜잭션으로 그룹화 할 수 있다.
*/

-- ROLLBACK
/*
트랜잭션 처리에 사용되는 명령문 중 하나로
ROLLBACK 을 사용하면 트랜잭션 내에서 수행한 변경 사항을 취소하고 이전 상태로 돌릴 수 있다.
*/

-- AUTOCOMMIT 비활성화
SET AUTOCOMMIT = 0; -- OFF 가능

-- AUTOCOMMIT 활성화
SET AUTOCOMMIT = 1; -- ON 도 가능

SELECT @@autocommit; -- 오토 커밋의 상태를 알려주는 코드문. 해당 쿼리를 벗어나도 오토쿼리의 상태는 계속된다.

START TRANSACTION; -- 롤백 커밋 만나기 전까지가 한 묶음이다.

SELECT * FROM TBL_MENU;
INSERT INTO tbl_menu VALUES(NULL, "바나나해장국",8500,4,'Y');
UPDATE tbl_menu SET MENU_NAME = "수정됨" WHERE MENU_CODE = 1;
DELETE FROM tbl_menu WHERE menu_code = 7 ;

-- COMMIT; 하면 반영됨 
ROLLBACK; -- 데이터 베이스에 커밋을 만나기 전까지는 반영이 안 되기에 롤백이 가능하다. 그러나 커밋을 만나면 데이터 베이스에 반영이 되었기에 롤백이 안 된다.

SELECT * FROM TBL_MENU;