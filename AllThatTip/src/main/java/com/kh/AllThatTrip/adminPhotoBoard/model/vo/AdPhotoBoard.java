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
public class AdPhotoBoard {

	private int ptNo;
	private String ptTitle;
	private String ptContent;
	private Date uploadDate;
	private int ptCount;
	private String ptOriName;
	private String ptChaName;
	private String ptWriter;
	private int ptTierNo;
	
}
