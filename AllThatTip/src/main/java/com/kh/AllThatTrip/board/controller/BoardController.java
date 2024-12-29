package com.kh.AllThatTrip.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.board.model.service.BoardService;
import com.kh.AllThatTrip.board.model.vo.Board;
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


	// 전체 리스트 조회
	@GetMapping("/list")
	public ModelAndView selectBoardList(Board param) {
		
		log.info("board :: {}", param);
		/*
		if(param.getBoardType() == null || param.getBoardType().equals("")) {
			param.setBoardType("10"); // null일 경우 데이터 디폴트 데이터 삽입 나중에 바꾸셈
		}
		*/
		Map<String, Object> map = boardService.selectBoardList(param);
		
		map.put("param", param);
		
//		if(param.getBoardType().equals("30")) {
//			return mv.setViewNameAndData("board/phttoReView", map); 
//		} else {
//			return mv.setViewNameAndData("board/notice_list", map); 
//		}
		
		return mv.setViewNameAndData("board/notice_list", map); 
	}

	// 글쓰기 
	@GetMapping("insertForm")
	public ModelAndView insertForm(Board param) {
		
		log.info("param :: {}", param);
		Map<String, Object> map = boardService.selectBoardList(param);
		
		map.put("param", param);
		
		return mv.setViewNameAndData("board/insert_form", map);
	}


	// 공지사항 등록
	@PostMapping("notice_list/insert")
	public ModelAndView insertBoard(Board board, MultipartFile upfile, HttpSession session) {
		log.info("board : {}, upfile : {}",board, upfile);
		boardService.insertBoard(board, upfile);
		session.setAttribute("alertMsg", "게시글 등록 성공");
		return mv.setViewNameAndData("redirect:/board/list", null);

	}


	// 상세 조회
	@GetMapping("notice_list/{id}")
	public ModelAndView selectByOne(@PathVariable(name="id") Long id) {
		Map<String, Object> responseData = boardService.selectByNum(id);
		
		//log.info("{}", id);
		return mv.setViewNameAndData("board/detail", responseData);
		
	}

	// 수정 양식
	@PostMapping("/list/update-form")
	public ModelAndView updateForm(Long boardNo) {
		Map<String, Object> responseData = boardService.selectByNum(boardNo);
		return mv.setViewNameAndData("board/update", responseData);
	}
	

	
	@PostMapping("/list/update")
	public ModelAndView updateBoard(Board board, MultipartFile upfile) {
		
		log.info("{}:{}",board,upfile);
		boardService.updateBoard(board, upfile);
		return mv.setViewNameAndData("redirect:/board/list", null);
		
	}
	
	
	// 삭제
	@PostMapping("/notice_list/delete")
	public ModelAndView deleteBoard(Long boardNo, String changeName) {
		
		boardService.deleteBoard(boardNo, changeName);
		return mv.setViewNameAndData("redirect:/board/list", null);
	}
	
	
	
}
	/*









	

	// 삭제

	// 검색창(필터)

	// 썸네일

	// 첨부파일

	// 댓글ㄴ


	 */



