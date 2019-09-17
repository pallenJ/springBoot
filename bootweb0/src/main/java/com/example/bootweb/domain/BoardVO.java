package com.example.bootweb.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardVO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private String regDate;
	private String updateDate;
	private String ip_address;
	public BoardVO(String title, String writer, String content) {
		super();
		this.title = title;
		this.writer = writer;
		this.content = content;
	}
	
}
