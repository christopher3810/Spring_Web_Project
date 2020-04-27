<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css" />
    <link rel="stylesheet" href="/resources/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="/resources/styles/kendo.default.min.css" />
    <link rel="stylesheet" href="/resources/styles/kendo.default.mobile.min.css" />

    <script src="/resources/js/jquery.min.js"></script>
    
    
    <script src="/resources/js/kendo.all.min.js"></script>
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

   <div id="example">
            <div id="add-product" class="demo-section k-content">
                <p class="title">새로운 상품 등록</p>
                <form id="ticketsForm">
                <ul id="fieldlist">
                    <li>
                        <label for="fullname" class="required">상품명</label>
                        <input type="text" id="fullname" name="fullname" class="k-textbox" placeholder="상품명" required validationMessage="Enter {0}" style="width: 50%; height:30px;" />
                    </li>
                    <li>
                        <label>상품가격:</label>
                            <input id="currency" type="number" title="currency" value="10000" min="0" max="10000000" style="width: 50%;height:30px;" />
                        
                    </li>
                    <li>
                        <label for="amount">Attachment(제품사진)</label>
                        <input name="files" id="files" type="file" aria-label="files" />
                    <p style="padding-top: 1em; text-align: right"></p>
                    </li>
                    <li>
                        <label for="tel" class="required">상품상세정보</label>
                        <input type="tel" id="tel" name="tel" class="k-textbox" pattern="\d{10}" placeholder="Enter a ten digit number" required
                            validationMessage="Enter at least ten digits" style="width: 50%;height:30px;" />
                    </li>
                  <li>
                    <hr>
                    <h2>상품 사이즈 입력</h2>
                    </li>
                    <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            220</label>
                            <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                      <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            230</label>
                             <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                      <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            240</label>
                            <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                      <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            250</label>
                            <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                      <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            260</label>
                            <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                  
                  <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            270</label>
                            <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                      <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            280</label>
                             <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                      <li id="size">
                        <label for="tel" class="required" style="width: 100%;">
                            290</label>
                            <input id="numeric" type="number" title="numeric" value="17" min="0" max="100" step="1" style="width: 60%;" />                   
                    </li>
                   
                    <li class="confirm" style="width: 100%;">
                        <button class="k-button k-primary" type="submit">Submit</button> <button class="k-button k-primary" type="reset">Reset</button>
                    </li>
                    <li class="status">
                    </li>
            </form>
            </div>


            <script>
                $(document).ready(function() {
                    // create NumericTextBox from input HTML element
                    $("#numeric").kendoNumericTextBox();

                    // create Curerncy NumericTextBox from input HTML element
                    $("#currency").kendoNumericTextBox({
                        format: "c",
                        decimals: 3
                    });

                    // create Percentage NumericTextBox from input HTML element
                    $("#percentage").kendoNumericTextBox({
                        format: "p0",
                        min: 0,
                        max: 0.1,
                        step: 0.01
                    });

                    // create NumericTextBox from input HTML element using custom format
                    $("#custom").kendoNumericTextBox({
                        format: "#.00 kg"
                    });
                });
            </script>

            <style>
              .confirm{
                float:left;
              }
               #size{
                width: 20%;
                float:left;
                }
         	     #example{
        		    margin-top : 10rem;
        	      }
                .demo-section {
                    padding: 0;
                }
                #add-product{
                	text-align : center;
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
                    float:left;
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

                span.k-widget.k-tooltip-validation {
                    display; inline-block;
                    width: 160px;
                    text-align: left;
                    border: 0;
                    padding: 0;
                    margin: 0;
                    background: none;
                    box-shadow: none;
                    color: red;
                }

                .k-tooltip-validation .k-warning {
                    display: none;
                }
            </style>

        </div>

</body>
</html>
