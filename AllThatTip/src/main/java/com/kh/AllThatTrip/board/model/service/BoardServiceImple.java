package com.kh.AllThatTrip.board.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImple implements BoardService {@Override
	public Map<String, Object> selectBoardList(int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertBoard(Board board, MultipartFile upfile) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> selectById(long boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(Board boardNo, MultipartFile upfile) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Board boardNo, String changeName) {
		// TODO Auto-generated method stub
		
	}
	
}
