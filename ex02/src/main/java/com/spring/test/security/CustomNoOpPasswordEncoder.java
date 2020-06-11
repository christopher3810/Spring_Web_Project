package com.spring.test.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;
//encode 와 matches 매써드 처리 그리고 security.xml에 CustomNoOpPasswordEncoder클래스를 빈으로 등록합니다 
@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder{@Override
	public String encode(CharSequence rawPassword) {
		log.warn("before encode : " + rawPassword);
		
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		log.warn("matches: " + rawPassword + ":" + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
	
}
