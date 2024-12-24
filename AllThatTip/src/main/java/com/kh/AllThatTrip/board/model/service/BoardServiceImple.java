package com.kh.AllThatTrip.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.common.model.template.Pagination;
import com.kh.AllThatTrip.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImple implements BoardService {@Override
	public Map<String, Object> selectBoardList(int currentPage) {
	
		return null;
	}

	@Override
	public void insertBoard(Board board, MultipartFile upfile) {
		
	}

	@Override
	public Map<String, Object> selectById(long boardNo) {
		
		return null;
	}

	@Override
	public void updateBoard(Board boardNo, MultipartFile upfile) {
		
	}

	@Override
	public void deleteBoard(Board boardNo, String changeName) {
		
	}
	
	


}
