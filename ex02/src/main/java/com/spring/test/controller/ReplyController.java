package com.spring.test.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.test.domain.Criteria;
import com.spring.test.domain.ReplyPageDTO;
import com.spring.test.domain.ReplyVO;
import com.spring.test.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	//PK로기준으로 작성해야 됨 댓글 목록만 게시물과 페이지번호 이용
	//등록 : POST 조회 : GET 삭제 : DELETE 수정 : PUTorPATCH 페이지 : GET
	//* Talend API Tester 확인시 body에 값전달하고나서 url 서버돌린뒤 복붙해서 테스트하는게 좋음 조금이라도 다를시 에러발생
	private ReplyService service;
	
	@PostMapping(value = "/new",			
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE}) //JSON

	public ResponseEntity<String> create(@RequestBody ReplyVO vo){ 
		//JSON -> REPLYVO
		log.info("ReplyVO : " + vo);
		
		//Call register
		int insertCount = service.register(vo);
		
		log.info("Reply INSERT COUNT: " + insertCount);
		
		//3항 연산자로 댓글 추가된 숫자 확인 후 처리`
		return insertCount == 1 
				? new ResponseEntity<>("success" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{bno}/{page}" ,
			
			produces = {
					
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(
			//Criteria 생성해서 직접 처리해야함  PathVariable이용해서 파라미터로 처리 
			//ReplyDTO로 값전달
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		
		Criteria cri = new Criteria(page,10);
		
		log.info("get Reply List bno: " + bno);
		log.info("cri:" + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		
		log.info("get : " + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value ="/{rno}" , produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){

		log.info("remove: " + rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH}, 
			value = "/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(	
			@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("rno : " + rno);
		log.info("modify: " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
