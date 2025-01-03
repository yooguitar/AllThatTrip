package com.kh.AllThatTrip.member.model.vo;

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
public class BusinessUser {

	private Long bizNo;
	private String bizName;
	private String bizFileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String fileStatus;
	private Long userNo;
	
	
}
