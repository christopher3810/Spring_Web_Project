package com.spring.test.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.test.domain.RestSampleVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class RestSampleController {

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8") // produces속성은 해당 메서드가 생산하는 MIME타입을 의미
	public String getText() {

		log.info("MIME TYPE : " + MediaType.TEXT_PLAIN_VALUE);

		return "안녕하세요";
	}

	@GetMapping(value = "/getSample", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })

	public RestSampleVO getSample() {

		return new RestSampleVO(112, "스타", "로드");
	}

	@GetMapping(value = "/getMap")
	public Map<String, RestSampleVO> getMap() {

		Map<String, RestSampleVO> map = new HashMap<>();
		map.put("First", new RestSampleVO(111, "그루트", "주니어"));

		return map;
	}// 해쉬맵에 경우 '키'와 '값'을 가지는 하나의 객체로 간주되어 이동 map을 이용할시 key에속하는 데이터는 xml로 변환되는 경우 태그의
		// 이름이 되기에 문자열을 지정

	@GetMapping(value = "/check", params = { "height", "weight" })
	public ResponseEntity<RestSampleVO> check(Double height, Double weight) {

		RestSampleVO vo = new RestSampleVO(0, "" + height, "" + weight);

		ResponseEntity<RestSampleVO> result = null;

		if (height < 150) { //height 와 weight를 받으면서 조건문을 통해서 데이터 전송
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo); //상태코드와 데이터 전송
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}

		return result;
	}

}
//기존 @Controller는 문자열 반환시 jsp파일 이름으로 처리하지만 @RestController의 경우에는 순수한 데이터가 됩니다
//크롬 검사 네트워크 ctrl + r을통해서 해당 데이터 포멧을 확인할수 있습니다 
//Rest방식으로 호출시 화면자체가 아니라 데이터 자체를 전송하는 방식으로 처리되기 때문에 데이터 요청한 쪽에서 정상적 데이터인지 비정상 데이터인지 구분할수 있는 방법 제공 해야됨