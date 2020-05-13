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
				//특정 게시물의 댓글들만 대상으로 하기 때문에 두개이상 데이터 보내줘야 하는데 방식 3가지  1.별도객체구성 2.해쉬맵사용3.@Param이용해서 보내버리기
		
		public int getCountByBno(Long bno);
 }


