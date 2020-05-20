package com.spring.test.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.test.domain.AttachFileDTO;

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
		//mm소문자말고 MM대문자 확인 할것 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator); //년월일 폴더
	}
	
	// AJAX 결과 데이터 전달 하면서 리턴 타입이 달라지도록함 파라미터에서는 Ajax 방식 이용하기 때문에 Model을 사용할 일이 없으므로 사용하지 않음 /attachFileDTO의리스트를 반환하는 구조로 
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<AttachFileDTO>>uploadAjaxPost(MultipartFile[] uploadFile) {
		
			List<AttachFileDTO> list = new ArrayList<>();
			String uploadFolder = "D:\\web_upload";
		
			String uploadFolderPath = getFolder();
			
		//폴더 만듣기
			File uploadPath = new File(uploadFolder , uploadFolderPath);
			log.info("upload path: " + uploadFolderPath);
		
		//경로체크후 폴더생성
			if(uploadPath.exists() == false) {
			
				uploadPath.mkdirs();//상위폴더까지 한번에 생성가능
			}
		//폴더를 해당연도/해당월/해당일로 생성
			for(MultipartFile multipartFile : uploadFile) {
				
				AttachFileDTO attachDTO = new AttachFileDTO();
			
				log.info("----------------------------------");
				log.info("Upload File Nmae : " + multipartFile.getOriginalFilename());
				log.info("Upload File Size : " + multipartFile.getSize());
			
				String uploadFileName = multipartFile.getOriginalFilename();
			
			//파일 경로
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				log.info("only file name : " + uploadFileName);
				attachDTO.setFileName(uploadFileName);
				//파일명set
			//범용고유식별자 UUID 파일명 중복 방지 / 첨부파일 다운로드시 다른파일 예측하여 다운로드 하는것 방지/ 일련번호대신 유추하기 힘든 식별자 사용 다른컨텐츠 임의접근 방지
				UUID uuid = UUID.randomUUID();
			
				uploadFileName = uuid.toString() + "_" + uploadFileName; //원래 파일 이름과 구분 중간에 '_' 넣기
			
			
				try {
					File saveFile = new File(uploadPath, uploadFileName); //폴더로 저장
					multipartFile.transferTo(saveFile); //transferTO업로드 한 파일 데이터를 지정한 파일에 저장한다
					
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);
				//이부분에서 이미지 파일 확인해야됨
					if(checkImageType(saveFile)) {
					//앞에 s로시작하는 썸네일 파일 생성`
						attachDTO.setImage(true); //이미지있으면 TRUE
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
						Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail, 100, 100);
					//reateThumbnail(InputStream is, OutputStream os, int width, int height) thumbnail 이 아웃풋 스트림 객체 뒤에두가지는 사이즈지정
						thumbnail.close();
					}
					
					list.add(attachDTO); //리스트추가 
				}catch (Exception e) {
					e.printStackTrace();
					log.error(e.getMessage());
				}//end catch
			}// end for
			return new ResponseEntity<>(list, HttpStatus.OK); //ResponseEntity return
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
	//썸네일은 서버통해 특정 URI호출시 보여주는데 파일경로/UUID가붙은 이름 필요 특정한 URI+파일이름 이미지 파일 데이터 가져와 img 태그 작성하는 과정 통해 처리 
	// 서버 전송 데이터 = '파일의 경로' + 's_'+'uuid가붙은 파일 이름' 주의 해야하는 항목은 경로나 파일 이름에 한글 / 공백 문자가 들어가면 문제 발생 -> js의 encodeURIComponet()함수 이용 uri문제 없는 문자열 생성 처리 
	@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			//문자열로 파일 경로가 포함된 fileName 파라미터로 받고  byte[]를 전송 브라우저에 보내주는 MIME타입이 파일 종류에 따라 달라짐 
			log.info("fileName: " + fileName);
			
			File file = new File("D:\\web_upload\\" + fileName);
			
			log.info("file: " + file);
			
			ResponseEntity<byte[]>result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				//probeContentType 확장자를 이용하여 마임타입(미디어타입)을 판단함 확장자가 없는 파일은 null을반환 MIME타입 데이터를 HTTP헤더 메세지에 포함
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
			} catch(IOException e){
				
				e.printStackTrace();
			}
			return result;
		}
		//OCTET_STREAM - 다른 모든 경우를 위한 기본값 알려지지 않은 파일 타입은 이걸 사용해야됩니다 
		//첨부파일 다운로드 
	@GetMapping(value = "/download" , produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName) {
													//http헤더메세지중에 디바이스 정보 알수있는 User-Agent값을 이용(브라우저 종류/모바일or데스크톱/브라우저프로그램확인)
			log.info("download file : " + fileName);
			
			Resource resource = new FileSystemResource("D:\\web_upload\\" + fileName);
			
			log.info("resource: " + resource);
			
			if (resource.exists() == false) {
				
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			String resourceName = resource.getFilename();
			
			//다운로드 받는 상황시 uuid 삭제후 파일 원본만 다운 받기
			String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
			
			HttpHeaders headers = new HttpHeaders();
			
			try {
				
				String downloadName = null;
				
				if(userAgent.contains("Trident")) {
					
					log.info("on IE browser");
					
					downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8").replaceAll("\\+", " ");
				}else if(userAgent.contains("Edge")) {
					
					log.info("Edge browser");
					
					downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
					
					log.info("Edge name : " + downloadName);
				}else {
					
					log.info("Chrome browser");
					downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
				}
				//Trident = IE 브라우저의 엔진이름 IE11처리  하지만 IE주소창에서 한글이 직접 처리되지 않음으로 URL encoding작업을 해서 변환문자열로 호출해야됨 
				
				log.info("downloadName : " + downloadName);
				//기본값 inline 데이터 하지만 이경우는Content-Disposition에 attachment를 주는 경우로, 이때 filename과 함께 주게 되면 Body에 오는 값을 다운로드 받으라는 뜻이 된다.
				//다운로드시 저장되는 이름 = Content-Disposition이용해서 저장 utf-8/iso-8859-1로 한글 인코딩 깨짐 방지 
				headers.add("Content-Disposition","attachment; filename=" + downloadName);
				//UnsupportedEncodingException 문자의 인코딩이 서포팅 되지않는경우 캣치 
			} catch(UnsupportedEncodingException e) {
				e.printStackTrace();
				
			}
			return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}//downloadFile
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile : " + fileName);
		
		File file;
		
		try {
			file = new File("D:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if(type.equals("image")) {
				
				String largeFileName = file.getAbsolutePath().replace("s_","");
				
				log.info("largeFileName: " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
			
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
