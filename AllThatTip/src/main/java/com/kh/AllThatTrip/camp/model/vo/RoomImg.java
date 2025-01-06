package com.kh.AllThatTrip.camp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoomImg {

	private int imgNo;
	private int roomNo;
	private String originName;
	private String changeName;
	private String uploadDate;
	private String modifyDate;
	private int fileLevel;
	private String status;
	
}
