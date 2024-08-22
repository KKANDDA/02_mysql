use menudb;

-- WHERE
-- 특정 조건에 맞는 데이터만 선택

SELECT
	menu_name,
    menu_price,
    orderable_status -- 3
  FROM tbl_menu -- 1
WHERE orderable_status = 'Y'; -- 2 작동 순서는 프롬 웨얼 셀렉트이다.

SELECT
	menu_name,
    menu_price,
    orderable_status
  FROM tbl_menu
WHERE
	-- menu_price = 13000;
    menu_price != 13000; -- != 는 부정의 의미
    
SELECT
	menu_code,
	menu_name,
    menu_price
  FROM tbl_menu
WHERE 	menu_price <= 20000;


-- AND 연산자 활용
SELECT
	menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
WHERE
	orderable_status = 'Y' AND
    category_code = 10;
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
WHERE
	menu_price > 5000 AND -- 자바 앤드와 같다.
    category_code = 10;
    
-- OR 연산자 활용
SELECT
	menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
WHERE
	orderable_status = 'Y' OR
    category_code = 4
ORDER BY
	category_code;
    
-- AND 가 OR 보다 우선순위가 높다.
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
WHERE
	category_code = 4 OR -- 기본은 오름차순 정렬, 오더바이를 쓰지 않아서 메뉴코드로 정렬됨
    menu_price = 9000 AND
    menu_code > 10;

-- BETWEEN 연산자 활용
SELECT
	menu_name,
    menu_price,
    category_code
  FROM tbl_menu
WHERE
	menu_price NOT/*부정도 가능*/ BETWEEN 10000 AND 25000
ORDER BY
	menu_price;


-- LIKE 연산자 활용 (부정가능)
SELECT
	menu_name,
	menu_price
  FROM tbl_menu
 WHERE menu_name NOT/*부정가능*/ LIKE '%마늘%'
ORDER BY menu_name;


-- IN 연산자 활용 (부정가능)
SELECT
	menu_name,
    category_code
  FROM tbl_menu
WHERE category_code NOT IN (4,5,6) -- 456이 포함되어 있으면..
ORDER BY
	category_code;
    
-- IS NULL 연산자 활용
SELECT
	category_code,
    category_name,
    ref_category_code
  FROM tbl_category
  WHERE ref_category_code IS NOT NULL;