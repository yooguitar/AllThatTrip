package com.kh.AllThatTrip.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.dao.BoardMapper;
import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.common.model.template.Pagination;
import com.kh.AllThatTrip.common.model.vo.PageInfo;
import com.kh.AllThatTrip.exception.BoardNotFoundException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImple implements BoardService {
	
	private BoardMapper mapper;
	
	private int getTotalCount() {
		int totalCount = mapper.selectTotalCount();
		
		if(totalCount == 0) {
			throw new BoardNotFoundException("존재하지 않는 게시글입니다.");
		} 
		return totalCount;
	}
	
	
	
	private PageInfo getPageInfo(int totalCount, int page) {
		return Pagination.getPageInfo(totalCount, page, 10, 10);
	}

	
	private List<Board> getBoardList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return mapper.selectBoardList(rowBounds);
	}
	
	
	
	
	
	
	
	// 페이징처리
	@Override
	public Map<String, Object> selectBoardList(int currentPage) {
		
		
		int totalCount = getTotalCount();
		
		PageInfo pi = getPageInfo(totalCount, currentPage);
		
		List<Board> boards = getBoardList(pi);
		log.info("게시글목록 {}", boards);
		
		Map<String, Object> map = new HashMap();
		map.put("boards", boards);
		map.put("pageInfo", pi);
		
		return map;
	}

	@Override
	public void insertBoard(Board board, MultipartFile upfile) {
		// 유효성 검증
		// 파일 유무
		// 인서트 진행
		
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
