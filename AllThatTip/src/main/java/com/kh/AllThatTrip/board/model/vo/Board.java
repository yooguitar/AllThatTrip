package com.kh.AllThatTrip.board.model.vo;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Board {

	private Long boardNo;
	private String  boardType;
	private Long userNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String originName;
	private String changeName;
	private String createDate;
	private int count;
	private String status;
	private List<BdAttachment> fileList;
	private int page;
	private String keyword;
	private String condition;
	private String imagePath;
	private String faqType;
	private String boardCdName;
} 
		
	

	
	






