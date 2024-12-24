package com.kh.AllThatTrip.adminPhotoBoard.model.vo;


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
public class AdPhotoBoard {

	private int ptNo;
	private String ptTitle;
	private String ptContent;
	private String uploadDate;
	private int ptCount;
	private String ptWriter;
	private int ptTierNo;
	
}
