package com.spring.test.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
//댓글 목록 + 전체 댓글 수 정보 담아야됨

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
		
	private int replyCnt;
	private List<ReplyVO> list;
}
