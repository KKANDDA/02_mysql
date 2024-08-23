-- BUILD IN FUNCTIONS

-- ASCII
SELECT ascii('A'); -- 대소문자 크기를 비교한다.

-- CONCAT
SELECT CONCAT("호랑이", "기린", "토끼");
SELECT concat_WS(", ", "호랑이", "기린","토끼"); -- 첫 텍스트를 구분자로 활용한다.

-- ELT: 해당 위치의 문자열 반환
SELECT ELT(2, "사과", "딸기", "바나나"); -- 첫 정수의 위치 번호로

-- FIELD: 찾을 문자열 위치 반환
SELECT FIELD("딸기", "사과", "딸기", "바나나"); -- 첫 텍스트의 해당 위치 번호

-- FORMAT(숫자, 소수점, 자릿수)
SELECT FORMAT(123123154.56674,3); 

-- 2진수, 8진수, 16진수
SELECT BIN(65), OCT(65), HEX(65);

-- INSERT(기존 문자열, 위치, 길이, 삽입할 문자열)
SELECT INSERT("내 이름은 홍길동입니다.",7,3, "유관순"); -- 7번째 위치부터 3문자를 바꾸겠다. 삽입할 문자열은 바뀌지 않는다.

-- LEFT, RIGHT
SELECT left("HELLO WORLD!", 3), right("HELLO WORLD!",3);

-- LOWER , UPPER 대문자 소문자

-- TRIM 공백제거

-- REPEAT (문자열, 횟수) 반복
SELECT repeat("MYSQL",3);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
SELECT REPLACE("마이SQL","마이","MY");

-- REVERSE(문자열)
SELECT reverse("STRESSED");

-- SUBSTRING(문자열, 시작위치, 길이)
SELECT substrING("안녕하세요 반갑습니다", 7, 2);