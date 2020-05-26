<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>패이지 수정</title>
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
<header id="header">
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
	<!-- 본문 -->
	<div id="example">
		<div id="add-product" class="demo-section k-content">
			<p class="title">새로운 상품 등록</p>
			<form id="ticketsForm" role="form" action="/board/modify" method="post">
				<ul id="fieldlist">
					<li><label for="fullname" class="required">게시물 번호</label>
					<input class="form-control" name="id" value="${board.id}" readonly="readonly"
					style="width: 50%; height: 30px;"></li>
					<li><label for="fullname" class="required">상품명</label> <input
						type="text" id="title" name="title" class="k-textbox"
						placeholder="상품명" required validationMessage="Enter {0}" value="${board.title}"
						style="width: 50%; height: 30px;" /></li>
					<li><label>상품가격:</label> <input id="price" name='price' type="number"
						title="currency" value="${board.price}" min="0" max="10000000"
						style="width: 50%; height: 30px;" /></li>
					<li><label for="tel" class="required">상품상세정보</label> <input
						type="tel" id="tel" name="content" class="k-textbox" pattern="\d{10}"
						placeholder="Enter a ten digit number" required
						validationMessage="Enter at least ten digits" value ="${board.content}"
						style="width: 50%; height: 30px;" /></li>
					<li>
						<hr>
						<h2>상품 사이즈 입력</h2>
					</li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 220</label>  <input class="form-control" type="number" value="${board.size220}" id="example-number-input" name ='size220'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 230</label>  <input class="form-control" type="number" value="${board.size230}" id="example-number-input" name ='size230'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 240</label>  <input class="form-control" type="number" value="${board.size240}" id="example-number-input" name ='size240'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 250</label>  <input class="form-control" type="number" value="${board.size250}" id="example-number-input" name ='size250'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 260</label>  <input class="form-control" type="number" value="${board.size260}" id="example-number-input" name ='size260'></li>

					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 270</label>  <input class="form-control" type="number" value="${board.size270}" id="example-number-input" name ='size270'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 280</label>  <input class="form-control" type="number" value="${board.size280}" id="example-number-input" name ='size280'></li>
					<li id="size"><label for="tel" class="required"
						style="width: 100%;"> 290</label>  <input class="form-control" type="number" value="${board.size290}" id="example-number-input" name ='size290'></li>

					<li class="confirm" style="width: 100%;">
						<button class="k-button k-primary" type="submit" data-oper='modify'>수정완료</button>
						<button class="k-button k-primary" type="submit" data-oper='remove'>게시물삭제</button>
						<button class="k-button k-primary" type="submit" data-oper='list'>리스트로돌아가기</button>
					</li>
					<li class="status"></li>
					<div class="card" style="width: 100%;">

						<div class="card-header">상품 설명 파일 이미지 업로드</div><!-- card header -->
						<!-- head of panel -->

						<div class="card-body">
							<div class="form-group uploadDiv">
								<input type="file" name='uploadFile' multiple>
							</div>

							<div class='uploadResult'>
								<ul>

								</ul>
							</div>

						</div>
						<!-- end card-body -->

					</div>
					<!-- end card -->
					<!--<input class="form-control" name='update_time' value='<fmt:formatDate pattern = "yyyy/MM/dd" value ="${board.update_time}" />'
					readonly = "readonly">-->
					
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
	margin-top: 10rem;
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
<script type="text/javascript">	
	$(document).ready(function(){
		var formObj = $("form");
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation == 'remove'){
				formObj.attr("action", "/board/remove");	
			}else if(operation == 'list'){
				
				self.location = "/board/list";
				return;
			}
			formObj.submit();
		});
	});
</script>
</body>
</html>