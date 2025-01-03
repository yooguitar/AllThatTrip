package com.kh.AllThatTrip.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.board.model.vo.Comment;
import com.kh.AllThatTrip.board.model.vo.Reply;

public interface BoardService {

	
	 // 페이징 + 목록
    Map<String, Object> selectBoardList(Board board);
    // 등록
    void insertBoard(Board board, MultipartFile upfile);

    // 상세 조회
    Map<String, Object> selectByNum(long boardNo);
    
    
    // 수정
    void updateBoard(Board board, MultipartFile[] upfiles);

    // 삭제
    void deleteBoard(Long boardNo, String changeName);
    
    // 댓글등록
	int insertComment(Comment comment);
    
	// 댓글목록
	List<Comment> commentList(long boardNo);
	
	// 댓글삭제
	//int deleteComment(Long commentNo);
	
	// 대댓글 작성
	//int insertReply(Reply reply);
	
	
}
	

