package com.spring.test.domain;

import org.springframework.web.util.UriComponentsBuilder;

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
    }// ���� �������� �Խñ� ���� ��ȣ = ���� ������ ��ȣ -1 * �������� �����ִ� ����
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}
	
	//�Խù��� ������ ������ ��ȣ�� �˻� ���� �����ϸ鼭 �̵��ϱ� ���� redirect�� �ʿ��� �Ķ���� �Ź� �߰��ؾߵǴ� ����
	//criteria���� ó��
	//UriComponentsBuilder�� ���������� GET��ĵ��� �Ķ���� ���ۿ� ���Ǵ� ���ڿ�QUERYstring�� �ս��� ó���� �� �ִ� Ŭ���� 
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("PageNum", this.pageNum)
				.queryParam("amout", this.getAmount())
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
