package com.spring.test.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor // ��� �Ӽ��� ����ϴ� �����ڸ� ����
@NoArgsConstructor //����ִ� ������
public class RestSampleVO {
	
	private Integer mno;
	private String firstName;
	private String lastName;

}
