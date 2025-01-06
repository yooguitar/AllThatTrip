package com.kh.AllThatTrip.board.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;

public interface BoardService {

	
	 // 페이징 + 목록
    Map<String, Object> selectBoardList(Board board);

    // 등록
    void insertBoard(Board board, MultipartFile upfile);

    // 상세 조회
    Map<String, Object> selectByNum(long boardNo);
    
    
    // 수정
    void updateBoard(Board board, MultipartFile upfile);

    // 삭제
    void deleteBoard(Long boardNo, String changeName);
}
	
	

	// 첨부파일
	
	


	
	// 썸네일
	
	// 첨부파일

