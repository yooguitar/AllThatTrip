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
public class Member {

	private Long userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone; 	// DB에서 NUMBER로 받아요 숫자만 넣어야 합니다!
	private String spam;	// 1 || 0 
	private String status;	// Y || N
	private Date enroll_date;
	
	
	
	
	
	
	
}
