package com.example.demo.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
@RequestMapping("/")
	public String simple() {
		return "boot simple";
	}
}
