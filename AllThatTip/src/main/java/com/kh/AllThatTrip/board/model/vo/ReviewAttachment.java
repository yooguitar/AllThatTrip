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
public class ReviewAttachment {

	private int fileNo; 
    private int reviewNo; 
    private String originName;
    private String changeName; 
    private String filePath;
    private Date uploadDate; 
    private int fileLevel; 
    private String status;
}
