package com.kh.AllThatTrip.board.model.vo;

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
	private int boardType;
	private int userNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String originName;
	private String changeName;
	private String createDate;
	private int count;
	private String status;
	//private List setFileList;
	//private	List BdAttachment;
		
	

	
	
}






