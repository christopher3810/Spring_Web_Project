package com.spring.test.domain;
//AttachDTO�� ���� /Bno�߰� �Ǿ��� ȥ�� ���ϱ����� �׳� ���� �ı� 
import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; //�̹��� ���� ���θ� �Ǵ� 
	
	private int bno;
	
}
