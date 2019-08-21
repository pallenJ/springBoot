package com.example.bootweb.service.inf;

import java.util.List;

import com.example.bootweb.domain.Criteria;

public interface BoardService {
	
	public List<?> listAll();
	public List<?> list(Criteria cri);
	public int countAll();
}
