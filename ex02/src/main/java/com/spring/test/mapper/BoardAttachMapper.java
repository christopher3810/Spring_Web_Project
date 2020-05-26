package com.spring.test.mapper;
//÷������ ������ DB�̿��ؼ� ���������� �ش� ó�� SQL�� MAPPER �������̽�/ XML�� ���ؼ� ó��

import java.util.List;

import com.spring.test.domain.BoardAttachVO;
//÷�������� modify�� ���⶧���� insert/delete�۾��� ��ħ 
public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	//��������
	public List<BoardAttachVO> findByBno(Long id);
	
	public void deleteAll(Long id);
	
}
