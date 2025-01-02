package com.kh.AllThatTrip.board.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
import com.kh.AllThatTrip.board.model.vo.BdAttachment;
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
	
	
	private int getTotalCount(String boardType) {
		int totalCount = mapper.selectTotalCount(boardType);
		
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
		
		return mapper.selectBoardList(board, rowBounds);
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
	
	
	// 파일업로드
	private Board handlerFileUpload(Board board, MultipartFile upfile) {
		
		if(upfile == null) {
			log.info("파일이 존재하지 않습니다.");

			return board;
		}
		
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
		//log.info("File save path: {}", savePath)/;
		
		return board;
	}	
	
	// 다중파일..
	private BdAttachment createAttachment(Board board, MultipartFile upfile) {
	    
	    Board updatedBoard = handlerFileUpload(board, upfile);

	    // BdAttachment 객체 생성
	    BdAttachment attachment = new BdAttachment();
	    attachment.setBoardNo(updatedBoard.getBoardNo()); // 게시글 번호
	    attachment.setOriginName(updatedBoard.getOriginName()); // 원본 파일명
	    attachment.setChangeName(updatedBoard.getChangeName()); // 변경된 파일명

	    return attachment;
	}
	
	// 페이징처리
	@Override
	public Map<String, Object> selectBoardList(Board board) { 
		
		int totalCount = getTotalCount(board.getBoardType());
		
		// log.info("게시글개수: {}", totalCount);
		// log.info("요청페이지: {}", currentPage);
		
		PageInfo pi = getPageInfo(totalCount, board.getPage());
	
		List<Board> boards = getBoardList(pi, board);
		
		//log.info("게시글목록:{}", boards);
		
		Map<String, Object> map = new HashMap();
		
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
		
		// board 객체에 List<fileList> 객체 생성 후 객체안에서 파일은 List 타입으로 처리
		// 사유 : 상세페이지는 한개의 로우 파일은 리스트형태로 조회가 가능하기에 fileList 는 list타입으로 처리
		// (상세 게시글 데이터 로우 : 상세 게시글 첨부파일 로우) == (1:n)
		List<BdAttachment> fileList = mapper.selectFileList(boardNo); //게시글 번호를 기준으로 첨부파일 목록을 조회, 첨부파일 데이터를 리스트 형태로 반환
		
		board.setFileList(fileList); // board객체에 fileList 다중 파일을 하나의 객체로 관리
		
		Map<String, Object> responseData = new HashMap<>();
        responseData.put("board", board); // 응답데이터 지정
		
		return responseData;	// 사용자에게 반환

	}

	// 등록
	@Transactional
	@Override
	public void insertBoard(Board board, MultipartFile upfile) {
		
		Board fileBoard = new Board();
		
		// 유효성 검증
		validateBoard(board);
		// 파일 유무
		if (upfile != null && !upfile.isEmpty()) {
			fileBoard = handlerFileUpload(board, upfile);
	    }
		// 인서트 진행
		mapper.insertBoard(board);
		board.setOriginName(fileBoard.getOriginName());
		
		if (board.getOriginName() != null && !board.getOriginName().isEmpty()) {
	       mapper.insertBoard(board);
	    }
				 	
	}
	
	
	// 수정
	@Override
	public void updateBoard(Board board, MultipartFile[] upfiles) {
		// 유효성 검증
		validateBoardNo(board.getBoardNo());
		findBoardByNum(board.getBoardNo());
		Board model = mapper.selectByNum(board.getBoardNo()); // 기존 게시글 조회
		
//		if(model.getUserNo() == session.getUserNo) {
//			throw new BoardNotFoundException("작성자와 로그인한 사람이 다릅니다.");
//		}
		// 1. 기존 파일 삭제 (업데이트 경로에서)
		if(model.getFileList() != null && model.getFileList().isEmpty()) {
			for(BdAttachment file : model.getFileList()) {
				File existingFile = new File(context.getRealPath(file.getChangeName()));
				if (existingFile.exists()) {
	                existingFile.delete(); // 기존 파일 삭제
		       }
			}
    	}
		// 2. DB에서 기존 파일 데이터 삭제
		mapper.deleteFileByBoardNo(board.getBoardNo());
		
		// 3. 새 파일 업로드 및 데이터 삽입
		BdAttachment[] fileArray = null; // 배열 초기화
		if (upfiles != null && upfiles.length > 0) {
	        fileArray = new BdAttachment[upfiles.length]; // 배열 크기 설정
	        int index = 0;
	        for (MultipartFile upfile : upfiles) {
	            if (upfile != null && !upfile.isEmpty()) {
	                // 파일 업로드 처리
	            	 fileArray[index++] = createAttachment(board, upfile);
	            }
	        }
	    }

	    // DB에 첨부파일 데이터 삽입
	    if (fileArray != null && fileArray.length > 0) {
	        mapper.insertBoardFile(Arrays.asList(fileArray)); // 배열을 리스트로 변환하여 전달
	    }

	    // 게시글 업데이트
	    int result = mapper.updateBoard(board);
	    if (result < 1) {
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
	
	
	
	// 다중 파일 메소드
	
	
	/*
	// 첨부파일 다중 등록
	@Transactional
	@Override
	public Map<String, Object> saveAll(Board board, List<MultipartFile> upfiles) {

	    // 유효성 검증
	    validateBoard(board);
	    List<Board> fileBoards = new ArrayList<>();

	    // 파일 유무 확인 및 처리
	    if (upfiles != null && !upfiles.isEmpty()) {
	        for (MultipartFile upfile : upfiles) {
	            if (!upfile.isEmpty()) {
	                Board fileBoard = handlerFileUpload(board, upfile);
	                fileBoards.add(fileBoard);
	            }
	        }
	    }

	    // 게시글 정보 저장
	    mapper.insertBoard(board);

	    // 파일 정보가 있으면 파일 정보 저장
	    if (!fileBoards.isEmpty()) {
	        for (Board fileBoard : fileBoards) {
	            fileBoard.setBoardNo(board.getBoardNo()); 
	            mapper.insertBoardFile(fileBoard);
	        }
	    }
		return null;
	}
	*/
}