# Spring_Web_Project

프레임워크 : springframework

자바 : 1.8ver

DB : Mariadb / mybatis

UI : Bootstrap / kendo ui

Was :  Tomcat v9.0

배포 : aws ec2 + aws s3 + aws rds




- spring framework 를 통해 신발 쇼핑몰을 제작중입니다
- 현재 적용기능
- 상품 명 검색(검색후 나오는 페이징Ajax) / 상품 페이징 처리 / 해당 상품 댓글 처리(Ajax) 익명/ 상품 댓글 페이징 처리 및 댓글 CRUD(Ajax)
- 사이즈 클릭시 갯수 및 주문칸 자동생성 및 jquery처리 / 상품 추가/업데이트/삭제/
- 상품 상세 설명 이미지 파일 업로드 가능(메인이미지와 구분) / 보안에 취약한 압축파일 업로드불가
- 파일 업로드시 S3버킷에 이미지 저장 (YYYY/MM/DD 순으로상위 폴더 생성후 해당 폴더 아래에 업로드)
- 파일 삭제시 S3 버킷 해당 경로에 있는 이미지/파일 삭제됨
- 파일 수정시 첨부된 파일 섬네일 이미지 / 이미지 첨부 수정으로 메인화면 메인 이미지 변경 및 상품 설명 이미지 수정가능
- quartz 기능과 같이 S3서버단에서 가비지로 존재하는 정적파일 삭제 기능 구현중
- awsEC2 + aws s3+ aws RDS를 활용한 배포
- 이미지 리사이징 과정을 온디맨드 형식으로 변경 (aws cloudfront + s3에 lambda@edge 이미지 라시이징 함수를 활용)


- 진행중인 기능(카카오 소셜로그인) 
- 장바구니 기능
- 차후 진행할 기능(메일링 서비스 / 회원가입시 이메일인증)