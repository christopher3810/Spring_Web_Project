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
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>

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
	<!-- /header -->

	<main>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/mainbanner/testbanner_1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/mainbanner/testbanner_2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://sungmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/mainbanner/testbanner_3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		<h1 style ="margin-top:30px; margin-bottom:30px;" id ="pc_se1_text">그냥 갈수 없는 신발 모음집</h1>
		<h1 style ="margin-top:30px; margin-bottom:30px;" id ="mobile_sec1_text">NEW ARRIVALS</h1>
		<div class="card-group" id="card_group">
		<div class="row justify-content-center" style="padding:10px; width : 100%">
		<c:choose>
				<c:when test="${!empty list}">
					<c:set var="cnt" value="0"/>
					<c:forEach items="${list}" var="board">	
						<div class="card" id="productcard">
							<a href='/board/boardproduct?id=<c:out value="${board.id}"/>'>
							<img class="card-img-top" src='https://d3fjc4x2ovyjvz.cloudfront.net${board.attachments}?w=200&h=200&q=100' alt="Card image cap"></a>
								 <div class="card-body">
   									<h5 class="card-title" id="product_title_text">${board.title }</h5>
   									 <p class="card-text" id="product_content_text">${board.content}</p>
    								 <p class="card-text" id="product_price_text">
    								 <fmt:formatNumber type="number" maxFractionDigits="3" value="${board.price }" />원</p>
   		 							<div class="p-desc" align="right">
										<c:choose>
											<c:when test="${!empty board.update_time}">
												<p class="card-text"><small class="text-muted">업데이트 :<fmt:formatDate value="${board.update_time }"
												pattern="yyyy-MM-dd" /></small></p>
											</c:when>
											<c:when test="${empty board.update_time}">
											<p class="card-text"><small class="text-muted">
												생성일자 : <fmt:formatDate value="${board.create_time }"
													pattern="yyyy-MM-dd" /></small></p>
											</c:when>
										</c:choose>
									</div>
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
		</div>
			
			
			
		<!--  
		<div id="p-float">
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="board">
						<div class="p-float">
							<div class="p-float-in">
								<a href='/board/boardproduct?id=<c:out value="${board.id}"/>'>
									<div class="mainimg">
										<ul>
										</ul>
									</div>
									<img class="p-img" align="center" src='https://d3fjc4x2ovyjvz.cloudfront.net${board.attachments}'>		
								</a>
								
								<div class="p-name" align="right">${board.title }</div>
								<div class="p-price" align="right">${board.price }원</div>
								<div class="p-desc" align="right">
								<c:choose>
									<c:when test="${!empty board.update_time}">
    									<font color="red">업데이트</font> : <fmt:formatDate value="${board.update_time }"
										pattern="yyyy-MM-dd" />
									</c:when>
									<c:when test="${empty board.update_time}">
										생성일자 : <fmt:formatDate value="${board.create_time }"
											pattern="yyyy-MM-dd" />
									</c:when>
								</c:choose>
								</div>
								<div class="p-desc" align="right">좋아요 : ${board.likes} & 댓글 <b>[<c:out value="${board.replyCnt}" />]</b></div>
								<button class="p-add" align="right">Add to Cart</button>
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
		-->
		
		  <nav aria-label="Page navigation example" id="pagenation">
  			<ul class="pagination pagination-lg justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class ="page-item disabled"><a class="page-link"
						href='<c:url value="/board/list?page=${pageMaker.startPage-1 }"/>'><i
							class="fa fa-chevron-left"></i></a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class ="page-item"><a class="page-link"
						href='<c:url value="/board/list?pageNum=${pageNum }"/>'><i
							class="fa">${pageNum }</i></a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class ="page-item"><a class="page-link"
						href='<c:url value="/board/list?page=${pageMaker.endPage+1 }"/>'><i
							class="fa fa-chevron-right"></i></a></li>
				</c:if>
			</ul>
		</nav>

		<div class="autoplay" id="mobileslider">
			<c:choose>
				<c:when test="${!empty recentlist}">
					<c:forEach items="${recentlist}" var="recent">	
								<div>
									<div class="card" id="mobilecard">
										<a href='/board/boardproduct?id=<c:out value="${recent.id}"/>'>
											<img class="card-img-top" src='https://d3fjc4x2ovyjvz.cloudfront.net${recent.attachments}?w=200&h=200&q=100' alt="Card image cap"></a>
												 <div class="card-body">
   													<h5 class="card-title">${recent.title }</h5>
   													 <p class="card-text">${recent.content}</p>
    												 <p class="card-text">${recent.price }원</p>		
												</div>
  									</div>
								</div>
					</c:forEach>				
				</c:when>
			</c:choose>
		</div>

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
		<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		</form>
	</main>

	<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			
				$('.autoplay').slick({
				  slidesToShow: 3,
				  slidesToScroll: 1,
				  autoplay: true,
				  autoplaySpeed: 2000,
				});
			
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