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
public class CommentAttachment {

	private int fileNo; 
    private int commentNo; 
    private String originName; 
    private String changeName; 
    private String filePath; 
    private Date uploadDate; 
    private String status; //
}
