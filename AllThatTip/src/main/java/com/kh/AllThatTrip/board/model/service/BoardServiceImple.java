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
import com.kh.AllThatTrip.exception.BoardNoValueException;
import com.kh.AllThatTrip.exception.BoardNotFoundException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImple implements BoardService {
	
	private final BoardMapper mapper;
	
	
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
	
	
	private void validateBoard(Board board) {
		if(board == null 
			|| board.getBoardTitle() 	== null || board.getBoardTitle().trim().isEmpty()
			|| board.getBoardContent()	== null || board.getBoardContent().trim().isEmpty()
			|| board.getBoardWriter() 	== null || board.getBoardWriter().trim().isEmpty()) {
			throw new BoardNoValueException("부적합한 입력값");
		}
		
		
		// 개행문자를 br요소로
		String boardTitle = escapeHtml(board.getBoardTitle());
		String boardContent = escapeHtml(board.getBoardContent());
		board.setBoardTitle(convertNewlineToBr(boardTitle));
		board.setBoardContent(convertNewlineToBr(boardContent));
	}
	
	
	private String escapeHtml(String value) {
		return value.replaceAll("<", "&lt;").replaceAll(">", "&lt;");
	}
	
	
	private String convertNewlineToBr(String value) {
		return value.replaceAll("\n", "<br>");
	}
	
	
	private void validateBoardNo(Long boardNo) {
		if(boardNo == null || boardNo <= 0) {
			throw new BoardNotFoundException("유효하지 않는 게시글 번호입니다.");
		}
	}
	
	private void incrementViewCount(Long boardNo) {
		int result = mapper.increaseCount(boardNo);
		if(result < 1) {
			throw new BoardNotFoundException("게시글이 존재하지 않습니다");
		}
	}
	
	
	private Board findBoardByNum(Long boardNo) {
		Board board = mapper.selectByNum(boardNo);
		if(board == null) {
			throw new BoardNotFoundException("게시글을 찾을 수 없습니다.");
		}
		return board;
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
		validateBoard(board);
		// 파일 유무
		// 인서트 진행
		
	}
	
	// 상세조회
	@Override
	public Map<String, Object> selectByNum(long boardNo) {
		
		validateBoardNo(boardNo);
		incrementViewCount(boardNo);
		Board board = findBoardByNum(boardNo);
		
		// 있으면 보드 VO에 필드에 담겨져온 데이터를 다시 반환해줌
		Map<String, Object> responseData = new HashMap();
		responseData.put("board", board);
		
		return responseData;

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
