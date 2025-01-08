package com.kh.AllThatTrip.member.model.vo;

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
public class Member {

	private Long userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;

	private String phone; 	
	private String spam;	
	private String status;	
	private String enrollDate;
	private int loginCount;
	
	private Long bizNo;

}
