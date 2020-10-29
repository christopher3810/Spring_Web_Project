package com.spring.test.service;

import java.util.List;

import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;
import com.spring.test.domain.EventVO;

public interface EventService {
	
	public List<EventVO> getEvent(Criteria cri);
	
	public int getTotal(Criteria cri);
	
}
