package com.kh.AllThatTrip.board.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.board.model.service.BoardService;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor // 생성자 주입으로하는게 좋음!롬복이 알아서 해준다
@Slf4j
public class BoardController {

	private final BoardService boardService;
	private final ModelAndViewUtil mv;
	
	// 페이징바
	@GetMapping("boards")
	public ModelAndView selectBoardList(@RequestParam(value="page", defaultValue="1") int page) {
		
		Map<String, Object> map = boardService.selectBoardList(page);

		return mv.setViewNameAndData("board/list", map);
	}
	
	// 전체 리스트 조회
	
	// 조회수 증가
	
	// 상세 조회
	
	// 등록
	
	// 수정
	
	// 삭제
	
	// 검색창(필터)
	
	// 썸네일
	
	// 첨부파일
	
	// 댓글ㄴ
	
	
	
	
	
}
