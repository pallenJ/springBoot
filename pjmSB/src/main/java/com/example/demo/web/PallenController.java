package com.example.demo.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PallenController {
	@RequestMapping("/pallen")
	public String pallen() {
		return "pallen";
	}
}
