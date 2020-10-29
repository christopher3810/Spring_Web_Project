<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/styles/kendo.common.min.css" />
<link rel="stylesheet" href="/resources/styles/kendo.default.min.css" />
<link rel="stylesheet"
	href="/resources/styles/kendo.default.mobile.min.css" />

<script src="/resources/js/jquery.min.js"></script>

<script src="/resources/js/kendo.ui.core.min.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"
	integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm"
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<div class="bootstrapnav" id="mobilebanner" >
	<div class="fixed-top">
	  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #dc3545; padding:0">
  			<a class="navbar-brand" id ="site-logo" href="/board/list" style="padding:0"><image style ="width:170px;height:80px;vertical-align:top;" 
  			src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/logo/%EB%A1%9C%EA%B3%A0%EB%A1%9C%EA%B3%A0.png"></a>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  			</button>
 		 <div class="collapse navbar-collapse bg-white" id="navbarSupportedContent">
   			 <ul class="navbar-nav mr-auto">
   		   <li class="nav-item dropdown">
      		  <a class="nav-link dropdown-toggle" href="/board/nomalproduct" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      		  운동화
      		  </a>
      		  <c:set var="sneakers" value="운동화_스니커즈" />
     		  <c:set var="Canvas" value="운동화_캔버스화" />
     		  <c:set var="slipon" value="운동화_슬립온" />
     		  <c:set var="sport_run" value="스포츠_런닝화" />
     		  <c:set var="sport_golf" value="스포츠_골프화" />
     		  <c:set var="sport_mountain" value="스포츠_등산화" />
     		  <c:set var="loafers" value="구두_로퍼" />
     		  <c:set var="heel" value="구두_힐" />
     		  <c:set var="kids_nomal" value="키즈_운동화" />
     		  <c:set var="kids_sport" value="키즈_스포츠" />
     		  <c:set var="kids_sandals" value="키즈_샌들" />
     		  <c:set var="adult_sandals" value="샌들_성인" />
     		   <div class="dropdown-menu" aria-labelledby="navbarDropdown" id="mobiledropdownmenu">
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${sneakers}"/>'>스니커즈</a>
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${Canvas}"/>'>캔버스화</a>
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${slipon}"/>'>슬립온</a>
       		   <div class="dropdown-divider"></div>
      		   <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${kids_nomal}"/>'>키즈</a>
      		  </div>
     		</li>
     		 <li class="nav-item dropdown">
      		  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      		  스포츠
      		  </a>
     		   <div class="dropdown-menu" aria-labelledby="navbarDropdown" id="mobiledropdownmenu">
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${sport_run}"/>'>런닝화</a>
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${sport_golf}"/>'>골프화</a>
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${sport_mountain}"/>'>등산화</a>
       		   <div class="dropdown-divider"></div>
      		   <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${kids_sport}"/>'>키즈</a>
      		  </div>
     		</li>
     		 <li class="nav-item dropdown">
      		  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      		    구두
      		  </a>
     		   <div class="dropdown-menu" aria-labelledby="navbarDropdown" id="mobiledropdownmenu">
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${loafers}"/>'>로퍼</a>
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${heel}"/>'>힐</a>
      		  </div>
     		</li>
     		<li class="nav-item">
     		   <a class="nav-link" href="#" id="navbarDropdown">샌들</a>
     		    <div class="dropdown-menu" aria-labelledby="navbarDropdown" id="mobiledropdownmenu">
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${adult_sandals}"/>'>성인</a>
        		  <a class="dropdown-item" href='<c:url value="/board/nomalproduct?content=${kids_sandals}"/>'>키즈</a>
      		  </div>
    		  </li>
     		 <li class="nav-item">
     		   <a class="nav-link" href="/board/event" id="navbarDropdown">기획전</a>
    		  </li>
    		   <li class="nav-item">
     		   <a class="nav-link" href="/board/register" id="navbarDropdown">상품등록</a>
    		  </li>
    		   <li class="nav-item">
    		   
    		   <sec:authorize access="isAnonymous()">
						<a class="nav-link" href="/board/login" id="navbarDropdown">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
						<a class="nav-link" href="#" id="navbarDropdown" onclick="document.getElementById('logout').submit();">로그아웃</a>
				</sec:authorize>		   				   
				<form id="logout" action="/customLogout" method="POST">
  					 <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
    		  </li>
    		   <li class="nav-item">
     		   <a class="nav-link" href="#" id="navbarDropdown">고객센터</a>
    		  </li>
    		
   			 </ul>
   			 <!--  
 		   <form class="form-inline my-2 my-lg-0">
  		    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    		</form>
    		-->
  		</div>
		</nav>
		</div>
	</div>
	<header id="header">
		<div class="search-wrapper"">
			<div class="mainlogo" style="float:left; margin-left: 15%">
		   		 <a class="site-logo" href="/board/list"><image style ="width:170px;height:80px;vertical-align:top;" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/logo/%EB%A1%9C%EA%B3%A0%EB%A1%9C%EA%B3%A0.png"></a>
			</div>
			<div class="cartlogo" style="float:right; margin-right: 5%">	
		   		 <a class="site-logo" href="#"><image style ="width:40px;height:40px;vertical-align:top;margin-top:15px;margin-bottom:5px" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/logo/cart_icon.png"></a>
		   		 <p style="text-align:center">장바구니</p>
			</div>
			<div class="userlogo" style="float:right; margin-right: 1%">
				<sec:authorize access="isAnonymous()">
						<a class="site-logo" href="/board/login"><image style ="width:50px;height:50px;vertical-align:top;margin-top:10px;" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/logo/usericon.png"></a>
						<p style="text-align:center">로그인</p>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">		
						<a class="site-logo" href="#" onclick="document.getElementById('logout').submit();"><image style ="width:50px;height:50px;vertical-align:top;margin-top:10px;" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/logo/usericon.png"></a>
						<p style="text-align:center">로그아웃</p>
				</sec:authorize>		   		 
			</div>
			<div class="searchbar" style="width:75%">
				<form id="search-bar" action="/board/list" method='get'>
					<select name='type' id="search-option">
					<option value="T" selected>통합검색</option>
					</select> 
					<input type="text" name="keyword" id="focus" required class="search-box"
						placeholder="제품명을 입력하세요" style="width: 40%" value="<c:out value="${pageMaker.cri.keyword}" />"/>
					<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
					<button class="close-icon" type="reset"></button>
				</form>
			</div>
		</div>
		</div>
		<nav id="headmenu">
			<ul>
				<li><a href='<c:url value="/board/nomalproduct?content=${sneakers}"/>'>운동화</a>
					<ul>

						<li><a href='<c:url value="/board/nomalproduct?content=${sneakers}"/>'>스니커즈</a></li>

						<li><a href='<c:url value="/board/nomalproduct?content=${Canvas}"/>'>캔버스화</a></li>

						<li><a href='<c:url value="/board/nomalproduct?content=${slipon}"/>'>슬립온</a></li>
						
						<li><a href='<c:url value="/board/nomalproduct?content=${kids_nomal}"/>'>키즈</a></li>

					</ul></li>
				<!--men-->


				<li><a href="#">스포츠</a>
					<ul>

						<li><a href='<c:url value="/board/nomalproduct?content=${sport_run}"/>'>런닝화</a></li>

						<li><a href='<c:url value="/board/nomalproduct?content=${sport_golf}"/>'>골프화</a></li>

						<li><a href='<c:url value="/board/nomalproduct?content=${sport_mountain}"/>'>등산화</a></li>
						
						<li><a href='<c:url value="/board/nomalproduct?content=${kids_sport}"/>'>키즈</a></li>
						
					</ul></li>

				<li><a href="#">구두</a>
					<ul>

						<li><a href='<c:url value="/board/nomalproduct?content=${loafers}"/>'>로퍼</a></li>

						<li><a href='<c:url value="/board/nomalproduct?content=${heel}"/>'>힐</a></li>

					</ul></li>
				<li><a href="/board/event">샌들</a>
					<ul>
						<li><a href='<c:url value="/board/nomalproduct?content=${adult_sandals}"/>'>성인</a></li>

						<li><a href='<c:url value="/board/nomalproduct?content=${kids_sandals}"/>'>키즈</a></li>
				
					</ul></li>
				<li><a href="/board/event">기획전</a></li>
				<li><a href="/board/register">상품등록</a></li>
			</ul>
		</nav>
	</header>
	<!-- /header -->

	<div id="example">
		<div id="add-product" class="demo-section k-content">
			<p class="title">해당 상품 수정</p>
			<form id="ticketsForm" role='form' action="/board/register" method="post" name="productform">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<ul id="fieldlist">
					<li><label>작성자:</label> <input type="text" class="k-textbox"
						style="width: 50%; height: 30px;" value='<sec:authentication property="principal.username"/>'
						readonly="redonly" name='writer'/></li>
					<li><label for="fullname" class="required">상품명</label> <input
						type="text" id="title" name="title" class="k-textbox"
						placeholder="상품명" required validationMessage="Enter {0}"
						style="width: 50%; height: 30px;" /></li>
					<li><label>상품가격:</label> <input id="price" name='price' type="number"
						title="currency" value="10000" min="0" max="10000000"
						style="width: 50%; height: 30px;" /></li>
					<li><div class="form-group">
   							 <label for="exampleFormControlSelect1">상품상세정보</label>
   							 <select class="form-control" id="exampleFormControlSelect1" name="content" style="width: 50%; height: 30px;">
    			 					 <option>운동화_스니커즈</option>
   				 					 <option>운동화_캔버스화</option>
   				  					 <option>운동화_슬립온</option>
   					   				 <option>스포츠_런닝화</option>
  				   				     <option>스포츠_골프화</option>
  				   				     <option>스포츠_등산화</option>
  				   				     <option>구두_로퍼</option>
  				   				     <option>구두_힐</option>
  				   				     <option>샌들_성인</option>
  				   				     <option>키즈_운동화</option>
  				   				     <option>키즈_스포츠</option>
  				   				     <option>키즈_샌들</option>
  						 	 </select>
  							</div>
  						</li>
			
					<li>
						<hr>
						<h2>상품 사이즈 입력</h2>
					</li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 220</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size220'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 230</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size230'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 240</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size240'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 250</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size250'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 260</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size260'></li>

					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 270</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size270'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 280</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size280'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 290</label>  <input class="form-control" type="number" value="42" id="example-number-input" name ='size290'></li>

					<li class="confirm" style="width: 100%;">
						<button class="k-button k-primary" type="submit">Submit</button>
						<button class="k-button k-primary" type="reset">Reset</button>
					</li>
					<li class="status"></li>
					<div class="card" style="width: 100%;">

						<div class="card-header">상품 메인 이미지</div><!-- card header -->
						<!-- head of panel -->

						<div class="card-body"><!--  -->
							<div class="form-group uploadDiv">
								<input type="file" name='mainuploadFile'>
							</div>
										
							<div class='mainuploadResult'>
								<ul>

								</ul>
							</div>

						</div>
						<!-- end card-body -->

					</div>
					<!-- end card -->
					<br>
					<div class="card" style="width: 100%;">

						<div class="card-header">상품 설명 파일 이미지 업로드</div><!-- card header -->
						<!-- head of panel -->

						<div class="card-body">
							<div class="form-group uploadDiv">
								<input type="file" name='uploadFile' id="subupload" multiple>
							</div>

							<div class='uploadResult'>
								<ul>

								</ul>
							</div>

						</div>
						<!-- end card-body -->

					</div>
					<!-- end card -->
			</form>
		</div>
	</div>
	<!-- example -->

<style>
.confirm {
	float: left;
}

#size {
	width: 20%;
	float: left;
}

#example {
	margin-top: 17rem;
}

.demo-section {
	padding: 0;
}

#add-product {
	text-align: center;
}

#add-product .title {
	font-size: 16px;
	color: #fff;
	background-color: #1e88e5;
	padding: 20px 30px;
	margin: 0;
}

#fieldlist {
	margin: 0 0 -1.5em;
	padding: 30px;
}

#fieldlist li {
	list-style: none;
	padding-bottom: 1.5em;
}

#fieldlist label {
	width: 50%;
	float: left;
	display: block;
	padding-bottom: .3em;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 20px;
	color: #444;;
}

#fieldlist li.status {
	text-align: center;
}

#fieldlist label .k-numerictextbox {
	font-size: 14px;
}

.confirm {
	padding-top: 1em;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}

#fieldlist li input[type="checkbox"] {
	margin: 0 5px 0 0;
}

span.k-widget.k-tooltip-validation {display;inline-block;
	width: 160px;
	text-align: left;
	border: 0;
	padding: 0;
	margin: 0;
	background: none;
	box-shadow: none;
	color: red;
}
.close{
	float:none; 
}

.k-tooltip-validation .k-warning {
	display: none;
}
</style>

	<script>
		$(document).ready(function() {
			//버튼클릭시 첨부파일 관련 처리 하지 못하게 일단 동작 막기 
			$("button[type='submit']").on("click", function(e) {

				e.preventDefault();
				var formObj = $("form[name='productform']");
				console.log("file upload submit clicked");
				var str = "";
				$(".mainuploadResult ul li").each(function(i,obj){
					i = 0;
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type = 'hidden' name ='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].maincheck' value='"+true+"'>";
				});

				$(".uploadResult ul li").each(function(i,obj){
					i = i+1;
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type = 'hidden' name ='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type = 'hidden' name ='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
					
				});
				formObj.append(str).submit();
				
			});//submit on clikc
			//파일 업로드는 별도의 버튼이아닌 input type=file 의 내용이 변경되는것을 감지해야함 
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB

			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("파일 사이즈를 초과했습니다");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				return true;
			}//check extention
			
			//input[type='file']		
			var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue ="${_csrf.token}";
				$("input[name='uploadFile']").change(function(e){
					
					var formData = new FormData();
					formData.append("uploadFile", "checkid");					
					var inputFile = $("input[name='uploadFile']");
					var files = inputFile[0].files;
	
					for (var i = 0; i < files.length; i++) {

						if (!checkExtension(files[i].name, files[i].size)) {
							return false;
						}			
						formData.append("uploadFile", files[i]);
						console.log(files[i]);
					}
					
					$.ajax({
						url : '/s3image',
						processData : false,
						contentType : false,
						beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data : formData,
						type : 'POST',
						dataType: 'json',
						success : function(result) {
							console.log(result);
							showUploadResult(result); //업로드 결과 처리 함수 첨부파일보여줘세용
						}	

					}); //$.ajax
				})
				$("input[name='mainuploadFile']").change(function(e){
					var formData = new FormData();
					
					formData.append("uploadFile", "checkid");
					
					var inputFile = $("input[name='mainuploadFile']");
					
					var aJsonArray = new Array();
					var aJson = new Object();
					aJson.maincheck = "1";
					aJsonArray.push(aJson);
					console.log(aJsonArray);
					var files = inputFile[0].files;
					console.log(files);			   
					//파일 갯수와 갯수별 데이터 전송
					if (!checkExtension(files[0].name, files[0].size)) {
						return false;
					}
					formData.append("uploadFile", files[0]);
					formData.append("parseCheck", true);
					console.log(formData);
					//formData.append("uploadFile", {maincheck : true});
					
					$.ajax({
						url : '/s3image',
						processData : false,
						contentType : false,
						beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data : formData,
						type : 'POST',
						dataType: 'json',
						success : function(result) {
						showUploadResult(result);
						console.log(result);
						}	

					}); //$.ajax
				});
				
			
			function showUploadResult(uploadResultArr){
				
				if(!uploadResultArr || uploadResultArr.length == 0){return;}
				
				var uploadUL = "";
				var str = "";

				console.log(uploadResultArr);

				$(uploadResultArr).each(function(i, obj){
					
					console.log(obj.fileName);

					if(obj.maincheck){
						uploadUL = $(".mainuploadResult ul");
						//input hidden으로 name=attach 달고 데이터 넘기는 애들이 생성되는 위치가 여기 아래 li서브로 생성이 됨
						//각각 생성된 li에  첨부파일에 관련된 정보를 담아 둔뒤 .each $(obj)를 통해서 jobj로 옮긴뒤 input hidden 에 value값으로 넘긴다 /결국 form을 통해서 게시물 등록을 해야되기 때문 
						//1. li 데이터값 셋팅 2.jobj = $(obj)를 통해 받아둔뒤 name attahclist value jobj를 통해서 컨트롤러로 넘겨준다 
						str += "<li data-path ='"+obj.uploadPath+"'";
						str += "data-uuid ='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'"
						str + "><div>";
						str += "<div col-md-4 center-block>";
						str += "<span> "+ obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+obj.uploadPath+"\' data-type='image' class='close' aria-label='Close'>"+
						"<span aria-hidden='true'>&times;</span></button><br>";
						str += "<img src='/displayS3images?fileName="+obj.fileName+"&directory=images&uuid="+obj.uuid+"&path="+obj.uploadPath+"'>";
						//str += "<img src='https://d3fjc4x2ovyjvz.cloudfront.net"+obj.uploadPath+"/"+obj.uuid +"_"
						//+ obj.fileName+"?w=300&h=250&f=webp&q=100'>";
						//cloudFront + lambda@edge ondemend image resizing q = 100이 max 퀄리티 
						str += "</div>";
						str + "</li>";
					}else{
				 		uploadUL = $(".uploadResult ul");
						if(obj.image){ //이미지 파일 아닌걸 올리시 파일 업로드 하는 png를 보여줌 
							/*encodeURIComponent*/
							str += "<li data-path ='"+obj.uploadPath+"'";
						str += "data-uuid ='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-type='"+obj.image+"'"
						str + "><div>";
							str += "<div col-md-4 center-block>";
							str += "<span> "+ obj.fileName + "</span>";
							str += "<button type='button' data-file=\'"+obj.uploadPath+"\' data-type='image' class='close' aria-label='Close'>"+
							"<span aria-hidden='true'>&times;</span></button><br>";
							str += "<img src='/displayS3images?fileName="+obj.fileName+"&directory=images&uuid="+obj.uuid+"&path="+obj.uploadPath+"'>";
							//str += "<img src='https://d3fjc4x2ovyjvz.cloudfront.net"+obj.uploadPath+"/"+obj.uuid +"_"
							//+ obj.fileName+"?w=300&h=250&f=webp&q=100'>";
							str += "</div>";
							str + "</li>";
						}else{
							//str += "<li>" + obj.fileName + "</li>"; 업로드파일명
							/*encodeURIComponent*/
							//생성된 문자열은 '\' 기호 때문에 일반 문자열과 다르게 됨으로 replace RegExp를 활용 /로 변환해서 해줘야 올바른 이미지 경로가된다 !!!
						
							str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'";
							str += "data-type ='"+obj.image+"' ><div>";
							str += "<span> "+ obj.fileName+"</span>";
							str += "<button type='button' cclass='close' aria-label='Close' data-file=\'"+obj.uploadPath+"\' data-type='file'>"+
							"<span aria-hidden='true'>&times;</span></button><br>";
							str += "<img src='/resources/images/attach.png'>";
							str += "</div>";
							str + "</li>";
					    } //else		
					}		
				});//each
				uploadUL.append(str);		
			}; //show upload result
			
			$(".uploadResult").on("click", "button", function(e){
				
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				console.log(targetFile);
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url : '/deleteFile',
					data : {fileName : targetFile, type : type},
					beforeSend: function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					
					dataType : 'text',
					type : 'Post',
					success : function(result){
						alert(result);
						targetLi.remove();
					}//success
					
				});//ajax
				
			});//uploadResultOnClick
			$(".mainuploadResult").on("click", "button", function(e){
				
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				console.log(targetFile);
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url : '/deleteFile',
					data : {fileName : targetFile, type : type},
					dataType : 'text',
					type : 'Post',
					success : function(result){
						alert(result);
						targetLi.remove();
					}//success
					
				});//ajax
				
			});//uploadResultOnClick
				
			// create NumericTextBox from input HTML element
			$("#numeric").kendoNumericTextBox();

			// create Curerncy NumericTextBox from input HTML element
			$("#currency").kendoNumericTextBox({
				format : "c",
				decimals : 3
			});

			// create Percentage NumericTextBox from input HTML element
			$("#percentage").kendoNumericTextBox({
				format : "p0",
				min : 0,
				max : 0.1,
				step : 0.01
			});

			// create NumericTextBox from input HTML element using custom format
			$("#custom").kendoNumericTextBox({
				format : "#.00 kg"
			});

		});

	</script>

</body>
</html>
