-- SUBQUERIES
-- 다른 쿼리 내에서 실행되는 쿼리이다.

SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
WHERE
	category_code =(
		SELECT
			category_code
		  FROM tbl_menu
		WHERE menu_name = "민트미역국" -- 그래서 민트미역국의 코드인 4가 조건에 걸리고 4인 것들이 출력됐다.
	);
    
    
-- 서브쿼리를 활용한 메인 쿼리
SELECT
	MAX(count)
  FROM
	(SELECT
		COUNT(*) AS 'count' -- 카운트는 그룹 내의 개수를 세주고, 그 개수 중 가장 큰 값을 출력했다.
	  FROM
		tbl_menu
	GROUP BY category_code) AS countmenu; -- 프롬절에 서브쿼리를 쓰게되면 별칭을 지어줘야 함. 웨얼절에있으면 그냥 사용해도 된다.
    
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu a
  WHERE
	menu_price > (
		SELECT
			AVG(menu_price) -- 가격의 평균을 계산하고, 평균 이상의 가격을 가진 메뉴의 묶음들을 출력했다.
		  FROM tbl_menu
		WHERE category_code = a.category_code
	);