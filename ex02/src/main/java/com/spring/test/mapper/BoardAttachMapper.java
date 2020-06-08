package com.spring.test.mapper;
//첨부파일 정보를 DB이용해서 보관함으로 해당 처리 SQL을 MAPPER 인터페이스/ XML을 통해서 처리

import java.util.List;

import com.spring.test.domain.BoardAttachVO;
//첨부파일은 modify가 없기때문에 insert/delete작업만 거침 
public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	//원본파일
	public List<BoardAttachVO> findByBno(Long id);
	
	public void deleteAll(Long id);
	
	public List<BoardAttachVO> getOldFiles();
	
}
