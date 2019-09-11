package com.example.bootweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bootweb.domain.BoardVO;
import com.example.bootweb.domain.Criteria;
import com.example.bootweb.mapper.BoardMapper;
import com.example.bootweb.service.inf.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource
	private BoardMapper boardMapper;

	@Override
	public List<?> listAll() {
		return boardMapper.listAll();
	}

	@Override
	public List<?> list(Criteria cri) {
		return boardMapper.listWithPaging(cri);
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return boardMapper.countAll();
	}

	@Override
	public BoardVO detail(int bno) {
		return boardMapper.select(bno);
	}

	@Override
	public void register(BoardVO vo) {
		// TODO Auto-generated method stub
		boardMapper.insert(vo);
	}
	
	
}
