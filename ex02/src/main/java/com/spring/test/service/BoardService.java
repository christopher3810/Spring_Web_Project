package com.spring.test.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import com.spring.test.domain.BoardAttachVO;
import com.spring.test.domain.BoardVO;
import com.spring.test.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(Long id);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long id);
	
	public List<BoardVO> getList(Criteria cri);
	//public List<BoardVO> getList();
	/*new*/
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public String encodeURIComponent(String component);
}
