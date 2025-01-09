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
public class Room {

	private int roomNo;
	private int campNo;
	private int roomTypeNo;
	private String roomTypeName;
	private String roomName;
	private int[] roomThemeNo;
	private String roomDesc;
	private int roomPrice;
	private String price;
	private int count;
	private String status;
	
}
