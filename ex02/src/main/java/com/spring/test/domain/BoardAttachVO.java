package com.spring.test.domain;
//AttachDTO와 유사 /Bno추가 되었고 혼란 피하기위해 그냥 새로 파기 
import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; //이미지 파일 여부를 판단 
	
	private int bno;
	
}
