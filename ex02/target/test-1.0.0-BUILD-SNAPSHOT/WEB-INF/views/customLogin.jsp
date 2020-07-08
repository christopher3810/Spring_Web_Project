<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html Public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/customLogin.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/boardproduct.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/styles/kendo.common.min.css" />
<link rel="stylesheet" href="/resources/styles/kendo.default.min.css" />
<link rel="stylesheet"
	href="/resources/styles/kendo.default.mobile.min.css" />

<script src="/resources/js/jquery.min.js"></script>

<script src="/resources/js/kendo.ui.core.min.js"></script>
<script src="/resources/js/kendo.dropdownlist.min.js"></script>  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<h1>회원가입</h1>
		<h2><c:out value="${error}"/></h2>
		<h2><c:out value="${logout}"/></h2>
		
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
			
			<!-- /login post방식으로 데이터 전송해야 함 input태그의 name속성은 기본적으로 username과 password속성을 이용  -->
			<!-- 비밀번호 잘못 입력해도 이페이지로 자동 이동  -->
				<form method='post' action="/login">
				<fieldset>
				<div class="group">
					<label for="user" class="label">Username</label>
					<input class="form-control" type="text" name='username' value='admin' placeholder="userid" autofocus>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input class="form-control" type="password" name='password' value=''>
				</div>
				<div class="group">
					<input id="check" name='remember-me' type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Remember me</label>
				</div>
				<div class="group">
					<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">Forgot Password?</a>
				</div>
				</fieldset>
				<!-- 해당 el값은 브라우저에서 _csrf 라는 이름으로 처리됨 페이지 소스보기로 가능 value는 임의값 저장  -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form>
			</div>
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input id="pass" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="pass" type="text" class="input">
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<label for="tab-1">Already Member?</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(".btn-success").on("click", function(e){
	
		e.preventDefault();
		$("form").submit();
	});

</script>
</body>
</html>