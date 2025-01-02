<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원가입 페이지 입니다.</title>
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


<div class="container" id="wrap">
  <h2>회원가입</h2><br><br>

	<script>
	
		// Ajax ID 중복체크
		$(function(){
			const $idInput = $('#userId');
			const $checkResult = $('#check-result');
			$idInput.keyup(function(){
				if($idInput.val().length > 5 && $idInput.val().length < 21){
					$.ajax({
						url : 'idcheck',
						type : 'get',
						data : {
							userId : $idInput.val()
						},
						success : function(result){
							if(result > 0){
								$checkResult.show().css('color', 'crimson').text('중복된 아이디입니다.');
							} else if($idInput.val().includes('admin')){
								$checkResult.show().css('color', 'crimson').text('ID에 "admin"을 포함할 수 없습니다.')
							} else {
								$checkResult.show().css('color', 'green').text('사용 가능한 아이디입니다.');
							}
						}
					});
				} else {
					$checkResult.show().css('color', 'crimson').text('아이디는 6자 이상 20자 이하로 입력해주세요(공백문자, 특수문자X)');
				}
			});
		})
	
		
		// 비밀번호 입력 확인
		$(function(){
			const $userPwd = $('#userPwd');
			const $userPwdCk = $('#userPwdCk');
			const $pwdCheckResult = $('#pwd-check-result');
			const $pwdCheckResult2 = $('#pwd-check-result2');
			
			$pwdCheckResult.keyup(function(){
				if($userPwd.val().length < 6 || $userPwd.val().length > 20){
					$pwdCheckResult.show().css('color', 'crimson').text('6자 이상 20자 이하로 입력해주세요');
					
					
				}
				
				
	
			});
		})
	 
	
	</script>

  <form action="join.me" method="post" id="join-form">
    <div class="form-group">
      <label>사용하실 아이디를 입력 해주세요 / 반드시 모든 항목을 작성하셔야 합니다.</label>
      <input type="id" class="form-control" id="userId" placeholder="6 - 20자 영문, 숫자 입력" value="" name="userId" required>
      <div id="check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>
    <div class="form-group">
      <label>사용하실 비밀번호를 입력 해주세요</label>
      <input type="password" class="form-control" id="userPwd" placeholder="6 - 20자 영문, 숫자, 특수문자 입력" name="userPwd" required>
      <div id="pwd-check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>
    <div class="form-group">
        <label>비밀번호 확인</label>
        <input type="password" class="form-control" id="userPwdCk" placeholder="비밀번호를 똑같이 입력해주세요" >
        <div id="pwd-check-result2" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>
    <div class="form-group">
        <label>이름을 입력 해주세요</label>
        <input type="name" class="form-control" id="userName" placeholder="입력" name="userName" required>
    </div>

    <div class="form-group">
        <label style="display:block;">Email을 입력 해주세요</label>
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
        <input type="text" class="form-control" placeholder="- 없이 입력" id="phone" name="phone" required>
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
      <label class="form-check-label" style="margin-left: 100px;">
        <input onclick="getSpamCk" type="checkbox" id="spam" name="spam" value="1" checked> SMS, Email로 상품 및 이벤트 정보 받기(선택)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </label>
      <label class="form-check-label">
        <input type="checkbox" required> 14세 이상입니다
      </label>
      <br><br>
    </div>

    <button onclick="submitBtn();" type="submit" class="btn btn-primary" style="width: 770px; height: 60px;">회원가입 완료</button>
  </form>
  
</div>
<div style="margin-left:360px">
<!-- <jsp:include page="/WEB-INF/views/common/include/footer.jsp" /> -->
</div>

</body>
</html>

<script> 
	// 인증번호 입력칸 표시
    function showCheckDiv(){
    	document.getElementById('phone-ck-div').removeAttribute('style');
    }
	
	// form요청 제출 시
	
    function submitBtn(){
		let emailId = document.getElementById('email-id').value;
	    let domain = document.getElementById('domain').value;
	    let email = emailId + domain;
	    document.getElementById('email').value = email; 
    }
	
	




</script>