package com.spring.test.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	
	//파일명/업로드경로/uuid/이미지여부
}
