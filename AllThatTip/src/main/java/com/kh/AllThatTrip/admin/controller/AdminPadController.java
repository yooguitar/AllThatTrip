package com.kh.AllThatTrip.admin.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.common.model.vo.ResponseData;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/adPad")
public class AdminPadController {
	
	private final AdService adService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("controller")
	public ModelAndView forwardAdminPad() {
		return mv.setViewNameAndData("admin/admin_pad", null);
	}
	
	
	@GetMapping("memberFindAll")
	public ResponseEntity<ResponseData> memberFindAll() {
		List<Member> members = adService.memberFindAll();
		ResponseData response = ResponseData.builder()
											.message("유저 조회 성공.")
											.status(HttpStatus.OK.toString())
											.data(members)
											.build();
		
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}
	@GetMapping("selectMemberId")
	public ResponseEntity<ResponseData> selectMemberId(String userId){
		Member member = adService.selectMemberId(userId);
		
		String message = (member != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (member != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(member)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectMember")
	public ResponseEntity<ResponseData> selectMember() {
		List<Member> members = adService.selectMember();
		
		String message = (members != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (members != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;
		
		ResponseData response = ResponseData.builder()
				.message("유저 조회 성공.")
				.status(status.toString())
				.data(members)
				.build();

		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectDeleteMember")
	public ResponseEntity<ResponseData> selectDeleteMember() {
		List<Member> members = adService.selectDeleteMember();
		
		String message = (members != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (members != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;
		
		ResponseData response = ResponseData.builder()
				.message("유저 조회 성공.")
				.status(status.toString())
				.data(members)
				.build();

		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectNewMember")
	public ResponseEntity<ResponseData> selectNewMember() {
		List<Member> members = adService.selectNewMember();
		
		String message = (members != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (members != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;
		
		ResponseData response = ResponseData.builder()
				.message("유저 조회 성공.")
				.status(status.toString())
				.data(members)
				.build();

		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectOldMember")
	public ResponseEntity<ResponseData> selectOldMember() {
		List<Member> members = adService.selectOldMember();
		
		String message = (members != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (members != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;
		
		ResponseData response = ResponseData.builder()
				.message("유저 조회 성공.")
				.status(status.toString())
				.data(members)
				.build();

		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@PostMapping("deleteMember")
	public ResponseEntity<ResponseData> deleteMember(String userId) {
		int result = adService.deleteMember(userId);
		ResponseData response = ResponseData.builder()
											.message("회원 탈퇴 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
			
	@PostMapping("unDeleteMember")
	public ResponseEntity<ResponseData> unDeleteMember(String userId) {
		int result = adService.unDeleteMember(userId);
		ResponseData response = ResponseData.builder()
											.message("회원 복구 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	
	@PostMapping("spamMember")
	public ResponseEntity<ResponseData> spamMember(String userId) {
		int result = adService.spamMember(userId);
		ResponseData response = ResponseData.builder()
											.message("변경 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	
	@PostMapping("unSpamMember")
	public ResponseEntity<ResponseData> unSpamMember(String userId) {
		int result = adService.unSpamMember(userId);
		ResponseData response = ResponseData.builder()
											.message("변경 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	@PostMapping("updatePasswordMember")
	public ResponseEntity<ResponseData> updatePasswordMember(Member member) {
		log.info("{}", member);
		int result = adService.updatePasswordMember(member);
		ResponseData response = ResponseData.builder()
											.message("회원 복구 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	
	@PostMapping("resetCount")
	public ResponseEntity<ResponseData> resetCount(String userId) {
		int result = adService.resetCount(userId);
		ResponseData response = ResponseData.builder()
											.message("변경 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	@GetMapping("boardFindAll")
	public ResponseEntity<ResponseData> boardFindAll() {
		List<Board> boards = adService.boardFindAll();
		ResponseData response = ResponseData.builder()
											.message("유저 조회 성공.")
											.status(HttpStatus.OK.toString())
											.data(boards)
											.build();
		
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}
	
	@GetMapping("selectBoardWriter")
	public ResponseEntity<ResponseData> selectBoardWriter(String boardWriter){
		log.info("{}",boardWriter);
		List<Board> board = adService.selectBoardWriter(boardWriter);
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectCountMax")
	public ResponseEntity<ResponseData> selectCountMax(){
		List<Board> board = adService.selectCountMax();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	@GetMapping("selectCountMin")
	public ResponseEntity<ResponseData> selectCountMin(){
		List<Board> board = adService.selectCountMin();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectNewBoard")
	public ResponseEntity<ResponseData> selectNewBoard(){
		List<Board> board = adService.selectNewBoard();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("selectOldBoard")
	public ResponseEntity<ResponseData> selectOldBoard(){
		List<Board> board = adService.selectOldBoard();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	@GetMapping("selectDeleteBoard")
	public ResponseEntity<ResponseData> selectDeleteBoard(){
		List<Board> board = adService.selectDeleteBoard();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	@GetMapping("selectBoard")
	public ResponseEntity<ResponseData> selectBoard(){
		List<Board> board = adService.selectBoard();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	@GetMapping("select40Board")
	public ResponseEntity<ResponseData> select40Board(){
		List<Board> board = adService.select40Board();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("select30Board")
	public ResponseEntity<ResponseData> select30Board(){
		List<Board> board = adService.select30Board();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("select20Board")
	public ResponseEntity<ResponseData> select20Board(){
		List<Board> board = adService.select20Board();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("select10Board")
	public ResponseEntity<ResponseData> select10Board(){
		List<Board> board = adService.select10Board();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@GetMapping("select50Board")
	public ResponseEntity<ResponseData> select50Board(){
		List<Board> board = adService.select50Board();
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
	
	@PostMapping("deleteBoard")
	public ResponseEntity<ResponseData> deleteBoard(int boardNo) {
		int result = adService.deleteBoard(boardNo);
		ResponseData response = ResponseData.builder()
											.message("변경 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	@PostMapping("unDeleteBoard")
	public ResponseEntity<ResponseData> unDeleteBoard(int boardNo) {
		int result = adService.unDeleteBoard(boardNo);
		ResponseData response = ResponseData.builder()
											.message("변경 성공.")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();

		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);

	}
	@GetMapping("selectBoardNo")
	public ResponseEntity<ResponseData> selectBoardNo(int boardNo){
		log.info("{}",boardNo);
		List<Board> board = adService.selectBoardNo(boardNo);
		String message = (board != null) ? "조회 성공" : "조회된 결과가 없습니다.";
	    HttpStatus status = (board != null) ? HttpStatus.OK : HttpStatus.BAD_REQUEST;

		ResponseData response = ResponseData.builder()
										    .message(message)
										    .status(status.toString())
										    .data(board)
										    .build();
		
		return new ResponseEntity<ResponseData>(response, status);
	}
}
