<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>정보 수정</title>
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
  <c:if test="${ not empty alertMsg }">
    <script>
			alertify.alert('AllThatTrip', '${alertMsg}', function(){alertify.success('확인')});
		</script>
		<c:remove var="alertMsg" scope="session" />
  </c:if>

<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
<script>
  $(function(){
  			// 비밀번호 입력 확인
        const $userPwd = $('#userPwd');
			const $pwdCheckResult = $('#pwd-check-result');
			const $userPwdCk = $('#userPwdCk');
			const $pwdCheckResult2 = $('#pwd-check-result-2');
			
			$userPwd.keyup(function(){
				if($userPwd.val().length < 6 || $userPwd.val().length > 20){
					$pwdCheckResult.show().css('color', 'crimson').text('6자 이상 20자 이하로 입력해주세요.');
				} else {
					$pwdCheckResult.show().css('color', 'green').text('사용 가능한 비밀번호입니다.');
				}
			});
					
			$userPwdCk.keyup(function(){
				if($userPwd.val() === $userPwdCk.val() && $userPwd.val().length > 0){
					$pwdCheckResult2.show().css('color', 'green').text('비밀번호가 일치합니다.');
				} else {
					$pwdCheckResult2.show().css('color', 'crimson').text('똑같은 비밀번호를 입력해주세요.');
				}
			});
    })
</script>

<div class="container" id="wrap">
  <h2>내 정보 수정</h2>
  <br><br>

  <form action="memberUpdate.me" method="post" id="join-form">
    <div class="form-group">
      <label>ID: <span style="color: orangered;">변경불가</span></label>
      <input type="id" class="form-control" id="userId" placeholder="6 - 20자 영문, 숫자 입력" value="${ sessionScope.loginUser.userId }" name="userId" readonly>
      <div id="check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>

    <div class="form-group">
      <label>변경할 비밀번호: </label>
      <input type="password" class="form-control" id="userPwd" placeholder="6 - 20자 영문, 숫자, 특수문자 입력" name="userPwd" required>
      <div id="pwd-check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>
    <div class="form-group">
        <label>비밀번호 확인:</label>
        <input type="password" class="form-control" id="userPwdCk" placeholder="비밀번호를 똑같이 입력해주세요" >
        <div id="pwd-check-result-2" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>

    <div class="form-group">
        <label>이름:</label>
        <input type="name" class="form-control" id="userName" value="${ sessionScope.loginUser.userName }" name="userName" required>
    </div>

    <div class="form-group">
        <label style="display: block;">Email:</label>
        <input type="text" class="form-control" id="email-id" name="email" placeholder="@를 포함해서 입력해주세요" value="${ sessionScope.loginUser.email }" required>
    </div>

    <div class="form-group">
        <label>휴대폰 번호를 입력 해주세요</label>
        <input type="phone" class="form-control" placeholder="010-1234-4567" id="phone" name="phone" value="${ sessionScope.loginUser.phone }" required>
        <br>
        <button onclick="showCheckDiv();" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68);" type="button" class="btn btn-primary">인증번호 전송</button>
    </div>
    
    <div class="form-group" style="display:none" id="phone-ck-div">
        <label>인증번호를 입력 해주세요</label>
        <input type="text" class="form-control" id="phone-ck" placeholder="인증번호 입력 / 아무 숫자나 입력하면 인증 됩니다">
        <br>
        <button type="button" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68);" class="btn btn-primary" id="phone-ck-btn2">확인</button>
    </div>


    <div class="form-group form-check">
        <br>
      <label class="form-check-label" style="margin-left: 200px;">
        <input onclick="getSpamCk" type="checkbox" style="accent-color:rgb(50, 96, 68);" id="spam" name="spam" value="1" checked> SMS, Email로 상품 및 이벤트 정보 받기(선택)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </label>
      <br><br>
    </div>

    <button type="submit" class="btn btn-primary" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68); width: 770px; height: 60px;">수정 완료</button>
  </form>
  
</div>

<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
</div>





</body>
</html>

<script> 

    function showCheckDiv(){
    	document.getElementById('phone-ck-div').removeAttribute('style');
    	
    }





</script>