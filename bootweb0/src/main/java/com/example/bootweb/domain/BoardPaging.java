package com.example.bootweb.domain;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class BoardPaging extends Criteria{

	private int startPage;
	private int endPage;
	private int last;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	public BoardPaging(int total, Criteria cri) {
		super();
		this.total = total;
		this.cri = cri;
		this.setPageNum(cri.getPageNum());
		this.setAmount(cri.getAmount());
		if(total ==0) return;
		pageCalculate();
	}
	
	private void pageCalculate() {
		this.last = (int)(Math.ceil(total*1.0))/cri.getAmount()+(total%10==0?0:1);
		this.endPage = cri.getPageNum()*getAmount();
		this.startPage = this.endPage-getAmount();
		
		if(startPage>total) {
			setCri(new Criteria(getPageNum(), getAmount()));
			pageCalculate();
		}
		this.next = endPage < last;
		this.prev = startPage !=0;
		endPage = this.next?endPage:last;
		
	}
}
