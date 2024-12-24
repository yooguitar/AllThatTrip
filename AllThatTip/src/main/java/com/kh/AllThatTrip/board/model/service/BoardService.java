package com.kh.AllThatTrip.board.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;

public interface BoardService {

	
	// 페이징바
	public Map<String, Object> selectBoardList(int currentPage);
	
	
	// 전체 리스트 조회
	
	// 조회수 증가 
	int increaseCount(Board board);
	
	// 등록
	void insertBoard(Board board, MultipartFile upfile);

	// 상세 조회
	Map<String, Object> selectById(long boardNo);
	
	// 수정
	void updateBoard();
	
	// 삭제
	void deleteBoard();
	// 검색창(필터)
	
	// 썸네일
	
	// 첨부파일
}
