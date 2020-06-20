package com.spring.test.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.test.domain.CustomUser;
import com.spring.test.domain.MemberVO;
import com.spring.test.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		log.warn("Load User By UserName : " + userName);
		//membermapper를 이용해서 memebervo를 조회하고 만일 MemberVO의 인스턴스를 얻을 수 있다면 CustomUser타입의 객체로 변환해서 반환합니다.
		MemberVO vo = memberMapper.read(userName);
		
		log.warn("queried by member mapper : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	


}
