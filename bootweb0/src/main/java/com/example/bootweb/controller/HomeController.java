package com.example.bootweb.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Resource
	HttpSession session;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	@GetMapping("/login")
	public void login(HttpServletRequest request, Model model) {
		
	}
}
