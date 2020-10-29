package com.spring.test.service;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.domain.AttachFileDTO;
import com.spring.test.domain.AuthVO;
import com.spring.test.domain.MemberVO;
import com.spring.test.mapper.BoardAttachMapper;
import com.spring.test.mapper.BoardMapper;
import com.spring.test.mapper.MemberAuthMapper;
import com.spring.test.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	

	@Setter(onMethod_= @Autowired)
	private MemberMapper Membermapper;
	
	@Setter(onMethod_= @Autowired)
	private MemberAuthMapper Authmapper;

	@Override
	public void insertUser(MemberVO membervo) {
		// mapper 두개 이용해서 auth 랑 id = email 저장 하기
		
		log.info("service_membersignup_parametercheck : " + membervo);
		//권한 db저장
		Membermapper.insertUser(membervo);
		//회원정보 db저장
		
		//MemberVO에있는 email 값과 password를 Membermapper 와 authmapper로 추가한다
		//해당 email이 있는지 확인하려 email을 보내는 방법도 있음 
		
	}

	@Override
	public void insertAuth(AuthVO authvo) {
		
		log.info("service_insertAuth_parametercheck : " + authvo);
		
		Authmapper.insertAuth(authvo);
		// TODO Auto-generated method stub
		
	}
}
