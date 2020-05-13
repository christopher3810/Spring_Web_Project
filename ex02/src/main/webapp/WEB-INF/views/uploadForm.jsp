<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 실제 전송은 uploadFormAction 경로 이용해서 처리합니다  enctype multipart/form-data하나의 input태그로 여러개의 파일 업로드 가능 IE10이상가능-->
<form action="uploadFormAction" method="post" enctype="multipart/form-data">

<input type='file' name='uploadFile' multiple>
<button>submit</button>
</form>

</body>
<!-- 실제 전송은 uploadFormAction 경로 이용해서 처리합니다 -->
</html>