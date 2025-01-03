package com.kh.AllThatTrip.admin.model.service;

import org.springframework.stereotype.Component;

import com.kh.AllThatTrip.admin.model.dao.AdminMapper;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.exception.UserFoundException;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AdminValidator {
	private final AdminMapper mapper;
	
	
	public Admin validateAdminExists(Admin admin) {
		Admin existingAdmin = mapper.adLogin(admin);
		if(existingAdmin != null) {
			return existingAdmin;
		}
		throw new UserFoundException("존재하지 않는 사용자입니다.");
	}
}
