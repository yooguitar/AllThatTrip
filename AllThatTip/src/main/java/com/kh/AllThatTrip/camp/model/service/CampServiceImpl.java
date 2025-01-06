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
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.camp.model.dao.CampMapper;
import com.kh.AllThatTrip.camp.model.vo.Camp;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CampServiceImpl implements CampService {
	
	private final CampMapper mapper;
	private final ServletContext context;

	@Override
	public void insertCamp(Camp camp, MultipartFile upfile) {
		String originName = upfile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randomNum = (int)(Math.random() * 9000) + 1000;
		String fileName = "ATT_JH_";
		String changeName = fileName + currentTime + "_" + randomNum + ext;
		String savePath = context.getRealPath("/resources/upload_files/");
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		camp.setOriginName(originName);
		camp.setChangeName("/resources/upload_files/" + changeName);
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
	public Map<String, Object> selectCampById(Long campNo) {
		Camp camp = mapper.selectCampById(campNo);
		Map<String, Object> responseData = new HashMap<String, Object>();
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
			String savePath = context.getRealPath("/resources/upload_files/");
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			camp.setOriginName(originName);
			camp.setChangeName("/resources/upload_files/" + changeName);
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

}
