package com.kh.AllThatTrip.admin.model.vo;

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
public class AdNotice {

	private int adNoticeNo;
	private String importent;
	private String adNoticeTitle;
	private String adNoticeContent;
	private int adNoticeCount;
	private Date adUploadDate;
	private String adWriter;
	
}
