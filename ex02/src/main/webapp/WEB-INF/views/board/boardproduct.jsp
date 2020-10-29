<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@	taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/boardproduc	t.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/styles/kendo.common.min.css" />
<link rel="stylesheet" href="/resources/styles/kendo.default.min.css" />
<link rel="stylesheet"
	href="/resources/styles/kendo.default.mobile.min.css" />
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  
<script src="/resources/js/jquery.min.js"></script>

<script src="/resources/js/kendo.ui.core.min.js"></script>
<script src="/resources/js/kendo.dropdownlist.min.js"></script>  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

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
</div>
	<!-- /header -->
	<div id="example">
		
			<div class="card-group" style="padding:3%;">
				<div class="card" style="width:100%; border:0px;" id="imagecontainer">

  					<div class="card-body">
   					 <p class="card-text">사진상의 이미지와 본 상품이 다를 수도 있습니다</p>
  				</div>
				</div>			
				<div class="card text-left" style="border:0px;">
  					<div class="card-header" style="background-color:white">
  						  <h5 class="k-card-title" style="font-weight:bold;">${board.title }</h5>
  						  <h6 class="k-card-subtitle">Vans sports</h6>
  						  <h5 class="k-card-title" id="productprice" style="font-weight:bold"">${board.price }원</h5>
  					</div>
 					 <div class="card-body">
 					 			<h5 class="card-title">Delivery Info</h5>
								<p>
								<p class="card-text">배송비 : 무료배송</h7>
								<p class="card-text">배송방법 : 국내배송</p>
								<p class="card-text">평균 배송일 : 2일</p>

  					</div>
  					<div class="card-footer text-muted" style="background-color:white; border-bottom:1px solid #e5e5e5;">
  						<p class="card-text">Size Info</p>
   							 <label for="exampleFormControlSelect1">상품사이즈선택</label>
   							 <select class="form-control" id="size" name="content" style="width:100%;">
    			 					<option value='220'>220</option>
									<option value='230'>230</option>
									<option value='240'>240</option>
									<option value='250'>250</option>
									<option value='260'>260</option>
									<option value='270'>270</option>
									<option value='280'>280</option>
									<option value='290'>290</option>			   				     
  						 	 </select>
						</select>
					</div>
				</div>
			
		</div>
		<!-- 신발 클릭시 주문 들어가는거 추가되는 라인 -->
		<form class="form-inline" id="shoesorder" role='form' action="" method="post" name="shoesorderform" ">
			<div class="show_size_amount">
			</div>
		</form>
		
		<div class="row" style="width:100%;">
		<div class="col-12" style="width: 100%;">
		
				<div class="row">
					<div class="col-xs-5 col-sm-7" style="text-align:right; padding-top:10px;">
						<span style="font-size: 10; font-size: larger; color: black;">
							총 결제금액 </span>
					</div>
					<div class="col-xs-5 col-sm-5" style="text-align:right;"> 
						<span style="font-size: xx-large; font-color: red; color: red; margin-left: 45%" id="totalprice">0</span><span>원</span>
					</div>
				</div>
				<div class="row justify-content-end">
						<div class="col-xs-12 col-sm-6" style="text-align:center;">
						<button type="button" class="btn btn-secondary"
							style="width: 46%; height: 50px">장바구니</button>
						<button type="button" class="btn btn-dark" id="buybutton"
							style="width: 46%; height: 50px">바로구매</button>
						</div>
				</div>
		</div>
		</div>
		</div>
		<!-- 상단 상품 정보 -->
	<div class="row" sytle="margin-top: 9%;">
	<div class="col-sm-12">
		<div id="tabstrip" style="padding: 4%;">
			<ul>
				<li class="k-state-active"
					style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px" id="product_subbanner_text">상품정보</h3>
				</li>
				<li style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px" id="product_subbanner_text">상품후기</h3>
				</li>
				<li style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px" id="product_subbanner_text">Q&A</h3>
				</li>
				<li style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px" id="product_subbanner_text">배송/교환/반품/AS안내</h3>
				</li>
			</ul>
			<div><!-- 상품 설명 첨부파일 보여주는 공간 -->
				<div class = 'ProductPictureWrapper'>
					<div class = 'ProductPicture'>
					</div>
				</div>
				
				<div class="row" style="width : 96%;">
					<div class="col-lg-12">
						<div class="card" style="width: 100%;">
							<div class="card-header"><p style="float:right";>첨부파일</p><br/><div id="fileuploadhead"></div></div><!-- card header -->
								<div class="card-body">
									<div class='uploadResult'>
										<ul>
										</ul>		
									</div><!-- uploadResultend -->
								</div><!--cardbodyend  -->
						</div><!--card end  -->
					</div><!--col-lg-12end  -->
				</div><!--rowend  -->
			</div><!--div end  -->
			
			
		<div><!--startreplysection -->
			<div class="reply-header" style="border-bottom: 2px solid black; height:60px; padding-top:50px; text-align:right; ">
					<h4 style ="float:left;">댓글 목록 </h4>
					
					<sec:authorize access="isAuthenticated()">

					<button id ="addReplyBtn" type="button" class="btn btn-dark" style="display:inline-block;">댓글 작성하기</button>
					
					</sec:authorize>
			</div>
			<!-- 댓글 작성 버튼 -->
				<ul class="list-group list-group-flush" id="replychat">
					<!-- start line of reply -->
					<li class = "list-group-item" data-rno='12'>
						<div>
							<div class="header_reply">
								<strong class="primary-font">운영자</strong>
								<small class="pull-right text-muted">0000-00-00 00:00</small>
								</div>
								<p>댓글을 등록하여 회원님의 생각을 표연하세요!!</p>
						</div>
					</li>
				</ul>
				<!-- 페이징 버튼  -->
				<div class="footer" style='margin-top:20px;'>
				
				
				</div>
				
			</div>
			<div>
				<h2>상품 Q&A들어갈 공간</h2>
			</div>
			<div>
				<h1>상품 반품및 정보 들어갈 공간</h1>
			</div>
		</div>
		<div style= "text-align:center;">
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="hasRole('ROLE_ADMIN')" var="u"></sec:authorize>
				<sec:authorize access="isAuthenticated()">
		
				<c:if test="${pinfo.username eq board.writer || u == true}">
						
				<button data-oper='modify' class="btn btn-default">Modify</button>
			
				</c:if>
				</sec:authorize>
			
			<button data-oper='list' class="btn btn-info">List</button>
				
		</div>
		<form id='operForm' action="/board/modify" method="get">
			<input type ='hidden' id='bno' name='id' value="${board.id}">
		</form>
	</div>
	</div>
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">
	<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<label>댓글 작성자</label>
			<c:set var="replyername" value="${pinfo.username}" />
			<label id='replyername' name='replyer'>${replyername}</label>
		</div>		
		<div class="form-group">
		<label>댓글내용</label>
		<input id="replytext" class="form-control" name='reply' value='NewReply!!!!'>
		</div>
		<div class="form-group">
			<label>댓글 작성 시간</label>
			<input class="form-control" name='replyDate' value=''>
		</div>
			
	</div>
		
	<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
	</div>
	</div>
	</div>
	</div>
	<div>
	<span id="220price" style="DISPLAY: none;">1</span>
	<span id="230price" style="DISPLAY: none;">1</span>
	<span id="240price" style="DISPLAY: none;">1</span>
	<span id="250price" style="DISPLAY: none;">1</span>
	<span id="260price" style="DISPLAY: none;">1</span>
	<span id="270price" style="DISPLAY: none;">1</span>
	<span id="280price" style="DISPLAY: none;">1</span>
	<span id="290price" style="DISPLAY: none;">1</span>
	
	</div>	
</div>
	<style>
#example {
	margin-top: 16rem;	
}

#size {
	height: 35px;
	font-size: 15px;
}

#productimg {
	width: 100%;
	height: 100%;
	max-width: 100%;
	max-height: 100%;
}

.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.k-card {
	width: 90%;
	margin: 5%;
}

.k-vbox {
	border-color: inherit;
}

.k-card-footer {
	border-width: 1px 0 0;
	display: flex;
	border-color: inherit;
}

.footer-item {
	opacity: 0.7;
	font-size: 11px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 7px;
}

.footer-item .k-icon {
	margin-right: 2px;
}

.footer-item:last-child {
	margin: 0 0 0 auto;
}

#imagecontainer {
	padding: 4%;
	width: 560px;
}

.sunny, .cloudy, .rainy {
	display: block;
	margin: 30px auto 10px;
	width: 128px;
	height: 128px;
	background: url('../content/web/tabstrip/weather.png') transparent
		no-repeat 0 0;
}

.cloudy {
	background-position: -128px 0;
}

.rainy {
	background-position: -256px 0;
}

.weather {
	margin: 0 auto 30px;
	text-align: center;
}

#tabstrip {
	background-color: white;
	border-style: none;
}

.k-tabstrip:focus {
	box-shadow: none;
}

#tabstrip h2 {
	font-weight: lighter;
	font-size: 5em;
	line-height: 1;
	padding: 0 0 0 30px;
	margin: 0;
}

#tabstrip h2 span {
	background: none;
	padding-left: 5px;
	font-size: .3em;
	vertical-align: top;
}

#tabstrip p {
	margin: 0;
	padding: 0;
}

.k-sabstrip-items .k-state-active, .k-tabstrip-items .k-state-active {
	border-color: black;
	border-top: solid 3px;
	border-left: solid 3px;
	border-right: solid 3px;
}

.k-tabstrip>.k-content {
	border-style: none;
}

.k-tabstrip-items .k-item {
	background-color: white;
}

.sizenum {
	margin-left: 30px;
	width: 10%;
	display: inline;
}
#imgli {
 list-style:none;
}

.form-control{
	border:0;
}
#replyername{
	font-size: 1.3rem;
    font-weight: 600;
}
#replytext{
	border : 1px solid #e5e5e5;
}

</style>
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script>	
		//console.log("=====================");
		//console.log("JS TEST");
		//var bnoValue = ${board.id};
		
		//for List Test
		/*
		
		replyService.getList({bno:bnoValue, page:1}, function(list){
			
			for(var i = 0, len = list.length||0; i< len; i++){
				console.log(list[i]);
			}
			
		});
		*/
		//for replyService add Test
		/*
		replyService.add({
			reply : "JS Test",
			replyer : "tester",
			bno : bnoValue
		}, function(result) {

			alert("RESULT: " + result);
		});
		*/
		//삭제 테스트 26번째댓글
		/*
		replyService.remove(26, function(count){
			
			console.log(count);
			
			if(count == "success"){
				
				alert("REMOVED");
			}
		}, function(err){
			alert('ERROR...');
		});
		*/
		/*
		replyService.update({
			rno : 31,
			bno : bnoValue,
			reply : "Modified Reply...."
		}, function(result) {
			
			alert("게시글 수정 완료");
		});
		
		replyService.get(10, function(data){
			console.log(data);	
		});
		*/
	</script>
	<script>
	
	$(document).ready(function(){
		//$(function(){}); $(document).ready(function(){ }); 와$(function(){ });동일한 의미 간편하게 후자와 같이 많이 사용을 합니다.  
		$(function(){
			var bno = ${board.id};
			
			$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				
				console.log(arr);
				
				var str ="";
				
				$(arr).each(function(i, attach){ 
					if(attach.fileType && attach.maincheck == false ){
						
						//상품 설명 이미지
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'"+
						"data-type='"+attach.fileType+"'><div>";
						str += "<img class='card-img' src='/displayS3images?fileName="+attach.fileName+"&directory=images&uuid="+attach.uuid+"&path="+attach.uploadPath+"'>";
						str += "</div>";
						str += "</li>";
						$(".uploadResult ul").html(str);
					}
				});
				//main img
				var str ="";				
				$(arr).each(function(i, attach){
					if(attach.maincheck){
						//해당 상품 메인 이미지 
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'"+
						"data-type='"+attach.fileType+"' id = 'imgli'><div>";									
						str += "<img class='card-img-top' id = 'productimg' src='/displayS3images?fileName="+attach.fileName+"&directory=images&uuid="+attach.uuid+"&path="+attach.uploadPath+"'>";
						str += "</div>";
						str += "</li>";
						$("#imagecontainer").html(str);
					}
				});
				var str ="";
				$(arr).each(function(i, attach){
					if(!attach.fileType && attach.maincheck ==false){
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'"+
						"data-type='"+attach.fileType+"' ><a><div>";
						str += "<img src='/resources/images/attach.png'>";
						str += "<span>" + attach.fileName+"</span>";
						str += "</div>";
						str += "</a></li>";
						$("#fileuploadhead").html(str);
					}//else end
				});//arr.each end
			//원위치
			});//getjson end
		});//function end
		
		$("#fileuploadhead").on("click", "li", function(e){
			
			console.log("click uploadfile");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			self.location = "/download?fileName="+path;
			
		});
		
	
		var bnoValue = ${board.id};
		var replyUL = $("#replychat");
		//relpy ul
		
		    showList(1);
			//밑에 지정 함수	
			
			//댓글 페이징
			var pageNum = 1;
			var replyPageFooter = $(".footer");
			
			function showReplyPage(replyCnt){
				
				var endNum = Math.ceil(pageNum / 10.0) * 10;
				var startNum = endNum -9;

				var prev = startNum !=1;
				var next = false;
				
				if(endNum * 10 >= replyCnt){
					endNum = Math.ceil(replyCnt/10.0);
					
				}
				if(endNum * 10 < replyCnt){
					
					next = true;
				}
				
				var str = "<ul class='pagination float-right'>";
				
				if(prev){
					str += "<li class='page-item'><a class='page-link' href='"+(starNum -1)+"'>Previous</a></li>";
				}
				
				
				for(var i = startNum ; i <= endNum; i++){
					
					var active = pageNum == i? "active":"";
					
					str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				}
				if(next){
					str+= "<li class ='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
				
				}
				
				str += "</ul></div>";
				
				console.log(str);
				replyPageFooter.html(str);
			}
			
			function showList(page){
				
				console.log("show list" + page);
			
				replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list){
					
					console.log("replyCnt: " + replyCnt);
					console.log("list:" + list);
					console.log(list);
					
					if(page == 1000){ //음수값넣으면 limit 쿼리에서 오류남 차라리 양수값을 상당히 크게하는게 나을듯
						//page로 원하는 페이지 가져오기 -1가져올시  전체값 연산을 통해 맨 마지막 페이지 찾아서 다시호출
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
						//댓글 추가시 showlist(-1)을통해서 전체 댓글 숫자를 파악함 이후 마지막페이지 호출해서 이동시킴
					}
					
					var str = "";
					
					if(list == null || list.length == 0){
						
						return;
					}
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						
						str +="<li class='list-group-item' data-rno='"+list[i].rno+"'>";
						str +="		<div><div class='header_reply'><strong class='primary-font'>"+list[i].replyer+"</strong>";
						str +="		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
						str +="		<p>"+list[i].reply+"</p></div></li>";
						
					}
					
					replyUL.html(str);
					
					showReplyPage(replyCnt);
					}); //function
				
			}//showList
			
			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal.find("label[name='replyer']");
			var modalInputReplyDate = modal.find("input[name='replyDate']");
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			//댓글작성 버튼 누를시
			$("#addReplyBtn").click( function(){
				
				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				
				$(".modal").modal("show");
				
			});
			//댓글 작성버튼 누를시 
			$("#modalRegisterBtn").click( function(e){
				
				console.log("모달 데이터값 체크 InputReply:" + modalInputReply.val());
				console.log("모달 데이터값 체크 InputReplyer:" + modalInputReplyer.text());
				console.log("모달 데이터값 체크 bnoValue:" + bnoValue);
				var reply={
						//입력받은 댓글 데이터
						reply:modalInputReply.val(),
						replyer:modalInputReplyer.text(), 	
						bno:bnoValue
				};
				console.log("버튼 클릭시 reply check : " + reply)
				
				replyService.add(reply, function(result){
					
					alert(result);
					
					modal.find("input").val("");
					modal.modal("hide");
					
					//showList(1);바로그자리에서 보여주기
					showList(1000);
				});
				
			});
			//chat에게 이벤트 걸고 li가 실제 이벤트 대상이 되게 함
			//댓글 클릭 이벤트 
			$("#replychat").on("click", "li", function(e){
				
				var rno = $(this).data("rno");
				var loginusername = modalInputReplyer.text();

				replyService.get(rno, function(reply){
					
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
					.attr("readonly", "readonly");
					modal.data("rno", reply.rno);
					
					modal.find("button[id !='modalCloseBtn']").hide();
					if(loginusername == reply.replyer){
						modalModBtn.show();
						modalRemoveBtn.show();
					}				
					$(".modal").modal("show");
				});
				
				console.log(rno);
			});
			
			modalModBtn.click(function(){
				
				var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
				
				replyService.update(reply, function(result){
					
					alert(result);
					modal.modal("hide");
					showList(pageNum);
					
				});
				
			});
			
			modalRemoveBtn.click(function(){
				
				var rno = modal.data("rno");
				
				replyService.remove(rno, function(result){
					
					alert(result);
					modal.modal("hide");
					showList(pageNum);
					
				});
				
			});
			
			replyPageFooter.on("click" , "li a", function(e){
				//a태그에 이벤트 
				e.preventDefault();
				//기존 기능 막고
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				
				console.log("targetPageNum : " + targetPageNum);
				
				pageNum = targetPageNum;
				
				showList(pageNum);
				
			})
			
			var operForm = $("#operForm");
			

			$("button[data-oper='modify']").on("click", function(e){
				
				operForm.attr("action","/board/modify").submit();
				
			});
			
			$("button[data-oper='list']").on("click", function(e){
				
				operForm.find("#bno").remove();
				operForm.attr("action","/board/list")
				operForm.submit();
			});
			
			
	});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
							var sizeprice = $("#productprice").text();
							$("#size").kendoDropDownList();
							$("#tabstrip").kendoTabStrip({
								animation : {
									open : {
										effects : "fadeIn"
									}
								}
							});
							
							$("#size").change(function() {
												var temp = sizedata;
												var sizedata = $("#size option:selected").val();
												var pricetemp = '';

												if ($("#size" + sizedata).length > 0) { //수행할 코드}{
													//	$('#sizecounter'+sizedata).val('원하는 값');
													$('#' + sizedata).get(0).value++
													var pricevalue = $(
															'#' + sizedata)
															.val();
													setprice = parseInt(sizeprice);
													setprice = setprice
															* parseInt(pricevalue);
													setprice = setprice
															.toString();
													$(".sizeprice" + sizedata)
															.html(setprice);
												} else {
													
													$(".show_size_amount").append(
																	
																	'<div class="row" style="width:100%;"><div class="form-group mb-2" id="size'+sizedata+'" style="border-bottom: 1px solid #e5e5e5;width: 100%;height:50px;"> '
																	
																			+ '<div class="row" style="width:100%;"><div class="col-sm-4" id="productsizediv"><label id="productsize" for="staticEmail" class="col-form-label">'
																			+ sizedata + '</label></div>'
																			+ '<div class="col-sm-4" id ="productsizecounterdiv"><input class="form-control" id ="productsizecounter" name="'
																			+ sizedata
																			+ '" type="number" value="1" min="1" max="10" step="1" style="width=50%;"/></div>'
																			+ '<div class="col-sm-4" id="sizepricediv"><label id="sizepriclabel" class="sizeprice'
																			+ sizedata
																			+ '">'
																			+ sizeprice
																			+ '<button class="btn btn-light type="button" id="x_but" name="x_but'+sizedata+'">X</button></label></div></div></div>'
																			
													);
													
																	
													 var tagPrice = $('#totalprice').text();
													 tagPrice = parseInt(tagPrice);
													 tagPrice = tagPrice + parseInt(sizeprice);
													$("#totalprice").html(tagPrice);
													

												}
												
												

											});

							$("#buybutton").click(function() {
								
								alert("구매 하시겠습니까 ?");
							});
							//jquery 로직
							//append시 토탈금액 합산 추가될시 계속 합연산
							//append하고나서 input 내 가격 변동시 외부에 존재하는 사이즈별 hidden 에 value값을 산정하여
							//value 갯수 별로 계산후 ex) 5개면 4개까지를 총합에서 뺴고 다시 5개를 더하는 식 
							$('.show_size_amount').on('change', '#productsizecounter',function(e){
								
						           var tagid = e.target.name ;
						           console.log("클릭시 보이는 name : " + tagid);
						           var flagval = $('#'+tagid+'price').text();
						           flagval = parseInt(flagval);
						           console.log("비교하기위한 val : " + flagval);
						           var tagVar = $('input[name='+tagid+']').val();
						           tagVar = parseInt(tagVar);
				                   console.log("클릭후바뀐 val : " + tagVar);
						           if(flagval < tagVar){
						        	   //값을 올린거
						        	   
						        	   tagVar = parseInt(tagVar)*parseInt(sizeprice);
				                  	   var tagPrice = $('#totalprice').text();
				                  	   tagPrice = parseInt(tagPrice);
				                  	   console.log("전체합산가격 : " + tagPrice);
				                  	   
				                  	   tagPrice = tagPrice - flagval*parseInt(sizeprice);
				                  	   
				                  	   tagPrice = tagPrice + tagVar;
						        	   
						        	   
				                  	 $("#totalprice").html(tagPrice);
						        	  flagval = flagval + 1; 
						        	 $("#"+tagid+"price").html(flagval);
						           }
						           else if(flagval == tagVar){
						        	   //동결
						        	   
						        	   tagVar = parseInt(tagVar)*parseInt(sizeprice);
				                  	   var tagPrice = $('#totalprice').text();
				                  	   tagPrice = parseInt(tagPrice);
				                  	   console.log("checkPrice : " + tagPrice);
						        	   
				                  	   tagPrice = tagVar;
				                  	   $("#totalprice").html(tagPrice);
						        	   flagval = flagval + 1; 
						        	   $("#"+tagid+"price").html(flagval);
						           }
						           else if(flagval > tagVar){
						        	   //값을 낮춘거
						        	   
						        	   tagVar = parseInt(tagVar)*parseInt(sizeprice);
				                  	   var tagPrice = $('#totalprice').text();
				                  	   tagPrice = parseInt(tagPrice);
				                  	   console.log("val줄일때 합산가격 불러온것 : " + tagPrice);
						        	   var temp;
						        	   temp = flagval*parseInt(sizeprice);
				                  	   tagPrice = tagPrice - temp;
				                  	   tagPrice = tagPrice + tagVar;
			                  	   
				                  	   $("#totalprice").html(tagPrice);
						        	   flagval = flagval - 1;
						        	   $("#"+tagid+"price").html(flagval);
						           }
				                   
							});
							
							$('.show_size_amount').on('click', '#x_but' ,function(e){
								var tagid = e.target.name ;
								tagid = tagid.substring(5,8);
								console.log("test_substring : " + tagid);
								var tagVar = $('input[name='+tagid+']').val();
								var tagPrice = $('#totalprice').text();
								tagPrice = parseInt(tagPrice);
								console.log("test_tagVar: " + tagVar);
								console.log("test_tagPrice : " + tagPrice);
								var temp ='';
								temp = parseInt(sizeprice) * parseInt(tagVar);
								console.log("상품가격 x상품갯수 : " + temp);
								if(temp > tagPrice){
									temp = temp - tagPrice;
								}
								else{
									temp = tagPrice - temp;
								}
								console.log("test xbut_temp : " + temp);
								if(0 > temp || 0 == temp ){
									$("#totalprice").html("0");
								}
								else{
									$("#totalprice").html(temp);
								}
								
								$(this).parent().parent().parent().parent().remove();	
							});

							
						});
	</script>

</body>
</html>