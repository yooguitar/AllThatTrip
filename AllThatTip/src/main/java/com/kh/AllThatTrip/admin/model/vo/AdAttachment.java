package com.kh.AllThatTrip.admin.model.vo;


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
public class AdAttachment {
	private int adFileNo;
	private String adOriName;
	private String adChaName;
	private String adFilePath;
	private String adAtStatus;
	private int adNoticeAtNo;
}
