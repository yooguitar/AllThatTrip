package com.kh.AllThatTrip.board.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.board.model.dao.BoardMapper;
import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.common.model.template.Pagination;
import com.kh.AllThatTrip.common.model.vo.PageInfo;
import com.kh.AllThatTrip.exception.BoardNoValueException;
import com.kh.AllThatTrip.exception.BoardNotFoundException;
import com.kh.AllThatTrip.exception.FailToFileUploadException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImple implements BoardService {
	
	private final BoardMapper mapper;
	private final ServletContext context;
	
	
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

	
	private List<Board> getBoardList(PageInfo pi, Board board) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		board.setRowBounds(rowBounds);
		
		return mapper.selectBoardList(board);
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
	
	private void handlerFileUpload(Board board, MultipartFile upfile) {
		
		String fileName = upfile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randomNum = (int)Math.random() * 90000 + 10000;
		String changeName = currentTime + randomNum + ext;
		
		
		String savePath = context.getRealPath("/resources/upload_files/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch(IllegalStateException | IOException e) {
			throw new FailToFileUploadException("파일 이상해");
		}
		
		// 첨부파일이 존재했다 → 업로드 + Board객체에 originName + changeName
		board.setOriginName(fileName);
		board.setChangeName("/resources/upload_files/" + changeName);
		log.info("File save path: {}", savePath);
		
	}	
	
	// 페이징처리
	@Override
	public Map<String, Object> selectBoardList(Board board) {
		
		int totalCount = getTotalCount();
		
		PageInfo pi = getPageInfo(totalCount, board.getPage());
		
		List<Board> boards = getBoardList(pi, board);
		log.info("게시글목록 {}", boards);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boards", boards);
		map.put("pageInfo", pi);
		
		return map;
	}

	
	// 상세조회
	@Override
	public Map<String, Object> selectByNum(long boardNo) {
		
		validateBoardNo(boardNo);
		incrementViewCount(boardNo);
		Board board = findBoardByNum(boardNo);
		
		board.setFileList(mapper.selectFileList(boardNo));
		
		Map<String, Object> responseData = new HashMap();
		responseData.put("board", board);
		
		
		return responseData;

	}

	// 등록
	@Transactional
	@Override
	public void insertBoard(Board board, MultipartFile upfile) {
		// 유효성 검증
		validateBoard(board);
		// 파일 유무
		if(!("".equals(upfile.getOriginalFilename()))) {
			handlerFileUpload(board,upfile);
		}
		// 인서트 진행
		mapper.insertBoard(board);
		mapper.insertBoardFile(board);
		 	
	}
	
	@Override
	public void updateBoard(Board board, MultipartFile upfile) {
		validateBoardNo(board.getBoardNo());
		findBoardByNum(board.getBoardNo());
		
		Board model = mapper.selectByNum(board.getBoardNo());
		
//		if(model.getUserNo() == session.getUserNo) {
//			throw new BoardNotFoundException("작성자와 로그인한 사람이 다릅니다.");
//		}
		
		if(!(upfile.getOriginalFilename() != null)) {
			new File(context.getRealPath(board.getChangeName())).delete();
		}
		
		handlerFileUpload(board, upfile);
		
		int result = mapper.updateBoard(board);
		
		if(result < 1) {
			throw new BoardNotFoundException("게시글 수정에 실패하였습니다");
		}
	}
	
	

	@Override
	public void deleteBoard(Long boardNo, String changeName) {
		validateBoardNo(boardNo);
		findBoardByNum(boardNo);
		
		int result = mapper.deleteBoard(boardNo);
		
		if(result <= 0) {
			throw new BoardNotFoundException("게시글 삭제에 실패했습니다");
		} 
		
		if(!("".equals(changeName))) {
			try {
				new File(context.getRealPath(changeName)).delete();
			} catch(RuntimeException e) {
				throw new BoardNotFoundException("파일을 찾을 수 없습니다");
			}
		}
		
	}
	

	
}