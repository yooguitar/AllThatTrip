package com.kh.AllThatTrip.board.model.dao;

import org.springframework.web.bind.annotation.RestController;

import com.kh.AllThatTrip.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardApiController {
	
	private final BoardService boardService;

}
