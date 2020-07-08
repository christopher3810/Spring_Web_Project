package com.spring.test.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}
	@GetMapping("/boardproduct")
	public void boardproduct(@RequestParam("id") Long id, Model model) {

		log.info("/boardproduct");
		model.addAttribute("board", service.get(id));

	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
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

	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("id") Long id, Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get(id));

	}
	
	//@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board,Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	//@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("id") Long id, Criteria cri, RedirectAttributes rttr) {
		log.info("remove...." + id);
		List<BoardAttachVO> attachList = service.getAttachList(id);
		
		if (service.remove(id)) {
			
			//Attach Files ����
			deleteFiles(attachList);
			log.info("attachList" + attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		
		log.info("getAttachList " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	//BoardController는 restcontroller로 작성되지 않았기 때문에 직접 @responseBody 적용해서 json데이터 변환해야됨 
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files.............................");
		log.info(attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("D:\\web_upload\\"+attach.
						getUploadPath()+"\\" +attach.getUuid()+"_"+ attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("D:\\web_upload\\"+attach.
							getUploadPath()+"\\s_" + attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e){
				
				log.error("delete file error" + e.getMessage());
			}//end try catchx 
			
		});
		
		
	}
	/*
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		//문자열로 파일 경로가 포함된 fileName 파라미터로 받고  byte[]를 전송 브라우저에 보내주는 MIME타입이 파일 종류에 따라 달라짐 
		log.info("fileName: " + fileName);
		
		File file = new File("D:\\web_upload\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]>result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			//probeContentType 확장자를 이용하여 마임타입(미디어타입)을 판단함 확장자가 없는 파일은 null을반환 MIME타입 데이터를 HTTP헤더 메세지에 포함
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
		} catch(IOException e){
			
			e.printStackTrace();
		}
		return result;
	}
	*/
	@RequestMapping(value = "/display", headers = "Accept=image/jpeg, image/jpg, image/png, image/gif", 
			method = RequestMethod.GET)
	public @ResponseBody BufferedImage getImage(String fileName) {
	       try {
	    	   
	    	   String file = "D:\\web_upload\\" + fileName;
	    	   log.info(file);
	           InputStream inputStream = this.getClass().getResourceAsStream(file);
	           return ImageIO.read(inputStream);


	       } catch (IOException e) {
	           throw new RuntimeException(e);
	       }
	}
	

}
