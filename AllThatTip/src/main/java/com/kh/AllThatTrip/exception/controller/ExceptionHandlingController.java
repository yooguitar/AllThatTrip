package com.kh.AllThatTrip.exception.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.exception.BoardNoValueException;
import com.kh.AllThatTrip.exception.BoardNotFoundException;
import com.kh.AllThatTrip.exception.FailToFileUploadException;
import com.kh.AllThatTrip.exception.UserIdNotFoundException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class ExceptionHandlingController {
	
	private ModelAndView createErrorResponse(String errorMsg, Exception e) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMsg", errorMsg).setViewName("common/error_page");
		log.info("발생 예외 : {}", e.getMessage(), e);
		return mv;
	}
	
	
	@ExceptionHandler(UserIdNotFoundException.class)
	protected ModelAndView NoSuchUserIdError(UserIdNotFoundException e) {
		return createErrorResponse("아이디가 존재하지 않습니다.", e);
	}
	
	// 게시글이 없을 때
	protected ModelAndView NoSuchBoardError(BoardNotFoundException e) {
		return createErrorResponse("게시글이 존재하지 않습니다.", e);
	}
	
	protected ModelAndView BoardNoValueError(BoardNoValueException e) {
		return createErrorResponse("필수 사항을 입력해주세요.", e);
	}
	
	@ExceptionHandler(FailToFileUploadException.class)
	protected ModelAndView failToFileUpload(FailToFileUploadException e) {
		return createErrorResponse("파일업로드에 실패했습니다", e);
	}
	
	
	
	

}
