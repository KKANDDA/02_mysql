-- LIMT
-- 결과 집합에서 반환할 행의 수를 제한할 수 있다.

SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 5;

SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 1,4; -- 1행 초과, 4행까지의 값을 출력해준다. 두 번째 행부터 네 번째 행까지를 출력.