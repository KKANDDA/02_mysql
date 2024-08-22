-- GROUP BY
-- 결과 집합을 특정 열의 값에 따라 그룹화 하는데 사용함.
-- HAVING 을 함께 사용할 수 있음. - 그룹에 대한 조건 적용


SELECT
	category_code
  FROM tbl_menu
GROUP BY category_code;


-- COUNT() 함수 활용
SELECT
	category_code,
    count(*)
  FROM tbl_menu
GROUP BY category_code; -- 디스팅트와 다르게 그룹화이다. 카운트에 내용이 있잖는가?


-- SUM() 함수 활용
SELECT
	category_code,
	SUM(menu_price)
  FROM tbl_menu
GROUP BY category_code;


-- AVG() 함수 활용
SELECT
	category_code,
	avg(menu_price)
  FROM tbl_menu
GROUP BY category_code;


 -- 2개 이상의 그룹 생성
 SELECT
	menu_price,
    category_code
  FROM tbl_menu
GROUP BY
	menu_price,
    category_code;
    
    
-- HAVING
SELECT
	menu_price,
	category_code
  FROM tbl_menu
GROUP BY
	menu_price,
	category_code
HAVING category_code >= 5 AND category_code <= 8; -- where 은 함수가 사용되기 전에 먼저 실행됨. having 은 그룹으로 묶인 후 함수 적용. where 는 묶기 전이라..




