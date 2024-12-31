package com.kh.AllThatTrip.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.AllThatTrip.admin.model.vo.AdNotice;
import com.kh.AllThatTrip.admin.model.vo.Admin;

@Mapper
public interface AdminMapper {
	
	int selectTotalCount();

	List<AdNotice> selectAdNoticeList(RowBounds rowBounds);

	void insertAdNotice(AdNotice adNotice);

	int increaseCount(Long adNoticeNo);

	AdNotice selectById(Long adNoticeNo);

	int updateAdNotice(AdNotice adNotice);

	int deleteAdNotice(Long adNoticeNo);

	Admin login(Admin admin);

	
	
}
