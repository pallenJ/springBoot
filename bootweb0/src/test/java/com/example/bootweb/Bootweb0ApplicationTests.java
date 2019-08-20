package com.example.bootweb;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.bootweb.service.inf.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class Bootweb0ApplicationTests {

	@Resource(name="boardService")
	BoardService boardService;
	
	@Test
	public void contextLoads() {
		boardService.listAll().forEach(e->log.info(e.toString()));
	}

}
