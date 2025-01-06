package com.kh.AllThatTrip.board.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.AllThatTrip.board.model.service.BoardService;
import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.board.model.vo.Comment;
import com.kh.AllThatTrip.common.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
@RequestMapping("comment")
@RequiredArgsConstructor
public class BoardApiController {
	
	private final BoardService boardService;

	
	// 댓글 등록
	@PostMapping
	public ResponseEntity<ResponseData> ajaxInsertComment(Comment comment, HttpSession session){
		
		//User loginUser = (User) session.getAttribute("loginUser");
		//  성공 시 1, 실패 시 0
		int result = boardService.insertComment(comment);	
		
		// 응답 메시지 설정
	    String message = (result > 0) ? "댓글이 등록되었습니다." : "댓글 등록에 실패했습니다.";
	    HttpStatus status = (result > 0) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;
	    
		ResponseData response = ResponseData.builder()
								.message(message)
								.status(HttpStatus.OK.toString())
								.data(result).build();
		
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}
	
	
	// 댓글 조회
	@GetMapping
	public ResponseEntity<ResponseData> ajaxCommnetList(Long boardNo){
			
		List<Comment> commnets = boardService.commentList(boardNo);
		ResponseData response = ResponseData.builder()
								.message("댓글 조회에 성공했습니다.")
								.status(HttpStatus.OK.toString())
								.data(commnets)
								.build();
		
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}
	
	// 댓글 삭제
	
	@PostMapping("delete")
	public ResponseEntity<ResponseData> ajaxDeleteComment(Long commentNo) {
		// log.info("{}", commentNo);
	    // 삭제 서비스 호출 (성공 시 1, 실패 시 0 반환)
	    int result = boardService.deleteComment(commentNo);

	    // 응답 메시지 설정
	    String message = (result > 0) ? "댓글이 삭제되었습니다." : "댓글 삭제에 실패했습니다.";
	    HttpStatus status = (result > 0) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

	    // 응답 데이터 생성
	    ResponseData response = ResponseData.builder()
	    						.message(message)
	    						.status(status.toString())
	    						.data(result)
	    						.build();

	    return new ResponseEntity<ResponseData>(response, status);
	}
	

	/*
	@ResponseBody
	@GetMapping(value="search",produces="application/json; charset=UTF-8")
	public Board boardsSearch(Long no) {
		
		Map<String, Object> response = boardService.selectByNum(no);
		
		log.info("조회된 게시글 정보: {}", response.get("board"));
		
		return (Board)response.get("board");
	}
	*/
	@ResponseBody
	@RequestMapping("/search")
	public String boardsSearch() {
	    return "boards/searchTest";
	}
	
}
