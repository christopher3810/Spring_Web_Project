<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Floating Div Product Grid Demo</title>
<link rel="stylesheet" href="/resources/styles/kendo.common.min.css" />
<link rel="stylesheet" href="/resources/styles/kendo.default.min.css" />
<link rel="stylesheet"
	href="/resources/styles/kendo.default.mobile.min.css" />
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/kendo.ui.core.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- css적용완료 -->
</head>
<body>

	<header id="header">
		<div class="search-wrapper" style="width: 100%">
			<form id="search-bar" action="/board/list" method='get'>
				<select name='type' id="search-option">
					<option value="T" selected>통합검색</option>
				</select> 
				<input type="text" name="keyword" id="focus" required class="search-box"
					placeholder="제품명을 입력하세요" style="width: 50%" value='<c:out value="${pageMaker.cri.keyword}" />'/>
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
				<button class="close-icon" type="reset"></button>
			</form>
		</div>
		</div>
		<nav id="headmenu">
			<ul>
				<li><a class="site-logo" href="/board/list">Logo</a></li>
				<li><a href="#">MEN</a>
					<ul>

						<li><a href="#">운동화</a>
							<ul>
								<li><a href="#">스니커즈</a></li>
								<li><a href="#">캔버스화</a></li>
							</ul></li>

						<li><a href="#">스포츠</a>
							<ul>
								<li><a href="#">런닝화</a></li>
								<li><a href="#">축구화</a></li>
							</ul></li>

						<li><a href="#">구두</a>
							<ul>
								<li><a href="#">옥스포드</a></li>
								<li><a href="#">로퍼</a></li>
							</ul></li>

						<li><a href="#">샌들</a>
							<ul>
								<li><a href="#">아쿠아슈즈</a></li>
								<li><a href="#">스트랩샌들</a></li>
							</ul></li>

						<li><a href="#">잡화</a>
							<ul>
								<li><a href="#">가방</a></li>
								<li><a href="#">모자</a></li>
							</ul></li>

					</ul></li>
				<!--men-->


				<li><a href="#">WOMEN</a>
					<ul>

						<li><a href="#">운동화</a>
							<ul>
								<li><a href="#">스니커즈</a></li>
								<li><a href="#">캔버스화</a></li>
							</ul></li>

						<li><a href="#">스포츠</a>
							<ul>
								<li><a href="#">런닝화</a></li>
								<li><a href="#">축구화</a></li>
							</ul></li>

						<li><a href="#">구두</a>
							<ul>
								<li><a href="#">플랫</a></li>
								<li><a href="#">힐</a></li>
								<li><a href="#">로퍼</a></li>
							</ul></li>

						<li><a href="#">샌들</a>
							<ul>
								<li><a href="#">아쿠아슈즈</a></li>
								<li><a href="#">스트랩샌들</a></li>
							</ul></li>

						<li><a href="#">잡화</a>
							<ul>
								<li><a href="#">가방</a></li>
								<li><a href="#">모자</a></li>
							</ul></li>

					</ul></li>

				<li><a href="#">KIDS</a>
					<ul>

						<li><a href="#">운동화</a>
							<ul>
								<li><a href="#">스니커즈</a></li>
								<li><a href="#">캔버스화</a></li>
							</ul></li>

						<li><a href="#">스포츠</a>
							<ul>
								<li><a href="#">런닝화</a></li>
								<li><a href="#">축구화</a></li>
							</ul></li>

						<li><a href="#">샌들</a>
							<ul>
								<li><a href="#">아쿠아슈즈</a></li>
								<li><a href="#">스트랩샌들</a></li>
							</ul></li>

					</ul></li>
				<li><a href="#">EVENT</a></li>
				<li><a href="#">기획전</a></li>
			</ul>
		</nav>
	</header>
	<!-- /header -->

	<main>
		<h1>Resize your browser to preview okayNav</h1>
		<div id="p-float">
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list }" var="board">
						<div class="p-float">
							<div class="p-float-in">
								<a href='/board/boardproduct?id=<c:out value="${board.id}"/>'><img
									class="p-img" align="center"
									src="${pageContext.request.contextPath}/resources/images/${board.attachments}" />
								</a>
								<div class="p-name" align="right">${board.title }</div>
								<div class="p-price" align="right">${board.price }원</div>
								<div class="p-desc" align="right">
									<fmt:formatDate value="${board.create_time }"
										pattern="yyyy-MM-dd" />
								</div>
								<div class="p-desc" align="right">좋아요 : ${board.likes}</div>
								<button class="p-add" align="right">Add to Cart</button>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="p-float">
						<div class="p-float-in">
							<h1>마지막 장입니다</h1>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>

		<!--
		  <nav aria-label="Page navigation example">
  			<ul class="pagination pagination-lg justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class ="page-item disabled"><a class="page-link"
						href='<c:url value="/board/list?page=${pageMaker.startPage-1 }"/>'><i
							class="fa fa-chevron-left"></i></a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="pageNum">
					<li class ="page-item"><a class="page-link"
						href='<c:url value="/board/boardList?page=${pageNum }"/>'><i
							class="fa">${pageNum }</i></a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class ="page-item"><a class="page-link"
						href='<c:url value="/board/boardList?page=${pageMaker.endPage+1 }"/>'><i
							class="fa fa-chevron-right"></i></a></li>
				</c:if>
			</ul>
		</nav>
-->
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination pagination-lg justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a class="page-link"
							href="${pageMaker.startPage -1}">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cri.pageNum == num? "active":""}">
							<a class="page-link" href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button"><a class="page-link"
							href="${pageMaker.endPage +1}">Next</a></li>
					</c:if>
				</ul>
			</nav>
			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>

		</div>

	</main>
	<style>
	#search-option {
		border-radius: 0; /* 아이폰 사파리 보더 없애기 */
		-webkit-appearance: none; /* 화살표 없애기 for chrome*/
		-moz-appearance: none; /* 화살표 없애기 for firefox*/
		appearance: none; /* 화살표 없애기 공통*/
		border-style: none;
		}
		
	#search-option::-ms-expand {display:none}
	</style>

	<script type="text/javascript">
		$(document).ready(
				function() {

					var actionForm = $("#actionForm");

					$(".paginate_button a").on(
							"click",
							function(e) {

								e.preventDefault();
								console.log('click');

								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();
							});
					

				});
	</script>
</body>
</html>