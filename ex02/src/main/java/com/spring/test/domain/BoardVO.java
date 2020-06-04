package com.spring.test.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long id;
	private String title;
	private String content;
	private String attachments;
	private int price;
	private int likes;
	private int views;
	private Date create_time;
	private Date update_time;
	private int size220;
	private int size230;
	private int size240;
	private int size250;
	private int size260;
	private int size270;
	private int size280;
	private int size290;
	private int replyCnt;
	
	private List<BoardAttachVO> attachList; //등록시 한번에 BoardAttachVO처리 할수 있도록 List로 추가 
	//첨부파일 정보 수집  filename/uuid/uploadPath/fileType
}
