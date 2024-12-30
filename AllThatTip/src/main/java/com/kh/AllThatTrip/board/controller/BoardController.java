package com.kh.AllThatTrip.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.board.model.service.BoardService;
import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.exception.BoardNotFoundException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@RequestMapping("board")
@Slf4j
public class BoardController {


	private final BoardService boardService;
	private final ModelAndViewUtil mv;

	
	// 10	공지사항
	// 20	FAQ
	// 30	fna
	// 40	중고거래
	
	
	// 전체 리스트 조회
	@GetMapping("/list")
	public ModelAndView selectBoardList(@RequestParam(defaultValue = "10") String boardType,  // 공지사항 기본값 10
	                                    @RequestParam(defaultValue = "1") int page,           // 기본 페이지 번호 1
	                                    Board param) {
	    
	    param.setBoardType(boardType);
	    param.setPage(page);
	    //  log.info("Board List Param :: {}", param);
	    // 서비스 호출
	    Map<String, Object> map = boardService.selectBoardList(param);
	    map.put("boardType", boardType);
	    map.put("page", page);
	    map.put("param", param);
	    
	    	if(param.getBoardType().equals("10")) {
	    		return mv.setViewNameAndData("board/list", map);
	    	} else if (param.getBoardType().equals("20")) {
	    		return mv.setViewNameAndData("board/faq", map); 
	    	} else if (param.getBoardType().equals("30")) {
	    		return mv.setViewNameAndData("board/qna", map); 
	    	} else if (param.getBoardType().equals("40")) {
	    		return mv.setViewNameAndData("board/userd", map); 
	    	} else {
	    		throw new BoardNotFoundException("존재하지 않는 게시글입니다.");
	    	}
	    		

	}
	
	
	
	// 글쓰기 
	@GetMapping("insertForm")
    public ModelAndView insertForm(
            @RequestParam(defaultValue = "10") String boardType,
            @RequestParam(defaultValue = "1") int page,
            Board param) {
        
        param.setBoardType(boardType);
        param.setPage(page);

      
        Map<String, Object> map = boardService.selectBoardList(param);
        map.put("param", param);

        return mv.setViewNameAndData("board/insert_form", map);
    }


	// 공지사항 등록
	@PostMapping("list/insert")
	public ModelAndView insertBoard(Board board, MultipartFile upfile, String boardType, HttpSession session) {
		
		board.setBoardType(boardType);
		// log.info("board : {}, upfile : {}",board, upfile);
		boardService.insertBoard(board, upfile);
		session.setAttribute("alertMsg", "게시글 등록 성공");
		return mv.setViewNameAndData("redirect:/board/list", null);

	}


	// 상세 조회
	@GetMapping("list/{id}")
	public ModelAndView selectByOne(@PathVariable(name="id") Long id) {
		Map<String, Object> responseData = boardService.selectByNum(id);
		
		//log.info("{}", id);
		return mv.setViewNameAndData("board/detail", responseData);
		
	}

	// 수정 양식
	@PostMapping("/list/update-form")
	public ModelAndView updateForm(Long boardNo) {
		//log.info("수정할 게시글 번호: {}", boardNo);
		Map<String, Object> responseData = boardService.selectByNum(boardNo);
		
		return mv.setViewNameAndData("board/update", responseData);
	}
	

	
	@PostMapping("/list/update")
	public ModelAndView updateBoard(Board board, MultipartFile upfile, HttpSession session) {
		
		log.info("{}:{}",board,upfile);
		boardService.updateBoard(board, upfile);
		
		return mv.setViewNameAndData("redirect:/board/list", null);
		
		
	}
	
	
	// 삭제
	@PostMapping("/list/delete")
	public ModelAndView deleteBoard(Long boardNo, String changeName) {
		
		boardService.deleteBoard(boardNo, changeName);
		return mv.setViewNameAndData("redirect:/board/list", null);
	}
}
	

	



