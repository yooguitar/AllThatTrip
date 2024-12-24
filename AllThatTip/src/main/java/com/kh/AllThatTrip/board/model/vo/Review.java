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
public class Review {

	private int reviewNo; 
    private int userNo; 
    private String reviewTitle; 
    private String reviewContent; 
    private Date createDate; 
    private int count;
    private String status; 
    private int resNo; 
}
