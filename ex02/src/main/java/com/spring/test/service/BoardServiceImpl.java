package com.spring.test.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;
import com.spring.test.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
	}
 
	/*조회 작업 구현과 테스트 조회 는 게시물의 번호가 파라미터 BoardVO의 인스턴스가 리턴이 됨*/
	@Override 
	public BoardVO get(Long id) {
		
		log.info("get........" + id);
		
		return mapper.read(id);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify......" + board);
		return mapper.update(board) == 1; /*정상적으로 수정 삭제가 이루어지면 1이라는 값이 반환 == 이용하여 true false 처리가능*/
	}

	/*삭제 나 수정은 메서드의 리턴타입을 void로 설계할 수도 있지만 엄격하게 처리하기 위해 Boolean타입으로 처리*/
	@Override
	public boolean remove(Long id) {
		
		log.info("remove....." + id);
		
		return mapper.delete(id) == 1;
	}

	@Override /*현재 테이블에 저장된 모든 데이터 가져오는*/
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get list with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}
	

}
