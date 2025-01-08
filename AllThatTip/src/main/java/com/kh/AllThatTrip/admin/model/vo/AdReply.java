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
public class AdReply {

	private int adRepNo;
	private String adRepContent;
	private Date adCreateDate;
	private String adStatus;
	private String adRepName;
	private int adNoticeRepNo;
}
