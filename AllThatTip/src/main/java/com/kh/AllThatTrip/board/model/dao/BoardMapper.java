package com.kh.AllThatTrip.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.AllThatTrip.board.model.vo.BdAttachment;
import com.kh.AllThatTrip.board.model.vo.Board;

@Mapper
public interface BoardMapper {
	
	// 개수 조회
	int selectTotalCount(String boardType);
	
	// 목록조회
	List<Board> selectBoardList(Board board, RowBounds rowBounds);
	
	// 조회수증가
	int increaseCount(Long boardNo);
	
	// 상세조회
	Board selectByNum(Long boardNo);
	
	// 작성
	void insertBoard(Board board);
	
	void insertBoardFile(Board board);

	// 수정
	int updateBoard(Board board);
	
	// 삭제 (성공실패 확인해야해서 int)
	int deleteBoard(Long boardNo);

	
	

	// 첨부파일 리스트 조회
	List<BdAttachment> selectFileList(Long boardNo);
	
	// 첨부파일 리스트 진짜 삭제
	void deleteFileByBoardNo(Long boardNo);
	


		
	

}
