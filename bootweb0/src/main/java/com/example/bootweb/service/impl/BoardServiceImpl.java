package com.example.bootweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bootweb.mapper.BoardMapper;
import com.example.bootweb.service.inf.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<?> listAll() {
		// TODO Auto-generated method stub
		return boardMapper.listAll();
	}
	
	
}
