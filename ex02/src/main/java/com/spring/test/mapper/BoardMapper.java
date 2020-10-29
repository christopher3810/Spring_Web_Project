package com.spring.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.test.domain.BoardAttachVO;
import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;

public interface BoardMapper {

	

	//	@Select("select * from board where id > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getRecentList(Criteria cri);
	
	public List<BoardVO> getListWithcontent(Criteria cri);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalwithcontent(Criteria cri);
	
	public void insert(BoardVO board,BoardAttachVO vo);
	
	public void insertSelectKey(BoardVO board);
	
	public void insertAttachments(BoardVO board);
	
	public BoardVO read(Long id);
	
	public int delete(Long id);
	
	public int update(BoardVO board);	
	
	public int getTotalCount (Criteria cri);
	
	public void updateReplyCnt(@Param("id") Long id, @Param("amount") int amount);
}
