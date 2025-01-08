package com.kh.AllThatTrip.camp.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BizMember {
	
	private Long userNo;
	private Long bizNo;
	private Long bizFileNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String spam;
	private String status;
	private Date enrollDate;
	
}
