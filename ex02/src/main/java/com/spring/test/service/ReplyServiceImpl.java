package com.spring.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.domain.Criteria;
import com.spring.test.domain.ReplyPageDTO;
import com.spring.test.domain.ReplyVO;
import com.spring.test.mapper.BoardMapper;
import com.spring.test.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	//ReplyMapper�� ������ ����  setter��� or allargsconstructor ��� ����
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper boardMapper;
	//���ο� ����� �߰��ǰų� �����Ǵ� ��Ȳ�� �Ǹ� BoardMapper�� ReplyMapper�� �̿��ؼ� Ʈ������� ����ؼ� ��� ���� Ȯ�����ִ°� �Ѱ���ߵ�
	//@Setter�� �̿��ؼ� ����
	
	//��ϰ� ������ ��ǰ ����¡�� �ٲ��������� �޼��� Ʈ������ʿ�
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("register......" + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1); //��Ͻ� �ش� ��ǰ ��ۼ� 1����
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("get......" + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify......" + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("remove......"+rno);
		
		ReplyVO vo = mapper.read(rno);//��� ��ü ��ȣ��rno�� �ޱ⿡ �ش� ����� ���ù��� �˾Ƴ��� ��찡 �ʿ��� �Ķ���ͷ� bno���� �������� ������ �׷���� ��Ʈ�ѷ����� �����ؾߵ�
		
		boardMapper.updateReplyCnt(vo.getBno(), -1); //������ ��ۼ� �ٿ��ְ�
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}//ī���ð��� �ش� ��ǰ ��ȣ�� ����¡��
	
	

}
