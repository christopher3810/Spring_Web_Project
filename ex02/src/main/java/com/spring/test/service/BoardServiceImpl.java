package com.spring.test.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
	
	//uricomponent자바에서 사용가능하게하는 객췌
	@Override
	public String encodeURIComponent(String component) {
		String result = null;      
		
		try {       
			result = URLEncoder.encode(component, "UTF-8")   
				   .replaceAll("\\%28", "(")                          
				   .replaceAll("\\%29", ")")   		
				   .replaceAll("\\+", "%20")                          
				   .replaceAll("\\%27", "'")			   
				   .replaceAll("\\%21", "!")
				   .replaceAll("\\%7E", "~");
		}
		catch (UnsupportedEncodingException e) {       
			result = component;     
		}      
		
		return result;   
	 
	}
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register......" + board);
		
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach ->{
			//메인 이미지 파일 경로 
			if(attach.isMaincheck())
			{
				String temp = attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName();
				temp = encodeURIComponent(temp);
				board.setAttachments(temp);
			}
		});
		mapper.insertSelectKey(board);
		board.getAttachList().forEach(attach ->{
			//(CONCAT(#{uploadpath},'/s_' ,#{uuid},'_',#{fileName});
			attach.setBno(board.getId());
			attachMapper.insert(attach);
			
		});
	}
 
	/*조회 작업 구현과 테스트 조회 는 게시물의 번호가 파라미터 BoardVO의 인스턴스가 리턴이 됨*/
	@Override 
	public BoardVO get(Long id) {
		
		log.info("get........" + id);
		
		return mapper.read(id);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify......" + board);
		//전부삭제 기존
		attachMapper.deleteAll(board.getId());
		//mapper.update(board) == 1; /*정상적으로 수정 삭제가 이루어지면 1이라는 값이 반환 == 이용하여 true false 처리가능*/
		
		boolean modifyResult = mapper.update(board) == 1;

		//기존에 첨부파일 관련 데이터를 전부 삭제한 후에 다시 첨부파일 데이터를 추가하는 방식으로 동작합니다 
		if(modifyResult && board.getAttachList() != null & board.getAttachList().size() > 0) {		
			board.getAttachList().forEach(attach ->{
				if(attach.isMaincheck())
				{
					String temp = attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName();
					temp = encodeURIComponent(temp);
					board.setAttachments(temp);
				}
				//메인 이미지 파일 경로 
			});
			board.getAttachList().forEach(attach ->{
				//새로 첨부된 변경된 파일들 id값 주고 insert 진행 
				attach.setBno(board.getId());
				attachMapper.insert(attach);
				
			});
			
		}
	    modifyResult = mapper.update(board) == 1;
		return modifyResult;
	}

	/*삭제 나 수정은 메서드의 리턴타입을 void로 설계할 수도 있지만 엄격하게 처리하기 위해 Boolean타입으로 처리*/
	@Transactional
	@Override
	public boolean remove(Long id) {
		
		log.info("remove....." + id);
		
		attachMapper.deleteAll(id);
		
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

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get Attach list by id " + bno);
		return attachMapper.findByBno(bno);
	}

}
