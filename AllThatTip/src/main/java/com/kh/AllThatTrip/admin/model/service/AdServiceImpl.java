package com.kh.AllThatTrip.admin.model.service;

import java.io.File;
import java.io.IOException;
import java.security.InvalidParameterException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.admin.model.dao.AdminMapper;
import com.kh.AllThatTrip.admin.model.vo.AdNotice;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.common.model.template.Pagination;
import com.kh.AllThatTrip.common.model.vo.PageInfo;
import com.kh.AllThatTrip.exception.BoardNoValueException;
import com.kh.AllThatTrip.exception.BoardNotFoundException;
import com.kh.AllThatTrip.exception.FailToFileUploadException;
import com.kh.AllThatTrip.member.model.service.MemberValidator;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdServiceImpl implements AdService{

	private final AdminMapper mapper;
	private final ServletContext context;


	private int getTotalCount() {
		int totalCount = mapper.selectTotalCount();
		if(totalCount == 0) {
			throw new BoardNotFoundException("게시글이 없습니다");
		}
		return totalCount;
	}

	private PageInfo getPageInfo(int totalCount, int page) {
		return Pagination.getPageInfo(totalCount, page, 10, 10);
	}

	private List<AdNotice> getAdNoticeList(PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return mapper.selectAdNoticeList(rowBounds);
	}

	@Override
	public Map<String, Object> selectAdNoticeList(int currentPage) {
		int totalCount = getTotalCount();
		PageInfo pi = getPageInfo(totalCount, currentPage);
		List<AdNotice> adNotices = getAdNoticeList(pi);

		Map<String, Object>map = new HashMap();
		map.put("adNotices",adNotices);
		map.put("pageInfo", pi);

		return map;
	}

	@Override
	public void insertAdNotice(AdNotice adNotice, MultipartFile upfile) {
		validateAdNotice(adNotice);

		if(!("".equals(upfile.getOriginalFilename())))	{
			handleFileUpload(adNotice,upfile);
		}
		mapper.insertAdNotice(adNotice);

	}

	private void handleFileUpload(AdNotice adNotice, MultipartFile upfile) {
		String fileName = upfile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randomNum = (int)(Math.random() * 90000) + 10000;
		String changeName = currentTime + randomNum + ext;

		String savePath = context.getRealPath("/resources/upload_files/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			throw new FailToFileUploadException("파일이 업로드 되지 않았습니다.");
		}
		// 첨부파일이 존재했다 => 업로드 + Board객체에 originName + changeName
		adNotice.setAdOriName(fileName);
		adNotice.setAdChaName("/att/resources/upload_files/" + changeName);
	}

	private void validateAdNotice(AdNotice adNotice ) {
		if(adNotice == null ||
				adNotice.getAdNoticeTitle() == null || adNotice.getAdNoticeTitle().trim().isEmpty() ||	
				adNotice.getAdNoticeContent() == null || adNotice.getAdNoticeContent().trim().isEmpty() ||	
				adNotice.getAdWriter() == null || adNotice.getAdWriter().trim().isEmpty()) {
			throw new BoardNoValueException("입력값이 부적절합니다.");
		}



		String adNoticeTitle = escapeHtml(adNotice.getAdNoticeTitle());
		String adNoticeContent = escapeHtml(adNotice.getAdNoticeContent());
		adNotice.setAdNoticeTitle(convertNewlineToBr(adNoticeTitle));
		adNotice.setAdNoticeContent(convertNewlineToBr(adNoticeContent));
	}

	private String escapeHtml(String value) {
		return value.replaceAll("<", "&lt")
				.replaceAll(">", "&gt");
	}

	private String convertNewlineToBr(String value) {
		return value.replaceAll("\n","<br>");


	}

	private void incrementViewCount(Long  adNoticeNo) {
		int result = mapper.increaseCount( adNoticeNo);
		log.info("{}", result);
		if(result < 1) {
			throw new BoardNotFoundException("게시글이 존재하지 않습니다.");
		}
	}

	private AdNotice findAdNoticeById(Long  adNoticeNo) {
		AdNotice adNotice = mapper.selectById( adNoticeNo);
		if(adNotice == null) {
			throw new BoardNotFoundException("게시글을 찾을 수 없습니다.");
		}
		return adNotice;
	}

	private void validateAdNoticeNo(Long adNoticeNo) {
		if(adNoticeNo == null ||  adNoticeNo <= 0) {
			throw new InvalidParameterException("유효하지 않은 게시글 번호입니다.");	
		}
	}

	@Override
	public Map<String, Object> selectById(Long adNoticeNo) {
		validateAdNoticeNo(adNoticeNo);
		incrementViewCount(adNoticeNo);

		AdNotice adNotice = findAdNoticeById(adNoticeNo);
		Map<String, Object> responseData = new HashMap();
		responseData.put("adNotice", adNotice);

		return responseData;

	}

	@Override
	public void updateAdNotice(AdNotice adNotice, MultipartFile upfile) {

		validateAdNoticeNo(adNotice.getAdNoticeNo());
		findAdNoticeById(adNotice.getAdNoticeNo());

		if(!upfile.getOriginalFilename().equals("")) {

			if(adNotice.getAdChaName() != null) {
				new File(context.getRealPath(adNotice.getAdChaName())).delete();
			}

			handleFileUpload(adNotice, upfile);
		}
		int result = mapper.updateAdNotice(adNotice);

		if(result < 1) {
			throw new BoardNotFoundException("업데이트 실패");
		}
	}

	@Override
	public void deleteAdNotice(Long adNoticeNo, String adChaName) {
		validateAdNoticeNo(adNoticeNo);
	    findAdNoticeById(adNoticeNo);
	    
	    int result = mapper.deleteAdNotice(adNoticeNo);
	    
	    if(result <= 0) {
	    	throw new BoardNotFoundException("게시글 삭제 실패");
	    }
	    
	    if(!("".equals(adChaName))) {
	    	try {
	    	new File(context.getRealPath(adChaName)).delete();
	    	} catch(RuntimeException e) {
	    		throw new BoardNotFoundException("파일을 찾을 수 없습니다");
	    	}
	    }
	}

	@Override
	public Admin adLogin(Admin admin) {
		
		Admin loginAdmin = mapper.adLogin(admin);
		
		return loginAdmin;
	}


}