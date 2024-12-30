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
public class Comment {

	private int commentNo; 
    private int userNo; 
    private int boardNo;
    private String comment; 
    private Date createDate; 
    private String status; 
}
