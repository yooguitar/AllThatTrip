package com.kh.AllThatTrip.adminPhotoBoard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class AdPhotoReply {
	private int ptRepNo;
	private String ptRepContent;
	private Date ptCreateDate;
	private String ptStatus;
	private int score;
	private int ptNo;
	private String ptRepName;
}
