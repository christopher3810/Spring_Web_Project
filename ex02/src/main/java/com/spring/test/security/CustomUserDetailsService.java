package com.spring.test.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.test.domain.AuthVO;
import com.spring.test.domain.CustomUser;
import com.spring.test.domain.MemberVO;
import com.spring.test.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		log.warn("Load User By UserName : " + userName);
		//membermapper를 이용해서 memebervo를 조회하고 만일 MemberVO의 인스턴스를 얻을 수 있다면 CustomUser타입의 객체로 변환해서 반환합니다.
		
		
		MemberVO vo = memberMapper.readid(userName);
		
		AuthVO authvo = memberMapper.readAuth(userName);
		List<AuthVO> templist = new  ArrayList<>();
		templist.add(0, authvo);
		vo.setAuthList(templist);
		log.warn("queried by member mapper : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	


}
