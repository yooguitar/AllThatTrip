package com.kh.AllThatTrip.admin.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.AllThatTrip.admin.model.dao.AdminMapper;
import com.kh.AllThatTrip.exception.BoardNotFoundException;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdServiceImpl implements AdService{

	private final AdminMapper mapper;


	private int getTotalCount() {
		int totalCount = mapper.selectTotalCount();

		if(totalCount == 0) {
			throw new BoardNotFoundException("게시글이 없습니다");
		}
		return totalCount;
	}


	@Override
	public Map<String, Object> selectAdNoticeList(int currentPage) {
		return null;
	}
}