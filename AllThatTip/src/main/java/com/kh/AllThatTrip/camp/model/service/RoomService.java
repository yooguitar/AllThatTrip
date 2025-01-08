package com.kh.AllThatTrip.camp.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.camp.model.vo.Room;

public interface RoomService {
	
	void insertRoom(Room room, MultipartFile[] upfile);
	
	Map<String, Object> selectRoomList();
	
	Map<String, Object> selectRoomById(int roomNo);
	
	void updateRoom(Room room, MultipartFile[] upfile);
	
	void deleteRoom(Room room, String check);
	
}
