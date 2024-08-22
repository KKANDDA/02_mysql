-- ORDER BY
-- SELECT 문과 함께 사용하며, 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용한다.

SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
ORDER BY -- 정렬
	-- menu_price ASC; -- ASC 는 오름차순
    menu_price DESC; -- 내림차순, (기본은 오름차순으로 되어있다)
    
SELECT
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC; -- 내림차순이 먼저 정렬되고, 이후 같은 가격대의 컬럼들의 이름들이 오름차순으로 정렬되었다.
    
    
-- 연산 결과로 결과 집합 정렬
SELECT
	menu_code,
    menu_name,
    menu_price,
    (menu_code * menu_price) AS multi -- 연산된 컴럼의 별칭도 지어줄 수 있다.
  FROM
	tbl_menu
ORDER BY
	-- menu_code * menu_price DESC;
    multi DESC; -- 별칭으로 데이터가 넘어온다.