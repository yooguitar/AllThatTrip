package com.kh.AllThatTrip.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NonUser {
  
	private Long rsvNo;
	private String nonUserName;
	private String phone;
	private Date rsvDate;
	
	
} 
 