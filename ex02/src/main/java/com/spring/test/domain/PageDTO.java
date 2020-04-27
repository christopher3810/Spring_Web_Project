package com.spring.test.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
		private int startPage;
		private int endPage;
		private boolean prev, next;
		private int total; //전체 데이터수
		private int displayPageNum = 10;
		private Criteria cri;
		
/*
	    public Criteria getCri() {
	        return cri;
	    }
	    public void setCri(Criteria cri) {
	        this.cri = cri;
	    }
	    public int getTotal() {
	        return total;
	    }
	    public void setTotal(int total) {
	        this.total = total;
	        calcData();
	    }
	    
	    private void calcData() {
	        
	        endPage = (int) (Math.ceil(cri.getPageNum() / (double) displayPageNum) * displayPageNum);
	 
	        startPage = (endPage - displayPageNum) + 1;
	        if(startPage <= 0) startPage = 1;
	        
	        int tempEndPage = (int) (Math.ceil(total / (double) cri.getAmount()));
	        if (endPage > tempEndPage) {
	            endPage = tempEndPage;
	        }
	 
	        prev = startPage == 1 ? false : true;
	        next = endPage * cri.getAmount() < total ? true : false;
	        
	    }
	    
	    public int getStartPage() {
	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }
*/

		public PageDTO(Criteria cri, int total) {
			
			this.cri = cri;
			this.total = total;
			
			//끝 페이지 번호 = 끝페이지 번호 -> 현제페이지 번호를 10단위로 나눠서 10 20 30 40 으로 표기  예를들어 5면 0.5인데 올려서 1 1~10이면 10
			//13/14인경우 1.3 / 1.4이니까 무조건 20 이됨
			this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10; //Math.ceil소수점 이하 올림 걍올림 반올림 x
			this.startPage = this.endPage - 9; //10개씩 보여주니까 -9
			
			
			//총갯수 / 한페이지에 보여줄 양
			int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
			
			if(realEnd < this.endPage) {
				//끝에 도달할떄 endPage를 바꿔줌
				this.endPage = realEnd;
			}
			
			//이전버튼은 1이아니면 생김
			this.prev = this.startPage > 1;//prev = startPage == 1 ? false : true;
			//다음버튼은 진짜 끝지점보다 적은경우 생김
			this.next = this.endPage < realEnd ; //next = endPage < realEnd ? false : true;;
		}

}
