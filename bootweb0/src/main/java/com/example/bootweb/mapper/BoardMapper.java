package com.example.bootweb.mapper;

import java.util.List;

import com.example.bootweb.domain.BoardVO;
import com.example.bootweb.domain.Criteria;

public interface BoardMapper {

	public void insert(BoardVO vo);
	public BoardVO select(int bno);
	public List<?> listAll();
	public List<?> listWithPaging(Criteria cri);	
	public int countAll();
	public void update(BoardVO vo);
	public int pageNum(int bno);
	public int delete(int bno);
	
	public void insertHistory(BoardVO vo);
	public List<?> getBoardHistory(int bno);
 }
