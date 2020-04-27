package com.spring.test.mapper;

import java.util.List;

import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;

public interface BoardMapper {

	

	//	@Select("select * from board where id > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long id);
	
	public int delete(Long id);
	
	public int update(BoardVO board);	
	
	public int getTotalCount (Criteria cri);
}
