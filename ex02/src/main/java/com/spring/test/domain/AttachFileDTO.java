package com.spring.test.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private String image;
	
	//���ϸ�/���ε���/uuid/�̹�������
}
