package com.kh.AllThatTrip.board.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.board.model.service.BoardService;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Slf4j
public class BoardController {
	

	private final BoardService boardService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("/notice_list")
    public ModelAndView selectBoardList(@RequestParam(value="page", defaultValue="1") int currentPage) {
		Map<String, Object> map = boardService.selectBoardList(currentPage);
		return mv.setViewNameAndData("board/notice_list", map); 
    }
	
	
	
	
	
	/*
	// 전체 리스트 조회
	
	
	// 조회수 증가
	
	// 상세 조회
	
	// 등록
	@PostMapping("boards")
	public ModelAndView insertBoard(Board board, MultipartFile upfile, HttpSession session) {
		
		boardService.insertBoard(board, upfile);
		session.setAttribute("alertMsg", "게시글 등록 성공");
		return mv.setViewNameAndData("redirect:boards", null);
		
	}
	
	// 수정
	
	// 삭제
	
	// 검색창(필터)
	
	// 썸네일
	
	// 첨부파일
	
	// 댓글ㄴ
	
	
	*/
	
	
}
