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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator); //����� ����
	}
	
	// AJAX ��� ������ ���� �ϸ鼭 ���� Ÿ���� �޶��������� �Ķ���Ϳ����� Ajax ��� �̿��ϱ� ������ Model�� ����� ���� �����Ƿ� ������� ����
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		
		String uploadFolder = "D:\\web_upload";
		
		//���� �����
		File uploadPath = new File(uploadFolder , getFolder());
		log.info("upload path: " + uploadPath);
		
		//���üũ�� ��������
		if(uploadPath.exists() == false) {
			
			uploadPath.mkdirs();//������������ �ѹ��� ��������
		}
		//������ �ش翬��/�ش��/�ش��Ϸ� ����
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("----------------------------------");
			log.info("Upload File Nmae : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//���� ���
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			
			//��������ĺ��� UUID ���ϸ� �ߺ� ���� / ÷������ �ٿ�ε�� �ٸ����� �����Ͽ� �ٿ�ε� �ϴ°� ����/ �Ϸù�ȣ��� �����ϱ� ���� �ĺ��� ��� �ٸ������� �������� ����
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName; //���� ���� �̸��� ���� �߰��� '_' �ֱ�
			
			
			try {
				File saveFile = new File(uploadPath, uploadFileName); //������ ����
				multipartFile.transferTo(saveFile);
				//�̺κп��� �̹��� ���� Ȯ���ؾߵ�
				if(checkImageType(saveFile)) {
					//�տ� s�ν����ϴ� ����� ���� ����`
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail, 100, 100);
					//reateThumbnail(InputStream is, OutputStream os, int width, int height) thumbnail �� �ƿ�ǲ ��Ʈ�� ��ü �ڿ��ΰ����� ����������
					thumbnail.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
				log.error(e.getMessage());
			}//end catch
		}// end for
		
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
	
	

}
