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
	// 50	

	
	// 전체 리스트 조회
	@GetMapping("/list")
	public ModelAndView selectBoardList(@RequestParam(defaultValue = "10") String boardType,  // 공지사항 기본값 10
	                                    @RequestParam(defaultValue = "1") int page,           // 기본 페이지 번호 1
	                                    Board board) {
	    
		//log.info("boardType :: {}", boardType);
		//log.info("page :: {}", page);
		
		board.setBoardType(boardType);
		board.setPage(page);
	    
	    
	    // 서비스 호출
	    Map<String, Object> map = boardService.selectBoardList(board);
	    //log.info("board:{}", board);
	    //log.info("map:{}", map);
	    map.put("board", board);
	   
	   
    	if(board.getBoardType().equals("10")) {
    		return mv.setViewNameAndData("board/list", map);
    	} else if (board.getBoardType().equals("20")) {
    		return mv.setViewNameAndData("board/faq", map); 
    	} else if (board.getBoardType().equals("30")) {
    		return mv.setViewNameAndData("board/qna", map); 
    	} else if (board.getBoardType().equals("40")) {
    		return mv.setViewNameAndData("board/photo", map); 
    	} else if (board.getBoardType().equals("50")) {
    		return mv.setViewNameAndData("board/review", map); 
    	}else {
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


	// 공통게시판 등록
	@PostMapping("list/insert")
	public ModelAndView insertBoard(Board board, MultipartFile[] upfiles, String boardType, HttpSession session) {
		//log.info("시작");
		//log.info("boardType1111:{}",boardType);
		
		board.setBoardType(boardType);
		//log.info("board : {}, upfiles : {}",board, upfiles);
		//log.info("boardType2222:{}",boardType);

		if (upfiles == null) {
			upfiles = new MultipartFile[0];
		}
		for(MultipartFile r : upfiles) {
		//	log.info("r :: {}", r.toString());
		}
		boardService.insertBoard(board, upfiles);

		//log.info("boardType3333:{}",boardType);
	    // boardType에 따라 리다이렉트 URL 설정
	    String redirectUrl;
	    switch (board.getBoardType()) {
	        case "10": redirectUrl = "/board/list?boardType=10"; // 공지사항
	        			break;
	        case "20": redirectUrl = "/board/list?boardType=20"; // FAQ
	        			break;
	        case "30": redirectUrl = "/board/list?boardType=30"; // QnA
	            		break;
	        case "40": redirectUrl = "/board/list?boardType=40"; // 중고거래
	            		break;
	        default: throw new BoardNotFoundException("잘못된 경로입니다.");
	    }
	    //log.info("URL:{}",redirectUrl);
	    // 성공 메시지 설정
	    session.setAttribute("alertMsg", "게시글 등록이 완료되었습니다.");
	    //log.info("종료:{}");
	    // ModelAndView 리턴
	    return new ModelAndView("redirect:" + redirectUrl);
	}

	// 상세 조회
	@GetMapping("list/{id}")
	public ModelAndView selectByOne(@PathVariable(name="id") Long id) {
		Map<String, Object> responseData = boardService.selectByNum(id);
		
		//log.info("{}", id);
		return mv.setViewNameAndData("board/detail", responseData);
		
	}
	

	// 수정 양식
	// boardNo 파라미터만 보내도 상세조회를 하기 때문에 boardType을 알수있음 → 뷰 페이지 제어 필요

	@PostMapping("/list/update-form")
	public ModelAndView updateForm(Long boardNo ) {
		//log.info("수정할 게시글 번호: {}", boardNo);
		Map<String, Object> responseData = boardService.selectByNum2(boardNo);
		
		
		
		return mv.setViewNameAndData("board/update", responseData);
	}
	

	// 공통 게시판 수정
	@PostMapping("/list/update")
	public ModelAndView updateBoard(Board board, @RequestParam(value = "upfiles", required = false)MultipartFile[] upfiles, HttpSession session) {
		
		boardService.updateBoard(board, upfiles);
		
		session.setAttribute("alertMsg", "게시글 수정이 완료되었습니다.");
		
		return mv.setViewNameAndData("redirect:/board/list", null);
	}
	
	
	// 삭제
	@PostMapping("/list/delete")
	public ModelAndView deleteBoard(Long boardNo, String changeName, HttpSession session) {
		
		boardService.deleteBoard(boardNo, changeName);
		
		session.setAttribute("alertMsg", "게시글 삭제가 완료되었습니다.");
		
		return mv.setViewNameAndData("redirect:/board/list", null);
	}


}
	

	



