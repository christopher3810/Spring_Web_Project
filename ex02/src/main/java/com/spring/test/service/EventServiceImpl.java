package com.spring.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.domain.Criteria;
import com.spring.test.domain.EventVO;
import com.spring.test.mapper.BoardAttachMapper;
import com.spring.test.mapper.BoardMapper;
import com.spring.test.mapper.EventMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventServiceImpl implements EventService{
	
	@Setter(onMethod_= @Autowired)
	private EventMapper mapper;
	
	@Override	
	public List<EventVO> getEvent(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get list with criteria : " + cri);
		return mapper.getEventWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get event total count ");
		
		return mapper.getTotalCount(cri);
	}

}
