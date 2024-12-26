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
public class Reply {

	private int replyNo; 
    private int commentNo; 
    private int userNo; 
    private String replyContent; 
    private Date createDate; 
    private String status; 
	
}
