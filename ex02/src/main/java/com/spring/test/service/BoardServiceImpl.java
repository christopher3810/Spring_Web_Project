package com.spring.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.domain.BoardAttachVO;
import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;
import com.spring.test.mapper.BoardAttachMapper;
import com.spring.test.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register......" + board);
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach ->{
			
			attach.setBno(board.getId());
			attachMapper.insert(attach);
		});
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
	@Transactional
	@Override
	public boolean remove(Long id) {
		
		log.info("remove....." + id);
		
		attachMapper.deleteAll(id);
		
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

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get Attach list by id" + bno);
		return attachMapper.findByBno(bno);
	}
	

}
