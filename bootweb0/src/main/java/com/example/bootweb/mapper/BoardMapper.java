package com.example.bootweb.mapper;

import java.util.List;

import com.example.bootweb.domain.BoardVO;

public interface BoardMapper {

	public void insert(BoardVO vo);
	public List<?> listAll();
}
