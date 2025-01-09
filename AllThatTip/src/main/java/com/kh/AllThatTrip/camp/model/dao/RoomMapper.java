package com.kh.AllThatTrip.camp.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.camp.model.vo.RoomImg;
import com.kh.AllThatTrip.camp.model.vo.RoomTheme;

@Mapper
public interface RoomMapper {

	int insertRoom(Room room);
	
	int insertRoomTheme(int roomTheme);
	
	int insertRoomImage(RoomImg ri);
	
	List<Room> selectRoomList();
	
	List<RoomImg> selectRoomImgList();
	
	List<Room> selectRoomListByCampNo(Long campNo);
	
	List<RoomImg> selectRoomImgListByCampNo(Long campNo);
	
	Room selectRoomById(int roomNo);
	
	List<RoomTheme> selectRoomThemeById(int roomNo);
	
	List<RoomImg> selectRoomImgById(int roomNo);
	
	void updateRoom(Room room);
	
	void deleteRoomTheme(int roomNo);
	
	void updateRoomTheme(RoomTheme rt);
	
	void updateRoomImage(RoomImg ri);
	
	int deleteRoom(Room room);
	
	List<Room> selectRoomListByRoomType(Long id);
	
}