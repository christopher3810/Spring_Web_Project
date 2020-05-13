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
	
	//ReplyMapper에 의존적 관계  setter사용 or allargsconstructor 사용 가능
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper boardMapper;
	//새로운 댓글이 추가되거나 삭제되는 상황이 되면 BoardMapper와 ReplyMapper를 이용해서 트랜잭션을 사용해서 댓글 갯수 확인해주는걸 넘겨줘야됨
	//@Setter를 이용해서 주입
	
	//등록과 삭제는 상품 페이징도 바뀌어야함으로 메서드 트랜잭션필요
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("register......" + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1); //등록시 해당 상품 댓글수 1증가
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
		
		ReplyVO vo = mapper.read(rno);//댓글 자체 번호인rno를 받기에 해당 댓글의 개시물을 알아내는 경우가 필요함 파라미터로 bno까지 받을수도 있지만 그럴경우 컨트롤러까지 수정해야됨
		
		boardMapper.updateReplyCnt(vo.getBno(), -1); //삭제시 댓글수 줄여주고
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
	}//카운팅값과 해당 상품 번호의 페이징값
	
	

}
