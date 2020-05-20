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
	//���������� �����ϴ� multipartfile Ÿ�� ��� ȭ�鿡�� ÷������ �������� ���ý� ��� �迭 Ÿ������ ������ ���� ���ε� 
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "D:\\web_upload"; //��ġ
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("-----------------------------------------");
			log.info("Upload File Name : " +multipartFile.getOriginalFilename());
			log.info("Upload File Size : " +multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename()); //���ε�Ǵ� ������ �̸� �� ���
			
			try {
				multipartFile.transferTo(saveFile);	//transferTo()�� �Ķ���ͷ� java.io.File�� ��ü�� �����ϸ� �Ǳ⿡ ���ε�� ���� ������ �̸����� ��ο� ����			
			}catch (Exception e) {
				log.error(e.getMessage());
			}//try/catch
		}//for
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	//��¥ ��� ���ڿ��� ���� ÷������ ���� ���� ���� 
	private String getFolder() {
		//mm�ҹ��ڸ��� MM�빮�� Ȯ�� �Ұ� 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator); //����� ����
	}
	
	// AJAX ��� ������ ���� �ϸ鼭 ���� Ÿ���� �޶��������� �Ķ���Ϳ����� Ajax ��� �̿��ϱ� ������ Model�� ����� ���� �����Ƿ� ������� ���� /attachFileDTO�Ǹ���Ʈ�� ��ȯ�ϴ� ������ 
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<AttachFileDTO>>uploadAjaxPost(MultipartFile[] uploadFile) {
		
			List<AttachFileDTO> list = new ArrayList<>();
			String uploadFolder = "D:\\web_upload";
		
			String uploadFolderPath = getFolder();
			
		//���� �����
			File uploadPath = new File(uploadFolder , uploadFolderPath);
			log.info("upload path: " + uploadFolderPath);
		
		//���üũ�� ��������
			if(uploadPath.exists() == false) {
			
				uploadPath.mkdirs();//������������ �ѹ��� ��������
			}
		//������ �ش翬��/�ش��/�ش��Ϸ� ����
			for(MultipartFile multipartFile : uploadFile) {
				
				AttachFileDTO attachDTO = new AttachFileDTO();
			
				log.info("----------------------------------");
				log.info("Upload File Nmae : " + multipartFile.getOriginalFilename());
				log.info("Upload File Size : " + multipartFile.getSize());
			
				String uploadFileName = multipartFile.getOriginalFilename();
			
			//���� ���
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				log.info("only file name : " + uploadFileName);
				attachDTO.setFileName(uploadFileName);
				//���ϸ�set
			//��������ĺ��� UUID ���ϸ� �ߺ� ���� / ÷������ �ٿ�ε�� �ٸ����� �����Ͽ� �ٿ�ε� �ϴ°� ����/ �Ϸù�ȣ��� �����ϱ� ���� �ĺ��� ��� �ٸ������� �������� ����
				UUID uuid = UUID.randomUUID();
			
				uploadFileName = uuid.toString() + "_" + uploadFileName; //���� ���� �̸��� ���� �߰��� '_' �ֱ�
			
			
				try {
					File saveFile = new File(uploadPath, uploadFileName); //������ ����
					multipartFile.transferTo(saveFile); //transferTO���ε� �� ���� �����͸� ������ ���Ͽ� �����Ѵ�
					
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);
				//�̺κп��� �̹��� ���� Ȯ���ؾߵ�
					if(checkImageType(saveFile)) {
					//�տ� s�ν����ϴ� ����� ���� ����`
						attachDTO.setImage(true); //�̹��������� TRUE
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
						Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail, 100, 100);
					//reateThumbnail(InputStream is, OutputStream os, int width, int height) thumbnail �� �ƿ�ǲ ��Ʈ�� ��ü �ڿ��ΰ����� ����������
						thumbnail.close();
					}
					
					list.add(attachDTO); //����Ʈ�߰� 
				}catch (Exception e) {
					e.printStackTrace();
					log.error(e.getMessage());
				}//end catch
			}// end for
			return new ResponseEntity<>(list, HttpStatus.OK); //ResponseEntity return
		}
	//���������� ���� ���� �ʱ⶧���� Ȯ���� �߰������� ����ߵ� �������� ���ε�� ������ �̹������� �ƴ��� üũ�� �����ϴ°� ���� ����ϻ��� �̹��� ���� �������� �ƴ��� Ȯ���ϱ� ����
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");	
		}catch (IOException e) {
			
			e.printStackTrace();
		}
		return false;
	}
	//������� �������� Ư�� URIȣ��� �����ִµ� ���ϰ��/UUID������ �̸� �ʿ� Ư���� URI+�����̸� �̹��� ���� ������ ������ img �±� �ۼ��ϴ� ���� ���� ó�� 
	// ���� ���� ������ = '������ ���' + 's_'+'uuid������ ���� �̸�' ���� �ؾ��ϴ� �׸��� ��γ� ���� �̸��� �ѱ� / ���� ���ڰ� ���� ���� �߻� -> js�� encodeURIComponet()�Լ� �̿� uri���� ���� ���ڿ� ���� ó�� 
	@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			//���ڿ��� ���� ��ΰ� ���Ե� fileName �Ķ���ͷ� �ް�  byte[]�� ���� �������� �����ִ� MIMEŸ���� ���� ������ ���� �޶��� 
			log.info("fileName: " + fileName);
			
			File file = new File("D:\\web_upload\\" + fileName);
			
			log.info("file: " + file);
			
			ResponseEntity<byte[]>result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				//probeContentType Ȯ���ڸ� �̿��Ͽ� ����Ÿ��(�̵��Ÿ��)�� �Ǵ��� Ȯ���ڰ� ���� ������ null����ȯ MIMEŸ�� �����͸� HTTP��� �޼����� ����
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
			} catch(IOException e){
				
				e.printStackTrace();
			}
			return result;
		}
		//OCTET_STREAM - �ٸ� ��� ��츦 ���� �⺻�� �˷����� ���� ���� Ÿ���� �̰� ����ؾߵ˴ϴ� 
		//÷������ �ٿ�ε� 
	@GetMapping(value = "/download" , produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName) {
													//http����޼����߿� ����̽� ���� �˼��ִ� User-Agent���� �̿�(������ ����/�����or����ũ��/���������α׷�Ȯ��)
			log.info("download file : " + fileName);
			
			Resource resource = new FileSystemResource("D:\\web_upload\\" + fileName);
			
			log.info("resource: " + resource);
			
			if (resource.exists() == false) {
				
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
			String resourceName = resource.getFilename();
			
			//�ٿ�ε� �޴� ��Ȳ�� uuid ������ ���� ������ �ٿ� �ޱ�
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
				//Trident = IE �������� �����̸� IE11ó��  ������ IE�ּ�â���� �ѱ��� ���� ó������ �������� URL encoding�۾��� �ؼ� ��ȯ���ڿ��� ȣ���ؾߵ� 
				
				log.info("downloadName : " + downloadName);
				//�⺻�� inline ������ ������ �̰���Content-Disposition�� attachment�� �ִ� ����, �̶� filename�� �Բ� �ְ� �Ǹ� Body�� ���� ���� �ٿ�ε� ������� ���� �ȴ�.
				//�ٿ�ε�� ����Ǵ� �̸� = Content-Disposition�̿��ؼ� ���� utf-8/iso-8859-1�� �ѱ� ���ڵ� ���� ���� 
				headers.add("Content-Disposition","attachment; filename=" + downloadName);
				//UnsupportedEncodingException ������ ���ڵ��� ������ �����ʴ°�� Ĺġ 
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
