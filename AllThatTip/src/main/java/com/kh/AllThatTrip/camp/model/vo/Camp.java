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
public class Camp {
	
	private Long campNo;
	private Long bizNo;
	private String campName;
	private String campAddr;
	private String campDesc;
	private String originName;
	private String changeName;
	private String insertDate;
	private String modifyDate;
	private String status;
	
}
