package com.example.bootweb.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bootweb.service.inf.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@GetMapping("list")
	public void list(Model model) {
	
	List<?> list = 	boardService.listAll();
	log.info(list.get(0).toString());	
	model.addAttribute("list", list);
	}
	
}
