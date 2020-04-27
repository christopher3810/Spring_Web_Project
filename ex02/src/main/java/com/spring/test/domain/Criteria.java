package com.spring.test.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum; //������ ������ ��ȣ
	private int amount; //�������� ������ �Խñ��� ���� 
	
	private String type;
	private String keyword;

	/*�뵵�� pagenum�� amount���� �����ϴ� �뵵������ �����ڸ� ���ؼ� �⺻���� 1/10���� �����ؼ� ó���մϴ�*/
	/*���� �Խ��� ������ ���� ���ؼ� �⺻ �� ���� */
	

	public Criteria() {
		
		this(1,12);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getPageStart() {
        return (this.pageNum-1)*amount;
    }
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
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
