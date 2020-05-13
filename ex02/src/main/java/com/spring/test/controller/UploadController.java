package com.spring.test.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		
		log.info("upload form");
	}
	//스프링에서 제공하는 multipartfile 타입 사용 화면에서 첨부파일 여러가지 선택시 대비 배열 타입으로 설정후 파일 업로드
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "D:\\web_upload"; //위치
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("-----------------------------------------");
			log.info("Upload File Name : " +multipartFile.getOriginalFilename());
			log.info("Upload File Size : " +multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename()); //업로드되는 파일의 이름 와 경로
			
			try {
				multipartFile.transferTo(saveFile);	//transferTo()의 파라미터로 java.io.File의 객체를 지정하면 되기에 업로드는 원래 파일의 이름으로 경로에 저장			
			}catch (Exception e) {
				log.error(e.getMessage());
			}//try/catch
		}//for
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	//날짜 경로 문자열로 생성 첨부파일 보관 폴더 생성 
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator); //년월일 폴더
	}
	
	// AJAX 결과 데이터 전달 하면서 리턴 타입이 달라지도록함 파라미터에서는 Ajax 방식 이용하기 때문에 Model을 사용할 일이 없으므로 사용하지 않음
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		
		String uploadFolder = "D:\\web_upload";
		
		//폴더 만듣기
		File uploadPath = new File(uploadFolder , getFolder());
		log.info("upload path: " + uploadPath);
		
		//경로체크후 폴더생성
		if(uploadPath.exists() == false) {
			
			uploadPath.mkdirs();//상위폴더까지 한번에 생성가능
		}
		//폴더를 해당연도/해당월/해당일로 생성
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("----------------------------------");
			log.info("Upload File Nmae : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//파일 경로
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			
			//범용고유식별자 UUID 파일명 중복 방지 / 첨부파일 다운로드시 다른파일 예측하여 다운로드 하는것 방지/ 일련번호대신 유추하기 힘든 식별자 사용 다른컨텐츠 임의접근 방지
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName; //원래 파일 이름과 구분 중간에 '_' 넣기
			
			
			try {
				File saveFile = new File(uploadPath, uploadFileName); //폴더로 저장
				multipartFile.transferTo(saveFile);
				//이부분에서 이미지 파일 확인해야됨
				if(checkImageType(saveFile)) {
					//앞에 s로시작하는 썸네일 파일 생성`
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail, 100, 100);
					//reateThumbnail(InputStream is, OutputStream os, int width, int height) thumbnail 이 아웃풋 스트림 객체 뒤에두가지는 사이즈지정
					thumbnail.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
				log.error(e.getMessage());
			}//end catch
		}// end for
		
	}
	//브라우저만을 통해 오지 않기때문에 확인을 추가적으로 해줘야됨 서버에서 업로드된 파일이 이미지인지 아닌지 체크후 저장하는게 좋음 썸네일사용시 이미지 종류 파일인지 아닌지 확인하기 때문
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");	
		}catch (IOException e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	

}
