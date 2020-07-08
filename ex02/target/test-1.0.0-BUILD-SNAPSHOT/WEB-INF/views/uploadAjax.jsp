<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class='uploadDiv'>
	<input type ='file' name='uploadFile' multiple>
</div>
<div class ='uploadResult'> <!-- 업로드된 파일명 보여줄 부분 -->
<ul>
</ul>
</div>

<button id='uploadBtn'>Upload</button>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<style>
.uploadResult{
	width : 100%;
	background-color : gray;
}
.uploadResult ul{
	display:flex;
	flex-flow: row;
	justify-content : center;
	align-items : center;
}
.uploadResult ul li{
	list-style:none;
	padding : 10px;
	align-content:center;
	text-align:center;
}
.uploadResult ul li img{
	width : 100px; 
}
uploadResult ul li span{
	color:white;
}

.bigPictureWrapper{
	position : absolute;
	display : none;
	justify-content : center;
	align-items : center;
	top : 0%;
	width : 100%;
	height : 100%;
	background-color : gray;
	z-index : 100;
	background:rgba(255,255,255,0.5);
}
.bigPicture{
	position:relative;
	display:flex;
	justify-content: center;
	align-ites : center;
}

.bigPicture img{
	width : 600px;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
 
<script>
//a태그를 이용해서 showimage()직접 호출하기위해  밑에 포함 안시킴 
function showImage(fileCallPath){
	//alert(fileCallPath);
	
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture")
	.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
	.animate({width:'100%', height: '100%'}, 1000);
}//showImage

$(document).ready(function(){
//중요한점 FormData타입의 객체에 각 파일 데이터를 추가하는 것과 이를 Ajax로 전송할 때 약간의 옵션  add
	
	//첨부파일 이용한 웹공격 막기위해 확장자 제한
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //업로드불가능
	var maxSize = 5242880; //5MB
	//파일 확장자와 사이즈 채크
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}//checkExtension
	//input type = "file" 다른 dom요소와 달리 readonly라 안쪽 내용 수정 불가능 하기에 초기화 작업을 해줘야합니다 클론생성 
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		//formdata 갹채 이용 브라우저의 제약이 있으므로 주의요망 가상의 form 필요한 파라미터 담아서 전송
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
				type: 'POST',
				dataType : 'json',
				success: function(result){
					console.log(result);
					
					showUploadedFile(result); //호출
					
					$(".uploadDiv").html(cloneObj.html()); //첨부파일 업로드후에 첨부파일 부분을 초기화시켜줌
				}
		});//$ajax
	});//uploadBtn
	
	
	    var uploadResult = $(".uploadResult ul");
		//showUploadFile은 json 파일 받아 해당 파일 이름 추가 
		function showUploadedFile(uploadResultArr){
			
			var str ="";
			
			$(uploadResultArr).each(function(i, obj){
				if(!obj.image){ //이미지 파일 아닌걸 올리시 파일 업로드 하는 png를 보여줌 
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");	
				
					str += "<li><div><a href ='/download?fileName="+fileCallPath+"'>"+
					"<img src='/resources/images/attach.png'>" + obj.fileName + "</a>"+
					"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
					"</div></li>";
				}else{
					//str += "<li>" + obj.fileName + "</li>"; 업로드파일명
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"+obj.uuid+"_"+obj.fileName);
					
					var originPath = obj.uploadPath + "\\" + obj.uuid +"_"+obj.fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					//생성된 문자열은 '\' 기호 때문에 일반 문자열과 다르게 됨으로 replace RegExp를 활용 /로 변환해서 해줘야 올바른 이미지 경로가된다 !!!
					
					str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"
					+"<img src ='/display?fileName="+fileCallPath+"'></a>"+
					"<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
					"<li>";//uri + s_ uuid 
				}
			}); //each
			uploadResult.append(str); //ul에 추가 
		}//showuploadfile
		
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			}, 1000);
		}); //bigPictureWrapper
		
		$(".uploadResult").on("click","span", function(e){
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url:'/deleteFile',
				data:{fileName: targetFile, type:type},
				dataType:'text',
				type: 'POST',
					success: function(result){
							alert(result);
					}
			}); //ajax
		}); //uploadResult
		
		
});
</script>
</body>
</html>