package com.spring.test.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
		private int startPage;
		private int endPage;
		private boolean prev, next;
		private int total; //��ü �����ͼ�
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
			
			//�� ������ ��ȣ = �������� ��ȣ -> ���������� ��ȣ�� 10������ ������ 10 20 30 40 ���� ǥ��  ������� 5�� 0.5�ε� �÷��� 1 1~10�̸� 10
			//13/14�ΰ�� 1.3 / 1.4�̴ϱ� ������ 20 �̵�
			this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10; //Math.ceil�Ҽ��� ���� �ø� ���ø� �ݿø� x
			this.startPage = this.endPage - 9; //10���� �����ִϱ� -9
			
			
			//�Ѱ��� / ���������� ������ ��
			int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
			
			if(realEnd < this.endPage) {
				//���� �����ҋ� endPage�� �ٲ���
				this.endPage = realEnd;
			}
			
			//������ư�� 1�̾ƴϸ� ����
			this.prev = this.startPage > 1;//prev = startPage == 1 ? false : true;
			//������ư�� ��¥ ���������� ������� ����
			this.next = this.endPage < realEnd ; //next = endPage < realEnd ? false : true;;
		}

}
