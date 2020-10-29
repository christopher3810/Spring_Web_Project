package com.spring.test.service;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.test.domain.AuthVO;
import com.spring.test.domain.MemberVO;

public interface MemberService {
	
	public void insertUser(MemberVO membervo);
	
	public void insertAuth(AuthVO authvo);
}
