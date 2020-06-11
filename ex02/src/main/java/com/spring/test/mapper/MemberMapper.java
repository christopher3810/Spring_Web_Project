package com.spring.test.mapper;

import com.spring.test.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
}
