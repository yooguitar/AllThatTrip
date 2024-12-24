package com.kh.AllThatTrip.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.AllThatTrip.board.model.vo.Board;

@Mapper
public interface BoardMapper {
	
	// 목록조회
	List<Board> selectBoardList(RowBounds rowBounds);
	
	// 조회수증가
	int increaseCount(Long boardNo);
	
	
	/*
	// 개수조회 
	int selectTotalCount();

	
	// 조회수증가
	int increaseCount(Long boardNo);
	
	// 상세조회
	Board selectById(Long boardNo);
	
	

	// 수정
	int updateBoard(Board board);
	
	// 삭제 (성공실패 확인해야해서 int)
	int deleteBoard(Long boardNo);
	
	*/

	// 작성
	void insertBoard(Board board);

	int selectTotalCount();
		
	

}
