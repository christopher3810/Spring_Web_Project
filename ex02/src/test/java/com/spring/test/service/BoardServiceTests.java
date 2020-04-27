package com.spring.test.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class BoardServiceTests {
	
	
		@Setter(onMethod_ = {@Autowired })
		private BoardService service;
		
		@Test
		public void testExist() {
			
			log.info(service);
			assertNotNull(service);
		}
		
		@Test
		public void testRegister() {
			
			BoardVO board = new BoardVO();
			board.setTitle("새로 작성하는 글11");
			board.setContent("새로 작성하는 내용11");
			board.setAttachments("운동화111");
			
			service.register(board);
			
			log.info("생성된 게시물의 번호 : " + board.getId());
		}
		
		@Test
		public void testGetList() {
			
			//service.getList().forEach(board -> log.info(board));
			service.getList(new Criteria()).forEach(board -> log.info(board));
		}
		
		@Test
		public void testGet() {
			
			log.info(service.get(1L));
		}
		
		@Test
		public void testDelete() {
			
			log.info("REMOVE RESULT : " + service.remove(2L));
		}
		
		@Test
		public void testUpdate() {
			
			BoardVO board = service.get(1L);
			
			if (board == null) {
				return;
			}
			
			board.setTitle("제목을 수정한 값.");
			log.info("MODIFY RESULT :  " + service.modify(board));
		}
}

