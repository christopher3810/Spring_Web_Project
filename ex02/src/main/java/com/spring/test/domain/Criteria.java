package com.spring.test.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum; //보여줄 페이지 번호
	private int amount; //페이지당 보여줄 게시글의 개수 
	
	private String type;
	private String keyword;
	
	/*용도가 pagenum과 amount값을 전달하는 용도이지만 생성자를 통해서 기본값을 1/10개로 지정해서 처리합니다*/
	/*최초 게시판 진입할 때를 위해서 기본 값 설정 */
	

	public Criteria() {
		
		this(1,12);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getPageStart() {
        return (this.pageNum-1)*amount;
    }// 현재 페이지의 게시글 시작 번호 = 현재 페이지 번호 -1 * 페이지당 보여주는 갯수
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}
	
	//게시물의 삭제후 페이지 번호나 검색 조건 유지하면서 이동하기 위해 redirect에 필요한 파라미터 매번 추가해야되는 불편
	//criteria에서 처리
	//UriComponentsBuilder는 브라우저에서 GET방식등의 파라미터 전송에 사용되는 문자열QUERYstring을 손쉽게 처리할 수 있는 클래스 
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("PageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
				
		return builder.toUriString();
		
	}
	
/*	
	 public int getPageStart() {
	        return (this.pageNum-1)*amount;
	    }
	    
	    public Criteria() {
	        this.pageNum = 1;
	        this.amount = 12;
	    }
	    
	    public int getPageNum() {
	        return pageNum;
	    }
	    public void setPageNum(int pageNum) {
	        if(pageNum <= 0) {
	            this.pageNum = 1;
	        } else {
	            this.pageNum = pageNum;
	        }
	    }
	    public int getAmount() {
	        return amount;
	    }
	    public void setPerAmount(int pageCount) {
	        int cnt = this.amount;
	        if(pageCount != cnt) {
	            this.amount = cnt;
	        } else {
	            this.amount = pageCount;
	        }
	    }
*/
}
