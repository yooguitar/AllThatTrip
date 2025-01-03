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
public class Admin {

	private String adId;
	private String adPwd;
	private String adName;
	private String leave;
	private Date addAdDate;
	private String adLevel;
	private String levelName;
	
}
