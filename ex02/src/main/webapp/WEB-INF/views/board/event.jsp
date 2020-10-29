<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>신발세상에오신걸 환영합니다</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- css적용완료 -->
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
	<main>
	
		<h1 id="eventbanner">기획전</h1>

		<div id="p-float">
			<c:choose>
				<c:when test="${!empty eventlist}">
					<c:forEach items="${eventlist}" var="event">
						<div class="p-float">
							<div class="p-float-in">
								<a href='/board/boardproduct?id=<c:out value="${event.bno}"/>'>
									<div class="mainimg">
										<ul>
										</ul>
									</div>
									<img class="p-img" align="center" src='https://d3fjc4x2ovyjvz.cloudfront.net/${event.uploadpath}/${event.uuid}'>		
								</a>
								
								<div class="p-name" align="right">${event.name}</div>
								<c:choose>
									<c:when test="${!empty event.startdate}">
									
										<span class = "event_period">
										<img class ="periodicon" style="margin-bottom:4px" src ="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/logo/eventperiodicon.png">
										<fmt:formatDate value="${event.startdate}" pattern="yyyy-MM-dd" />~
										<fmt:formatDate value="${event.enddate}" pattern="yyyy-MM-dd" /> 
										</span>
									</c:when>
								</c:choose>
								</div>
							</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="p-float">
						<div class="p-float-in">
							<h1>마지막장입니다</h1>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>

		
		  <nav aria-label="Page navigation example">
  			<ul class="pagination pagination-lg justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class ="page-item disabled"><a class="page-link"
						href='<c:url value="/board/event?page=${pageMaker.startPage-1 }"/>'><i
							class="fa fa-chevron-left"></i></a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class ="page-item"><a class="page-link"
						href='<c:url value="/board/event?pageNum=${pageNum }"/>'><i
							class="fa">${pageNum }</i></a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class ="page-item"><a class="page-link"
						href='<c:url value="/board/event?page=${pageMaker.endPage+1 }"/>'><i
							class="fa fa-chevron-right"></i></a></li>
				</c:if>
			</ul>
		</nav>
<!--  
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination pagination-lg justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a class="page-link"
							href="${pageMaker.startPage -1}">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cri.pageNum == num ? " active":""}">
							<a class="page-link" href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button"><a class="page-link"
							href="${pageMaker.endPage +1}">Next</a></li>
					</c:if>
				</ul>
			</nav>
-->			

		</div>
		<form id='actionForm' action="/board/event" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		</form>

	</main>
	<style>
	#search-option {
		border-radius: 0; 
		-webkit-appearance: none; 
		-moz-appearance: none; 
		appearance: none; 
		border-style: none;
		}
		
	div.p-float-in{
		border:0px;	
		border-bottom:1px solid #e5e5e5;
		margin-bottom : 15px;
	}
	div.p-name{
		margin-top:10px;
		font-weight: 700;
		font-size: 22px;
		text-align: center;
  	  	font-family: "Montserrat","Noto Sans KR",sans-serif;   	
    	overflow: hidden;
    	height: 60px;
    	max-height: 50px;
    	line-height: 30px;
	}
	div.p-float{
		float : left;
		width : 33%;
	}
	img.p-img{
		width: 100%;
		height : 450px;
	}
	.periodicon{
		width:25px;
		height : 25px;
	}
	.event_period{
    	margin-top: 14px;
    	margin-bottom : 14px;
    	font-family: "Montserrat",sans-serif;
   		font-weight: 600;
    	font-size: 15px;
    	color: #666;
    	line-height: 1;
	}
	#eventbanner{
	    text-align: center;
   	    color: #000;
  	    font-family: "Montserrat","Noto Sans KR",sans-serif;
        font-size: 38px;
        font-weight: 700;
        margin-top : 180px;
	}
		
	</style>
	<script type="text/javascript">
	$(document).ready(function() {
		
		var fileCallPath = encodeURIComponent (attach.uploadPath + "/s_" + attach.uuid + "_"+ attach.fileName);
		"<img id = 'productimg' src='/display?fileName="+fileCallPath+"'>"
				
				console.log(replyService);
				var actionForm = $("#actionForm");

				$(".paginate_button a").on("click",function(e) {
							e.preventDefault();
							console.log('click');

							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
						});					

			});
	</script>
</body>
</html>