package com.kh.AllThatTrip.admin.model.service;

public class AdServiceImpl {

	private final AdminMapper mapper;


	private int getTotalCount() {
		int totalCount = mapper.selectTotalCount();

		if(totalCount == 0) {
			throw new BoardNotFoundException("게시글이 없습니다");
		}
		return totalCount;
	}
}