package com.kh.AllThatTrip.board.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;

public interface BoardService {

	
	// 페이징바 리스트
	Map<String, Object> selectBoardList(int currentPage);
	
	
	// 등록
	void insertBoard(Board board, MultipartFile upfile);

	// 상세 조회
	Map<String, Object> selectById(long boardNo);
	
	// 수정
	void updateBoard(Board boardNo, MultipartFile upfile);
	
	// 삭제
	void deleteBoard(Board boardNo, String changeName);
	// 검색창(필터)
	
	// 썸네일
	
	// 첨부파일
}
