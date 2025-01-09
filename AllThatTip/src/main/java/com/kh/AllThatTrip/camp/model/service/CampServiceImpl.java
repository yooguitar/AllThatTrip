package com.kh.AllThatTrip.camp.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.camp.model.dao.CampMapper;
import com.kh.AllThatTrip.camp.model.dao.RoomMapper;
import com.kh.AllThatTrip.camp.model.vo.BizMember;
import com.kh.AllThatTrip.camp.model.vo.Camp;
import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.camp.model.vo.RoomImg;
import com.kh.AllThatTrip.common.model.template.Pagination;
import com.kh.AllThatTrip.common.model.vo.PageInfo;
import com.kh.AllThatTrip.exception.LoginFailedException;
import com.kh.AllThatTrip.member.model.service.PasswordEncryptor;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CampServiceImpl implements CampService {
	
	private final CampMapper mapper;
	private final RoomMapper rMapper;
	private final ServletContext context;
	private final PasswordEncryptor passwordEncoder;

	@Override
	public void insertCamp(Camp camp, MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randomNum = (int)(Math.random() * 9000) + 1000;
		String fileName = "ATT_JH_";
		String changeName = fileName + currentTime + "_" + randomNum + ext;
		String savePath = context.getRealPath("/resources/camp_upload_files/");
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		camp.setBizNo(((BizMember)(session.getAttribute("loginUser"))).getBizNo());
		camp.setOriginName(originName);
		camp.setChangeName("/resources/camp_upload_files/" + changeName);
		// log.info("camp : {}", camp);
		mapper.insertCamp(camp);
	}

	@Override
	public Map<String, Object> selectCampList() {
		List<Camp> campList = mapper.selectCampList();
		Map<String, Object> responseData = new HashMap<String, Object>();
		responseData.put("campList", campList);
		return responseData;
	}
	
	@Override
	public Map<String, Object> selectCampListByBizNo(HttpSession session) {
		Long bizNo = ((BizMember)(session.getAttribute("loginUser"))).getBizNo();
		List<Camp> campList = mapper.selectCampListByBizNo(bizNo);
		Map<String, Object> responseData = new HashMap<String, Object>();
		responseData.put("campList", campList);
		return responseData;
	}

	@Override
	public Map<String, Object> selectCampById(Long campNo) {
		Map<String, Object> responseData = new HashMap<String, Object>();
		Camp camp = mapper.selectCampById(campNo);
		List<Room> roomList = rMapper.selectRoomListByCampNo(campNo);
		List<RoomImg> roomImgList = rMapper.selectRoomImgListByCampNo(campNo);
		responseData.put("roomList", roomList);
		responseData.put("roomImgList", roomImgList);
		responseData.put("camp", camp);
		return responseData;
	}

	@Override
	public void updateCamp(Camp camp, MultipartFile upfile) {
		if(!"".equals(upfile.getOriginalFilename())) {
			if(!(camp.getChangeName() == null)) {
				try {
					new File(context.getRealPath(camp.getChangeName())).delete();
				} catch(RuntimeException e) {
					e.printStackTrace();
				}
			}
			String originName = upfile.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int randomNum = (int)(Math.random() * 9000) + 1000;
			String fileName = "ATT_JH_";
			String changeName = fileName + currentTime + "_" + randomNum + ext;
			String savePath = context.getRealPath("/resources/camp_upload_files/");
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			camp.setOriginName(originName);
			camp.setChangeName("/resources/camp_upload_files/" + changeName);
		}
		mapper.updateCamp(camp);
	}
	
	@Override
	public void deleteCamp(Camp camp, String check) {
		if(!"삭제하겠습니다.".equals(check)) {
			return;
		}
		int result = mapper.deleteCamp(camp);
		if(result > 0) {
			if(!(camp.getChangeName() == null)) {
				try {
					new File(context.getRealPath(camp.getChangeName())).delete();
				} catch(RuntimeException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public BizMember bizLogin(Member member, HttpSession session) {
		BizMember loginBiz = mapper.bizLogin(member);
		// log.info("{}", loginBiz);
		if(loginBiz == null) {
			throw new LoginFailedException("아이디 없음");
		}
		if(!(passwordEncoder.matches(member.getUserPwd(), loginBiz.getUserPwd()))) {
			throw new LoginFailedException("비밀번호 불일치");
		}
		return loginBiz;
	}

	@Override
	public Map<String, Object> searchCamp(String keyword) {
		Map<String, Object> responseData = new HashMap<String, Object>();
		List<Camp> campList = mapper.searchCamp(keyword);
		responseData.put("campList", campList);
		return responseData;
	}
	
	@Override
	public List<Camp> recentList() {
		return mapper.recentList();
	}

	@Override
	public Map<String, Object> searchCampsByAddr(String addr, int page) {
		Map<String, Object> responseData = new HashMap<String, Object>();
		int totalCount = mapper.countList(addr);
		// log.info("{}", totalCount);
		responseData.put("count", totalCount);
		PageInfo pi = Pagination.getPageInfo(totalCount, page, 6, 10);
		responseData.put("pi", pi);
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Camp> campList = mapper.searchCampsByAddr(addr, rowBounds);
		// log.info("{}", campList);
		responseData.put("campList", campList);
		return responseData;
	}

}
