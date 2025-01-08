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
public class Comment {

	private long commentNo; 
	private long boardNo;
    private Long userNo;
    private String userId;
    private String commentContent; 
    private String createDate; 
    private String status; 
}
