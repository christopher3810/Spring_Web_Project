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
				<li><a class="site-logo" href="#">Logo</a></li>
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
            <img id="productimg" class="k-card-image" src="/resources/images/운동화1.jpg">
            </div>
            <div class="k-vbox k-column">
                <div class="k-card-header">
                    <h5 class="k-card-title">반스스포츠</h5>
                    <h6 class="k-card-subtitle">Vans sports</h6>
                    <h5 class="k-card-title">35000원</h5>
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
                <option disabled>신발 사이즈를 골라주세요</option>
                <option>220</option>
                <option>230</option>
                <option>240</option>
                <option>250</option>
                <option>260</option>
                <option>270</option>
                <option>280</option>
                <option>290</option>
            </select>
                </div>
                <hr class="k-card-separator">
                <div class="show_size_amount"></div>
                <div class="k-card-actions k-card-actions-vertical k-card-actions-stretched">
                    <span class="k-button k-flat k-primary">Read more</span>
                    <hr class="k-card-separator">
                    <span class="k-button k-flat k-primary">Save for later</span>
                </div>
            </div>
        </div>
    </div>
    <!-- 상단 상품 정보 -->
                <div class="demo-section k-content">
                        <div id="tabstrip">
                            <ul>
                                <li class="k-state-active">
                                    Paris
                                </li>
                                <li>
                                    New York
                                </li>
                                <li>
                                    London
                                </li>
                                <li>
                                    Moscow
                                </li>
                            </ul>
                            <div>
                                <span class="rainy">&nbsp;</span>
                                <div class="weather">
                                    <h2>17<span>&ordm;C</span></h2>
                                    <p>Rainy weather in Paris.</p>
                                </div>
                            </div>
                            <div>
                                <span class="sunny">&nbsp;</span>
                                <div class="weather">
                                    <h2>29<span>&ordm;C</span></h2>
                                    <p>Sunny weather in New York.</p>
                                </div>
                            </div>
                            <div>
                                <span class="sunny">&nbsp;</span>
                                <div class="weather">
                                    <h2>21<span>&ordm;C</span></h2>
                                    <p>Sunny weather in London.</p>
                                </div>
                            </div>
                            <div>
                                <span class="cloudy">&nbsp;</span>
                                <div class="weather">
                                    <h2>16<span>&ordm;C</span></h2>
                                    <p>Cloudy weather in Moscow.</p>
                                </div>
                            </div>
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
        	width : 50%;
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
                	border-top:solid 1px;
                }
                
    </style>
    <script>
  	   $(document).ready(function(){
  	          $("#size").kendoDropDownList();
  	          $("#tabstrip").kendoTabStrip({
                        animation:  {
                            open: {
                                effects: "fadeIn"
                            }
                        }
                    });
  	        $("#size").change(function(){
  	          $(".show_size_amount").append('<div class="orderamount"><h3 id ="orderamoutnumber">230</h3><input type="number" value="0" min="0" max="10" step="1"/></div>');
        });
	</script>
</body>
</html>