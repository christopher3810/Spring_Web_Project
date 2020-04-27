<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css" />
 	<link rel="stylesheet" href="/resources/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="/resources/styles/kendo.default.min.css" />
    <link rel="stylesheet" href="/resources/styles/kendo.default.mobile.min.css" />

    <script src="/resources/js/jquery.min.js"></script>
    
    <script src="/resources/js/kendo.ui.core.min.js"></script>
    <script src="/resources/js/kendo.dropdownlist.min.js"></script>
   
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
<div id="example">
    <div class="container">
        <div class="k-card k-card-horizontal">
        	<div id="imagecontainer">
            <img id="productimg" class="k-card-image" src="${pageContext.request.contextPath}/resources/images/${board.attachments}">
            </div>
            <div class="k-vbox k-column">
                <div class="k-card-header">
                    <h5 class="k-card-title">${board.title }</h5>
                    <h6 class="k-card-subtitle">Vans sports</h6>
                    <h5 class="k-card-title" id="productprice">${board.price }</h5><h5>원</h5>>
                </div>
                <div class="k-card-body">
                    <p>Delivery Info
                    <p><h7>배송비 : 무료배송</h7>
                    <p>배송방법 : 국내배송
                    <p>평균 배송일 : 2일
                </div>
              <div class="k-card-actions k-card-actions-vertical k-card-actions-stretched">
                 <hr class="k-card-separator">
                <p>Size Info</p>
                <p><h7>상품 사이즈 선택</h7></p>
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
                
                <div class="k-card-actions k-card-actions-vertical k-card-actions-stretched">
                 <!--<span class="k-button k-flat k-primary">Read more</span>
                    <hr class="k-card-separator">
                    <span class="k-button k-flat k-primary">Save for later</span>-->
                </div>
            </div>
        </div>
    </div>
    <!-- 신발 클릭시 주문 들어가는거 추가되는 라인 -->
    <div class="show_size_amount"></div>
    <div class="price_counter" style=" width: 100%; float: right; padding-left:50%;">
    <span style="font-size:10; font-size:larger; color:black;"> 총 결제금액 </span>
    <span style="font-size: xx-large; font-color: red; color: red; margin-left : 45%">10000</span><span>원</span>
    <button type="button" class="btn btn-secondary" style="width:46%;height:50px">장바구니</button>
    <button type="button" class="btn btn-dark" style="width:46%;height:50px">바로구매</button>
    </div>
     <!-- 상단 상품 정보 -->
                        <div id="tabstrip" style="padding : 4%; margin-top:9%;">
                            <ul>
                                <li class="k-state-active" style="width:24%; display: inline-block;
     text-align: center;">
                                    <h3>상품정보</h3>
                                </li>
                                <li style="width:24%; display: inline-block;
     text-align: center;">
                                    <h3>상품후기</h3>
                                </li>
                                <li style="width:24%; display: inline-block;
     text-align: center;">
                                    <h3>Q&A</h3>
                                </li>
                                <li style="width:24%; display: inline-block;
     text-align: center;">
                                    <h3>배송/교환/반품/AS안내</h3>
                                </li>
                            </ul>
                            <div>
                                <h1>상품정보 들어갈 공간</h1>
                            </div>
                            <div>
                                <h2>별점 포함 상품 후기 댓글 들어갈 공간</h2>
                            </div>
                            <div>
                                <h2>상품 Q&A들어갈 공간</h2>
                            </div>
                            <div>
                                <h1>상품 반품및 정보 들어갈 공간</h1>
                            </div>
                        </div>
</div>
    <style>
    
        #example{
            margin-top : 10rem;
        	      }
        #size{
        	height:35px;
        	font-size:15px;
        }
        #productimg {
             width : 100%;
        	 height : 100%;
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
        #imagecontainer{
        	padding : 4%;
        	width : 560px;
        }
         .sunny, .cloudy, .rainy {
                    display: block;
                    margin: 30px auto 10px;
                    width: 128px;
                    height: 128px;
                    background: url('../content/web/tabstrip/weather.png') transparent no-repeat 0 0;
                }

                .cloudy{
                    background-position: -128px 0;
                }

                .rainy{
                    background-position: -256px 0;
                }

                .weather {
                    margin: 0 auto 30px;
                    text-align: center;
                }
				#tabstrip {
                    background-color:white;
                    border-style:none;
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
                .k-sabstrip-items .k-state-active, .k-tabstrip-items .k-state-active{
                	border-color:black;
                	border-top:solid 3px;
                	border-left:solid 3px;
                	border-right:solid 3px;
                }
                .k-tabstrip>.k-content{
                	border-style:none;
                }
                .k-tabstrip-items .k-item{
                	background-color:white;
                }
                #sizecounter{
                	margin-top : 15px;
                	text-align : center;
                	margin-left: 180px;
                	height : 50%;
                	width : 20%;
                }
                .sizenum{
                	margin-left:30px;
                	width:10%;
                	display:inline;
                }
    </style>
    <script>
  	   $(document).ready(function(){
	        var sizeprice = $( "#productprice").text();
  	          $("#size").kendoDropDownList();
  	          $("#tabstrip").kendoTabStrip({
                        animation:  {
                            open: {
                                effects: "fadeIn"
                            }
                        }
                    });
  	          
  	        	
  	          
		       	
  	        $("#size").change(function(){
  	        	var temp = sizedata;
  	        	var sizedata = $("#size option:selected").val();
  	        	var pricetemp = '';

  	        	if ( $("#size"+sizedata).length  > 0 ) { //수행할 코드 }{
  	        	//	$('#sizecounter'+sizedata).val('원하는 값');
  	        		$('#'+sizedata).get(0).value++ 
  	        		var pricevalue = $('#'+sizedata).val();
  	        		setprice = parseInt(sizeprice);
  	        		setprice = setprice * parseInt(pricevalue);
  	        		setprice = setprice.toString();
  	        	    $(".sizeprice"+sizedata).html(setprice);
  	        	}
  	        	else{
  	          $(".show_size_amount").append
  	          ('<div class="orderamount" id="size'+sizedata+'"><h4 class="sizenum">'+sizedata+'</h4><input class="sizecounterclass" id="'+sizedata+'" type="number" value="1" min="0" max="10" step="1" style="margin-top:15px;text-align:center;margin-left:180px;height:50%;width:20%;"/>'+
  	          '<h4 class="sizeprice'+sizedata+'" style="display:inline; margin-left:20%">'+sizeprice+'</h4><h4 class="sizenum" style="margin:0;">원</h4><button type="button" id="x_but'+sizedata+'">X</button></div>');
  	       	 $("#x_but"+sizedata).click(function(){
	    		   $(this).parent().remove();
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