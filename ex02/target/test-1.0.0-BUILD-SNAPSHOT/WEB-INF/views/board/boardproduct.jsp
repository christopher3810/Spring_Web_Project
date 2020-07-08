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
<div class="all">
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
	<div id="example">
		<div class="container">
			<div class="k-card k-card-horizontal">
				<div id="imagecontainer">
					<!--  <img id="productimg" class="k-card-image"
						src="${pageContext.request.contextPath}/resources/images/${board.attachments}">-->
				</div>
				<div class="k-vbox k-column">
					<div class="k-card-header">
						<h5 class="k-card-title">${board.title }</h5>
						<h6 class="k-card-subtitle">Vans sports</h6>
						<h5 class="k-card-title" id="productprice">${board.price }</h5>
						<h5>원</h5>
					</div>
					<div class="k-card-body">
						<p>Delivery Info
						<p>
							<h7>배송비 : 무료배송</h7>
						<p>배송방법 : 국내배송
						<p>평균 배송일 : 2일
					</div>
					<div
						class="k-card-actions k-card-actions-vertical k-card-actions-stretched">
						<hr class="k-card-separator">
						<p>Size Info</p>
						<p>
							<h7>상품 사이즈 선택</h7>
						</p>
						<select id="size" style="width: 100%;">
							<option value='220'>220</option>
							<option value='230'>230</option>
							<option value='240'>240</option>
							<option value='250'>250</option>
							<option value='260'>260</option>
							<option value='270'>270</option>
							<option value='280'>280</option>
							<option value='290'>290</option>
						</select>
					</div>
					<hr class="k-card-separator">

					<div
						class="k-card-actions k-card-actions-vertical k-card-actions-stretched">
						<!--<span class="k-button k-flat k-primary">Read more</span>
                    <hr class="k-card-separator">
                    <span class="k-button k-flat k-primary">Save for later</span>-->
					</div>
				</div>
			</div>
		</div>
		<!-- 신발 클릭시 주문 들어가는거 추가되는 라인 -->
		<div class="show_size_amount"></div>
		<div class="price_counter"
			style="width: 100%; float: right; padding-left: 50%;">
			<span style="font-size: 10; font-size: larger; color: black;">
				총 결제금액 </span> <span
				style="font-size: xx-large; font-color: red; color: red; margin-left: 45%">10000</span><span>원</span>
			<button type="button" class="btn btn-secondary"
				style="width: 46%; height: 50px">장바구니</button>
			<button type="button" class="btn btn-dark"
				style="width: 46%; height: 50px">바로구매</button>
		</div>
		
		<!-- 상단 상품 정보 -->
		<div id="tabstrip" style="padding: 4%; margin-top: 9%;">
			<ul>
				<li class="k-state-active"
					style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px">상품정보</h3>
				</li>
				<li style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px">상품후기</h3>
				</li>
				<li style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px">Q&A</h3>
				</li>
				<li style="width: 24%; height: 70px;display: inline-block; text-align: center;">
					<h3 style="margin-top:19px">배송/교환/반품/AS안내</h3>
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
			
				<sec:authorize access="isAuthenticated()">
		
				<c:if test="${pinfo.username eq board.writer}">
						
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
		<label>댓글내용</label>
		<input class="form-control" name='reply' value='NewReply!!!!'>
		</div>
		<div class="form-group">
			<label>댓글 작성자</label>
			<input class="form-control" name='replyer' value='replyer'>
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
	<style>
.all{
	width: 1350px;
    max-width: none !important;
     /*반응형 막기*/
}
#example {
	margin-top: 10rem;
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

#sizecounter {
	margin-top: 15px;
	text-align: center;
	margin-left: 180px;
	height: 50%;
	width: 20%;
}

.sizenum {
	margin-left: 30px;
	width: 10%;
	display: inline;
}
#imgli {
 list-style:none;
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
						var test = attach.uploadPath + "/s_" + attach.uuid + "_"+ attach.fileName
						//s_ 섬네일용 사진이라 크기확대시 깨짐 원본 이미지를 넣어주자 
						var fileCallPath = encodeURIComponent (attach.uploadPath + "/" + attach.uuid + "_"+ attach.fileName);
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'"+
						"data-type='"+attach.fileType+"'><div>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
						$(".uploadResult ul").html(str);
					}
				});
				//main img
				var str ="";				
				$(arr).each(function(i, attach){
					if(attach.maincheck == true){
						var fileCallPath = encodeURIComponent (attach.uploadPath + "/" + attach.uuid + "_"+ attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'"+
						"data-type='"+attach.fileType+"' id = 'imgli'><div>";
						str += "<img id = 'productimg' src='/display?fileName="+fileCallPath+"'>";
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
		
		    showList(1);
			
			
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
			var modalInputReplyer = modal.find("input[name='replyer']");
			var modalInputReplyDate = modal.find("input[name='replyDate']");
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			$("#addReplyBtn").click( function(){
				
				modal.find("input").val("");
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				
				$(".modal").modal("show");
				
			});
			
			modalRegisterBtn.on("click", function(e){
				
				var reply={
						//입력받은 댓글 데이터
						reply: modalInputReply.val(),
						replyer:modalInputReplyer.val(),
						bno:bnoValue
				};
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
				
				replyService.get(rno, function(reply){
					
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
					.attr("readonly", "readonly");
					modal.data("rno", reply.rno);
					
					modal.find("button[id !='modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					
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
												var sizedata = $(
														"#size option:selected")
														.val();
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
													$(".show_size_amount")
															.append(
																	'<div class="orderamount" id="size'+sizedata+'"><h4 class="sizenum">'
																			+ sizedata
																			+ '</h4><input class="sizecounterclass" id="'
																			+ sizedata
																			+ '" type="number" value="1" min="0" max="10" step="1" style="margin-top:15px;text-align:center;margin-left:180px;height:50%;width:20%;"/>'
																			+ '<h4 class="sizeprice'
																			+ sizedata
																			+ '" style="display:inline; margin-left:20%">'
																			+ sizeprice
																			+ '</h4><h4 class="sizenum" style="margin:0;">��</h4><button type="button" id="x_but'+sizedata+'">X</button></div>');
													$("#x_but" + sizedata)
															.click(
																	function() {
																		$(this)
																				.parent()
																				.remove();
																	});

												}

											});
							/* 
							$(".sizecounterclass").change(function(e){  
							 var tagid = e.target.getAttribute('id');
							 var tagVar = $('#'+tagid).val();
							 var tagPrice = ''; 	     	 
							 tagprice = parsInt(sizeprice)
							 tagprice = tagprice * parseInt(tagVar);
							 tagprice = tagprice.toString();
							 $(".sizeprice"+tagId).html(tagprice);
							});
							 */

						});
	</script>

</body>
</html>