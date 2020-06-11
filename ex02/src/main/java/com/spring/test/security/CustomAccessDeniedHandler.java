package com.spring.test.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

//접근 제한 경우 다양한 처리를 위한 인터페이스 구현 
//ex) 접근 제한시 세션이나 쿠키에 특정한 작업을 하기위해 httpservletResponse에 특정 헤더 정보 추가하는 등 행위 
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	//accessdeniehandler인터페이스 직접구현 
	@Override			//서블릿 리퀘스트와 리스폰스를 파라미터로 사용하기 때문에 직접적으로 서블릿 api를 이용처리 가능 
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.error("Access Denied Handler");
		
		log.error("Redirect.....");
		
		response.sendRedirect("/accessError");
		//접근 제한 걸리는 경우 리다이렉트 하는 방식으로 동작 
	}

}
