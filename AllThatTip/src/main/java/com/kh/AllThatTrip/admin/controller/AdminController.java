package com.kh.AllThatTrip.admin.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdService adService;
	private final ModelAndViewUtil mv;

}
