package com.example.bootweb.service.inf;

import java.util.List;

import com.example.bootweb.domain.BoardVO;
import com.example.bootweb.domain.Criteria;

public interface BoardService {
	
	public List<?> listAll();
	public List<?> list(Criteria cri);
	public int countAll();
	public BoardVO detail(int bno);
	public void register(BoardVO vo);
	public int remove(int bno);
	
	public List<?> historyList(int bno);
}
