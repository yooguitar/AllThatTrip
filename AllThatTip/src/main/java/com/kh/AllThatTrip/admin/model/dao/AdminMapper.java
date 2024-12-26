package com.kh.AllThatTrip.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.AllThatTrip.admin.model.vo.AdNotice;

@Mapper
public interface AdminMapper {
	
	int selectTotalCount();

	List<AdNotice> selectAdNoticeList(RowBounds rowBounds);

	void insertAdNotice(AdNotice adNotice);

	int increaseCount(Long ptNo);
	
}
