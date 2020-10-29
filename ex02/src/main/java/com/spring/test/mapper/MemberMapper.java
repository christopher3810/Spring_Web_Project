package com.spring.test.mapper;

import com.spring.test.domain.AuthVO;
import com.spring.test.domain.BoardAttachVO;
import com.spring.test.domain.BoardVO;
import com.spring.test.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
	
	public void insertUser(MemberVO membervo);

	public MemberVO readid(String userName);

	public AuthVO readAuth(String userName);
}
