package com.kh.AllThatTrip.exception.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.exception.BoardNoValueException;
import com.kh.AllThatTrip.exception.BoardNotFoundException;
import com.kh.AllThatTrip.exception.DuplicateKeyException;
import com.kh.AllThatTrip.exception.FailToFileUploadException;
import com.kh.AllThatTrip.exception.InvalidParameterException;
import com.kh.AllThatTrip.exception.UserIdNotFoundException;
import com.kh.AllThatTrip.exception.InValidLengthException;
import com.kh.AllThatTrip.exception.InvalidDomainTypeException;
import com.kh.AllThatTrip.exception.LoginFailedException;
import com.kh.AllThatTrip.exception.UserFoundException;


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
	
	// 게시글이 없을 때
	@ExceptionHandler(BoardNotFoundException.class)
	protected ModelAndView NoSuchBoardError(BoardNotFoundException e) {
		return createErrorResponse("게시글이 존재하지 않습니다.", e);
	}
	
	// 필수 입력사항 누락
	@ExceptionHandler(BoardNoValueException.class)
	protected ModelAndView BoardNoValueError(BoardNoValueException e) {
		return createErrorResponse("필수 사항을 입력해주세요.", e);
	}
	
	// 처리중 오류 발생 시
	@ExceptionHandler(DuplicateKeyException.class)
	protected ModelAndView handleTransactionError(DuplicateKeyException e) {
		return createErrorResponse("잘못된 요청입니다.", e);
	} 
	
	// 파일 업로드 실패
	@ExceptionHandler(FailToFileUploadException.class)
	protected ModelAndView failToFileUploaeException(FailToFileUploadException e) {
		return createErrorResponse("파일 업로드에 실패했습니다." ,e);
	}
	

	@ExceptionHandler(InvalidParameterException.class)
	protected ModelAndView invalidParameter(InvalidParameterException e) {
		return createErrorResponse("유효하지 않은 게시글 번호입니다.", e);

	// 중복 아이디 회원 가입
	@ExceptionHandler(UserFoundException.class)
	protected ModelAndView UserExistError(UserFoundException e) {
		return createErrorResponse("이미 존재하는 아이디입니다.", e);

	}

	// 입력 제한 미달/초과
	@ExceptionHandler(InValidLengthException.class)
	protected ModelAndView InValidLengthException(InValidLengthException e) {
		return createErrorResponse("유효하지 않은 값을 입력하셨습니다.", e);
	}

	// 이메일 입력 형식 오류
	@ExceptionHandler(InvalidDomainTypeException.class)
	protected ModelAndView InvalidDomainTypeException(InvalidDomainTypeException e) {
		return createErrorResponse("올바른 이메일 형식으로 입력해주세요", e);
	}
	
	// 매칭되는 로그인 정보 없음
	@ExceptionHandler(LoginFailedException.class)
	protected ModelAndView LoginFailedException(LoginFailedException e) {
		return createErrorResponse("올바르지 않은 정보 입력", e);
	}
	
}
	
	
	
	
	

