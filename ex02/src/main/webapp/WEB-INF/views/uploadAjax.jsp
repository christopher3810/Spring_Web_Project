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

<button id='uploadBtn'>Upload</button>

<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  
<script>
$(document).ready(function(){
//중요한점 FormData타입의 객체에 각 파일 데이터를 추가하는 것과 이를 Ajax로 전송할 때 약간의 옵션  add
	
	
	$("#uploadBtn").on("click", function(e){
		
		var formData = new FormData();
		//formdata 갹채 이용 브라우저의 제약이 있으므로 주의요망 가상의 form 필요한 파라미터 담아서 전송
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		//add filedate to formdata
		for(var i = 0; i<files.length; i++){
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				alert("Uploaded");
			}
	
		});//ajax
	});
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
	}
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		
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
				success: function(result){
					alert("Uploaded");
				}
		});//$ajax
	});//uploadBtn
});
</script>
</body>
</html>