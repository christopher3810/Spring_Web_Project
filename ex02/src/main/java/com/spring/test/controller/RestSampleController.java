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

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8") // produces�Ӽ��� �ش� �޼��尡 �����ϴ� MIMEŸ���� �ǹ�
	public String getText() {

		log.info("MIME TYPE : " + MediaType.TEXT_PLAIN_VALUE);

		return "�ȳ��ϼ���";
	}

	@GetMapping(value = "/getSample", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })

	public RestSampleVO getSample() {

		return new RestSampleVO(112, "��Ÿ", "�ε�");
	}

	@GetMapping(value = "/getMap")
	public Map<String, RestSampleVO> getMap() {

		Map<String, RestSampleVO> map = new HashMap<>();
		map.put("First", new RestSampleVO(111, "�׷�Ʈ", "�ִϾ�"));

		return map;
	}// �ؽ��ʿ� ��� 'Ű'�� '��'�� ������ �ϳ��� ��ü�� ���ֵǾ� �̵� map�� �̿��ҽ� key�����ϴ� �����ʹ� xml�� ��ȯ�Ǵ� ��� �±���
		// �̸��� �Ǳ⿡ ���ڿ��� ����

	@GetMapping(value = "/check", params = { "height", "weight" })
	public ResponseEntity<RestSampleVO> check(Double height, Double weight) {

		RestSampleVO vo = new RestSampleVO(0, "" + height, "" + weight);

		ResponseEntity<RestSampleVO> result = null;

		if (height < 150) { //height �� weight�� �����鼭 ���ǹ��� ���ؼ� ������ ����
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo); //�����ڵ�� ������ ����
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}

		return result;
	}

}
//���� @Controller�� ���ڿ� ��ȯ�� jsp���� �̸����� ó�������� @RestController�� ��쿡�� ������ �����Ͱ� �˴ϴ�
//ũ�� �˻� ��Ʈ��ũ ctrl + r�����ؼ� �ش� ������ ������ Ȯ���Ҽ� �ֽ��ϴ� 
//Rest������� ȣ��� ȭ����ü�� �ƴ϶� ������ ��ü�� �����ϴ� ������� ó���Ǳ� ������ ������ ��û�� �ʿ��� ������ ���������� ������ ���������� �����Ҽ� �ִ� ��� ���� �ؾߵ�