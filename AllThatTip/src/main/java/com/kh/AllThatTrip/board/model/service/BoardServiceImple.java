package com.kh.AllThatTrip.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.common.model.vo.PageInfo;

public class BoardServiceImple implements BoardService {

	@Override
	public Map<String, Object> selectBoardList(int currentPage) {
		
		int totalCount = getTotalCount();
		
		PageInfo pi = getPageInfo(totalCount, currentPage);
		
		List<Board> boards = getBoardList(pi);
		
		log.info("게시글목록:{}", boards);
		
		Map<String, Object> map = new HashMap();
		map.put("boards", boards);
		map.put("pageInfo", pi);
		
		
		return map;
	}

	@Override
	public int increaseCount(Board board) {
		return 0;
	}

	@Override
	public void insertBoard(Board board, MultipartFile upfile) {

	}

	@Override
	public Map<String, Object> selectById(long boardNo) {
		return null;
	}

	@Override
	public void updateBoard() {

	}

	@Override
	public void deleteBoard() {

	}

}
