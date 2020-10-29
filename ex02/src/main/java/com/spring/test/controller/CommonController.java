package com.spring.test.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.spring.test.domain.AttachFileDTO;
import com.spring.test.domain.AuthVO;
import com.spring.test.domain.MemberVO;
import com.spring.test.service.MemberService;
import com.spring.test.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@Autowired
	MemberService memberservice;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	/*
	 * @GetMapping("/customLogin") public void loginInput(String error, String
	 * logout, Model model) {
	 * 
	 * log.info("error: " + error); log.info("logout: " + logout);
	 * 
	 * if(error != null) {
	 * 
	 * model.addAttribute("error", "LogIn Error Check Your Account"); }
	 * 
	 * if(logout != null) {
	 * 
	 * model.addAttribute("logout", "Logout!!"); } }
	 */
	@RequestMapping(value = "/customLogin", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session, String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {

			model.addAttribute("error", "LogIn Error Check Your Account");
		}

		if (logout != null) {

			model.addAttribute("logout", "Logout!!");
		}

		ModelAndView mav = new ModelAndView();/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		// String naverAuthUrl = naverLoginDTO.getAuthorizationUrl(session);
		String kakaoUrl = kakaocontroller.getAuthorizationUrl(session); /* 생성한 인증 URL을 View로 전달 */
		mav.setViewName("customLogin"); // 네이버 로그인 mav.addObject("naver_url", naverAuthUrl);
		// 카카오 로그인
		mav.addObject("kakao_url", kakaoUrl);
		return mav;

	}

	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}

	@PostMapping("/customLogout")
	public void logoutPost() {

		log.info("Post custom logout");
	}

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 담아줌
		JsonNode node = kakaocontroller.getAccessToken(code);
		log.info("(kakaoLogin)_AccessToken : " + code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = kakaocontroller.getKakaoUserInfo(accessToken);
		String kemail = null;
		String kname = null;

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		log.info("(kakaoLogin)_userInfo.path_properties(전체값)) : " + properties);
		JsonNode kakao_account = userInfo.path("kakao_account");
		log.info("(kakaoLogin)_userInfo.path_kakao_account : " + kakao_account);
		kemail = kakao_account.path("email").asText();
		log.info("(kakaoLogin)_userInfo.path_kakao_accout : " + kemail);
		kname = properties.path("nickname").asText();
		log.info("(kakaoLogin)_userInfo.path_kakao_nickname : " + kname);
		
		Authentication authentication = new UsernamePasswordAuthenticationToken(kemail, kname);
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);

		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		session.setAttribute("kemail", kemail);
		session.setAttribute("kname", kname);

		mav.setViewName("checkpoint");
		return mav;
	}// end kakaoLogin()
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String userRegPass(MemberVO membervo) {
		// 회원가입 메서드
		log.info("도착하자마자 membervo : " + membervo);
		Date date = new Date();
		AuthVO tempvo = new AuthVO();
		List<AuthVO> templist = new  ArrayList<>();
		String encryptPassword = passwordEncoder.encode(membervo.getUserpw());
		membervo.setUserpw(encryptPassword);
		tempvo.setUserid(membervo.getUserid());
		tempvo.setAuth("ROLE_USER");
		templist.add(0, tempvo);
		membervo.setRegDate(date);
		membervo.setUpdateDate(date);
		membervo.setEnabled(true);
		membervo.setAuthList(templist);
		log.info("signup parameter check : " + membervo);
		memberservice.insertUser(membervo);
		
		memberservice.insertAuth(tempvo);
		
		// 인증 메일 보내기 메서드
		//mailsender.mailSendWithUserKey(userVO.getUser_email(), userVO.getUser_id());

		return "redirect:/board/list";
	}

}
