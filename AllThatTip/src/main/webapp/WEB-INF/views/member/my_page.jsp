<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>내 정보</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <style>
    #wrap{
        width: 800px;
        margin-top: 50px;
        margin-bottom: 100px;
    }

  </style>
</head>
<body>

<!--<jsp:include page="/WEB-INF/views/common/include/header.jsp" /> -->

<div class="container" id="wrap">
  <h2>내 정보</h2>
  <br><label>가입일: <fmt:formatDate value="${ sessionScope.loginUser.enrollDate }" pattern="yyyy-MM-dd" /></label>
  <br><br>

  <form action="join.me" method="post" id="join-form">
    <div class="form-group">
      <label>ID:</label>
      <input type="id" class="form-control" id="userId" placeholder="6 - 20자 영문, 숫자 입력" value="${ sessionScope.loginUser.userId }" name="userId" readonly>
      <div id="check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>
    <div class="form-group">
      <label>Password:</label>
      <input type="password" class="form-control" id="userPwd" placeholder="6 - 20자 영문, 숫자, 특수문자 입력" value="${ sessionScope.loginUser.userPwd }" name="userPwd" required>
      <div id="pwd-check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>

    <div class="form-group">
        <label>이름 (변경은 전화문의 바랍니다.)</label>
        <input type="name" class="form-control" id="userName" value="${ sessionScope.loginUser.userName }" name="userName" readonly>
    </div>

    <div class="form-group">
        <label style="display: block;">Email</label>
        <input type="text" class="form-control" id="email-id" placeholder="영문, 숫자 입력" style="width: 377px; display: inline;" required>

        <p style="display: inline;">&nbsp;@&nbsp;</p>

        <select style="width: 360px; display: inline; margin-top: 10px;" class="custom-select mb-3" id="domain" required>
            <option selected>선택</option>
            <option value="">직접 입력</option>
            <option value="@kh.com">kh.com</option>
            <option value="@google.com">google.com</option>
            <option value="@naver.com">naver.com</option>
            <option value="@daum.net">daum.net</option>
        </select>
        
        <!-- 진짜 양식이 전송 될 input -->
        <input type="text" id="email" style="display: none;" name="email">

    </div>

    <div class="form-group">
        <label>휴대폰 번호를 입력 해주세요</label>
        <input type="phone" class="form-control" placeholder="010-1234-4567" id="phone" name="phone" value="${ sessionScope.loginUser.phone }" required>
        <br>
        <button onclick="showCheckDiv();" type="button" class="btn btn-primary">인증번호 전송</button>
    </div>
    
    <div class="form-group" style="display:none" id="phone-ck-div">
        <label>인증번호를 입력 해주세요</label>
        <input type="text" class="form-control" id="phone-ck" placeholder="인증번호 입력 / 아무 숫자나 입력하면 인증 됩니다">
        <br>
        <button type="button" class="btn btn-primary" id="phone-ck-btn2">확인</button>
    </div>


    <div class="form-group form-check">
        <br>
      <label class="form-check-label" style="margin-left: 200px;">
        <input onclick="getSpamCk" type="checkbox" id="spam" name="spam" value="1" checked> SMS, Email로 상품 및 이벤트 정보 받기(선택)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </label>
      <br><br>
    </div>

    <button onclick="submitBtn();" type="submit" class="btn btn-primary" style="width: 770px; height: 60px;">수정 완료</button>
  </form>
  
</div>
<div style="margin-left:360px">
<!-- <jsp:include page="/WEB-INF/views/common/include/footer.jsp" /> -->
</div>





</body>
</html>

<script> 
    function showCheckDiv(){
    	document.getElementById('phone-ck-div').removeAttribute('style');
    	
    }
    
    function submitBtn(){
        // 1. #email에 #email-id, #domain 내용 합쳐서 전송
        const emailId = document.getElementById('email-id').value;
        const domain = document.getElementById('domain').value;
        var email = document.getElementById('email').value = emailId + domain;

    }




</script>