package com.example.bootweb.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bootweb.domain.BoardVO;
import com.example.bootweb.domain.Criteria;
import com.example.bootweb.domain.PagingView;
import com.example.bootweb.service.inf.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardController {

	/*
	 * @Autowired
	 * 
	 * @Qualifier("boardService")
	 */
	@Resource
	private BoardService boardService;
	
	@GetMapping("list")
	public void list(HttpServletRequest request,Model model) {
	int pageNum = 1;
	int amount = 10;
	int max = boardService.countAll();
	log.info("max:"+max);
	try {
		pageNum = Integer.parseInt(request.getParameter("p"));
		amount = Integer.parseInt(request.getParameter("amt"));
	} catch (Exception e) {}
	Criteria cri = new Criteria(pageNum, amount, max);
	List<?> list = 	boardService.list(cri);
	log.info(cri.toString());	
	log.info(new PagingView(cri).toString());	
	model.addAttribute("list", list);
	model.addAttribute("paging", new PagingView(cri));
	model.addAttribute("amount",amount);
	}
	
	@GetMapping(value = "/{bno}")
	public String detail(@PathVariable("bno")int bno, Model model) {
		BoardVO vo = boardService.detail(bno);
		model.addAttribute("bno", bno);
		model.addAttribute("board", vo);
		log.info("vo = "+vo);
		
		return "board/detail";
	}
	
	@GetMapping(value = "/register")
	public void register() {}
	
	@PostMapping(value = "/register")
	public String register(BoardVO vo ,HttpServletRequest request, Model model) {
		if(vo.getWriter()==null||vo.getWriter().equals("")) vo.setWriter("익명");
		int bno = vo.getBno();
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null)
            ip = request.getRemoteAddr();
		vo.setIp_address(ip);
		
		log.info(vo.toString());
		
		boardService.register(vo);
		
		if(bno>0)
			return "redirect:/board/"+bno;
		else
			return "redirect:/board/list";
	}
	
	
}
