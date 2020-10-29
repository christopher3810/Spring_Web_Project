package com.spring.test.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class EventVO {
	
	private Long bno;
	private String name;
	private String uuid;
	private String uploadpath;
	private Date startdate;
	private Date enddate;
	private String filetype;
	
}
