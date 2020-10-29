package com.spring.test.mapper;

import java.util.List;

import com.spring.test.domain.Criteria;
import com.spring.test.domain.EventVO;

public interface EventMapper {
	
	public List<EventVO> getEventWithPaging(Criteria cri);
	
	public int getTotalCount (Criteria cri);
	
}
