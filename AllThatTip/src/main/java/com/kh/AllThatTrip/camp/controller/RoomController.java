package com.kh.AllThatTrip.camp.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.camp.model.service.RoomService;
import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("rooms")
@RequiredArgsConstructor
public class RoomController {

	private final RoomService roomService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("insert_form")
	public ModelAndView forwardRoomInsertForm() {
		return mv.setViewNameAndData("room/room_insert_form", null);
	}
	
	@PostMapping("insert")
	public ModelAndView insertRoom(Room room, MultipartFile[] upfile) {
		// log.info("room : {} / upfile : {}", room, upfile);
		roomService.insertRoom(room, upfile);
		return mv.setViewNameAndData("redirect:/", null);
	}
	
	@GetMapping("list")
	public ModelAndView selectRoomList() {
		Map<String, Object> responseData = roomService.selectRoomList();
		// log.info("responseData : {}", responseData);
		return mv.setViewNameAndData("room/room_list", responseData);
	}
	
	@GetMapping("detail")
	public ModelAndView selectRoomById(int roomNo) {
		Map<String, Object> responseData = roomService.selectRoomById(roomNo);
		// log.info("{}", responseData);
		return mv.setViewNameAndData("room/room_detail", responseData);
	}
	
	@GetMapping("update_form")
	public ModelAndView forwardRoomUpdateForm(int roomNo) {
		Map<String, Object> responseData = roomService.selectRoomById(roomNo);
		return mv.setViewNameAndData("room/room_update_form", responseData);
	}
	
	@PostMapping("update")
	public ModelAndView updateRoom(Room room, MultipartFile[] upfile) {
		// log.info("C-room = {} \n C-upfile = {}", room, upfile);
		roomService.updateRoom(room, upfile);
		return mv.setViewNameAndData("redirect:/rooms/detail?roomNo=" + room.getRoomNo(), null);
	}
	
	@PostMapping("delete")
	public ModelAndView deleteRoom(Room room, String check) {
		roomService.deleteRoom(room, check);
		return mv.setViewNameAndData("redirect:/rooms/list", null);
	}
	
}
