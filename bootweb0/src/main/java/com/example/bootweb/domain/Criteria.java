package com.example.bootweb.domain;

import lombok.*;

@ToString
@Getter
@NoArgsConstructor
public class Criteria {
	
	protected @Setter int max = -1;
	protected int pageNum;
	protected int amount;
	protected int limit;
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		setLimit();
	}
	public Criteria(int pageNum, int amount, int max) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.max=max;
		setLimit();
	}
	
	public void setLimit() {
		this.limit = this.amount * (this.pageNum-1);
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		setLimit();
	}
	public void setAmount(int amount) {
		this.amount = amount;
		setLimit();
	}
	
}
