package com.kh.AllThatTrip.camp.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.camp.model.dao.RoomMapper;
import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.camp.model.vo.RoomImg;
import com.kh.AllThatTrip.camp.model.vo.RoomTheme;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor()
public class RoomServiceImpl implements RoomService {
	
	private final RoomMapper mapper;
	private final ServletContext context;

	@Override
	@Transactional
	public void insertRoom(Room room, MultipartFile[] upfile) {
		
		mapper.insertRoom(room); // 숙소 정보 insert
		
		for(int i = 0; i < room.getRoomThemeNo().length; i++) {
			mapper.insertRoomTheme(room.getRoomThemeNo()[i]); // 숙소 테마 있는대로 insert
		}
		
		for(int i = 0; i < upfile.length; i++) {
			if(!"".equals(upfile[i].getOriginalFilename())) {
				RoomImg ri = new RoomImg();
				String originName = upfile[i].getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf("."));
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int randomNum = (int)(Math.random() * 9000) + 1000;
				String fileName = "ATT_JH_";
				String changeName = fileName + currentTime + "_" + randomNum + ext;
				String savePath = context.getRealPath("/resources/room_upload_files/");
				try {
					upfile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				ri.setOriginName(originName);
				ri.setChangeName("/resources/room_upload_files/" + changeName);
				ri.setFileLevel(i + 1);
				mapper.insertRoomImage(ri); // image 있는대로 insert
			}
		}
	}

	@Override
	public Map<String, Object> selectRoomList() {
		List<Room> roomList = mapper.selectRoomList();
		List<RoomImg> roomImgList = mapper.selectRoomImgList();
		Map<String, Object> responseData = new HashMap<String, Object>();
		responseData.put("roomList", roomList);
		responseData.put("roomImgList", roomImgList);
		return responseData;
	}
	
	@Override
	public Map<String, Object> selectRoomById(int roomNo){
		Room room = mapper.selectRoomById(roomNo);
		List<RoomTheme> roomTheme = mapper.selectRoomThemeById(roomNo);
		List<RoomImg> roomImg = mapper.selectRoomImgById(roomNo);
		Map<String, Object> responseData = new HashMap<String, Object>();
		responseData.put("room", room);
		responseData.put("roomTheme", roomTheme);
		responseData.put("roomImg", roomImg);
		return responseData;
	}

	@Override
	@Transactional
	public void updateRoom(Room room, MultipartFile[] upfile) {
		List<RoomImg> roomImg = mapper.selectRoomImgById(room.getRoomNo());
		// log.info("S-room = {} \n S-upfile = {}", room, upfile);
		// log.info("roomImg = {}", roomImg);
		mapper.updateRoom(room); // 바뀐 숙소 정보 update 
		mapper.deleteRoomTheme(room.getRoomNo()); // 기존 숙소 테마 delete
		for(int i = 0; i < room.getRoomThemeNo().length; i++) {
			RoomTheme rt = new RoomTheme();
			rt.setRoomNo(room.getRoomNo());
			rt.setThemeNo(room.getRoomThemeNo()[i]);
			mapper.updateRoomTheme(rt); // 바뀐 숙소 테마 있는대로 insert
		}
		for(int i = 0; i < upfile.length; i++) {
			if(!"".equals(upfile[i].getOriginalFilename())) {
				RoomImg ri = new RoomImg();
				String originName = upfile[i].getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf("."));
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int randomNum = (int)(Math.random() * 9000) + 1000;
				String fileName = "ATT_JH_";
				String changeName = fileName + currentTime + "_" + randomNum + ext;
				String savePath = context.getRealPath("/resources/room_upload_files/");
				try {
					upfile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				ri.setRoomNo(room.getRoomNo());
				ri.setOriginName(originName);
				ri.setChangeName("/resources/room_upload_files/" + changeName);
				ri.setFileLevel(i + 1);
				mapper.updateRoomImage(ri); // 수정 할 image 있는대로 update
				if(!(roomImg.get(i).getChangeName() == null)) {
					try {
						new File(context.getRealPath(roomImg.get(i).getChangeName())).delete();
					} catch(RuntimeException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@Override
	public void deleteRoom(Room room, String check) {
		if(!"삭제하겠습니다.".equals(check)) {
			return;
		}
		List<RoomImg> roomImg = mapper.selectRoomImgById(room.getRoomNo());
		int result = mapper.deleteRoom(room);
		if(result > 0) {
			for(int i = 0; i < roomImg.size(); i++) {
				if(!(roomImg.get(i).getChangeName() == null)) {
					try {
						new File(context.getRealPath(roomImg.get(i).getChangeName())).delete();
					} catch(RuntimeException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

}
