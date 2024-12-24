package com.kh.AllThatTrip.board.model.vo;

import java.util.Date;

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
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private int count;
	private String status;

	
	
}






