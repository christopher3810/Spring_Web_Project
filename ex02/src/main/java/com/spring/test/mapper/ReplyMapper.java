package com.spring.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.test.domain.Criteria;
import com.spring.test.domain.ReplyVO;

public interface ReplyMapper {
	
		public int insert(ReplyVO vo);
		
		public ReplyVO read(Long bno);
		
		public int delete (Long targetRno);
		
		public int update (ReplyVO reply);
		
		public List<ReplyVO> getListWithPaging(
				@Param("cri") Criteria cri,
				@Param("bno") Long bno);
				//Ư�� �Խù��� ��۵鸸 ������� �ϱ� ������ �ΰ��̻� ������ ������� �ϴµ� ��� 3����  1.������ü���� 2.�ؽ��ʻ��3.@Param�̿��ؼ� ����������
		
		public int getCountByBno(Long bno);
 }


