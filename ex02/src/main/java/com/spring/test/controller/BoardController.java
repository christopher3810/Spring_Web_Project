package com.spring.test.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.test.domain.BoardAttachVO;
import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;
import com.spring.test.domain.PageDTO;
import com.spring.test.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*BoardController 는 BoardService에 대해 의존적 @AllArgsConstructor를 이용해서 생성자 만들고 자동으로 주입하게 만듬*/
/*AllArgsConstructor 모든 필드의 생성자를 생성해줌*/
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	/*
	 * list는 게시물 목록을 전달해야 함으로 Model을 파라미터로 지정 이를 통해 BoardServiceImpl 객체의
	 * getList()결과를 담아 전달 addAttribute
	 */
	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * 
	 * log.info("list"); model.addAttribute("list" , service.getList()); }
	 */

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list" + cri); 
		model.addAttribute("list" , service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total: " + total );
		 model.addAttribute("pageMaker" , new PageDTO(cri, total));
		 
/*		
		ModelAndView mav = new ModelAndView("/board/list");

		PageDTO PageDTO = new PageDTO();
		PageDTO.setCri(cri);
		PageDTO.setTotal(100);
			
		mav.addObject("list", service.getList(cri));
		mav.addObject("pageMaker", PageDTO);

		return mav;
*/
	}

	@GetMapping("/register")
	public void register() {

	}
	@GetMapping("/boardproduct")
	public void boardproduct(@RequestParam("id") Long id, Model model) {

		log.info("/boardproduct");
		model.addAttribute("board", service.get(id));

	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
			
		log.info("==========================");
		log.info("register : " + board);
		
		if(board.getAttachList() != null) {
			
			board.getAttachList().forEach(attach -> log.info(attach));
			
		}
		log.info("================================");
		
		service.register(board);

		rttr.addFlashAttribute("result", board.getId());

		return "redirect:/board/list";
	}

	/* test front page */
	@GetMapping("/boardproducttest")
	public void boardproducttest() {

	}

	@GetMapping("/get")
	public void get(@RequestParam("id") Long id, Model model) {

		log.info("/get");
		model.addAttribute("board", service.get(id));

	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") Long id, RedirectAttributes rttr) {
		log.info("remove...." + id);
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		
		log.info("getAttachList " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	//BoardController는 restcontroller로 작성되지 않았기 때문에 직접 @responseBody 적용해서 json데이터 변환해야됨 

}
