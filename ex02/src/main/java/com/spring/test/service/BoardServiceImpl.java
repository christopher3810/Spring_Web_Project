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
 
	/*��ȸ �۾� ������ �׽�Ʈ ��ȸ �� �Խù��� ��ȣ�� �Ķ���� BoardVO�� �ν��Ͻ��� ������ ��*/
	@Override 
	public BoardVO get(Long id) {
		
		log.info("get........" + id);
		
		return mapper.read(id);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify......" + board);
		return mapper.update(board) == 1; /*���������� ���� ������ �̷������ 1�̶�� ���� ��ȯ == �̿��Ͽ� true false ó������*/
	}

	/*���� �� ������ �޼����� ����Ÿ���� void�� ������ ���� ������ �����ϰ� ó���ϱ� ���� BooleanŸ������ ó��*/
	@Override
	public boolean remove(Long id) {
		
		log.info("remove....." + id);
		
		return mapper.delete(id) == 1;
	}

	@Override /*���� ���̺� ����� ��� ������ ��������*/
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
