<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원가입 페이지 입니다.</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <style>
    #wrap{
        width: 800px;
        margin-top: 50px;
        margin-bottom: 100px;
    }

  </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

<div class="container" id="wrap">
  <h2>사업자 회원가입</h2><br><br>

	<script>
		// Ajax ID 중복체크 
		$(function(){
			const $idInput = $('#userId');
			const $checkResult = $('#check-result');
			$idInput.keyup(function(){
				if(
					$idInput.val().length > 5 && $idInput.val().length < 21
					){
					$.ajax({
						url : 'idcheck',
						type : 'get',
						data :{
							userId : $idInput.val()
						},
						success : function(result){
							if(result > 0){
								$checkResult.show().css('color', 'crimson').text('중복된 아이디입니다.');
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
				
				
				/*
				if($userPwd === $userPwdCk){
					$pwdCheckResult.show().css('color', 'green').text('확인되었습니다.');	
				} else {
					$pwdCheckResult.show().css('color', 'crimson').text('똑같은 비밀번호를 입력해주세요.');	
				}
				*/
			});
		})
	 
	
	</script>

  <form action="biz-join.me" method="post" id="join-form">
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
        <label style="display: block;">Email을 입력 해주세요</label>
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
        <input type="phone" class="form-control" placeholder="- 없이 입력" id="phone" name="phone" required>
        <br>
        <button onclick="showCheckDiv();" type="button" class="btn btn-primary">인증번호 전송</button>
    </div>
    
    <div class="form-group" style="display:none" id="phone-ck-div">
        <label>인증번호를 입력 해주세요</label>
        <input type="text" class="form-control" id="phone-ck" placeholder="인증번호 입력 / 아무 숫자나 입력하면 인증 됩니다">
        <br>
        <button type="button" class="btn btn-primary" id="phone-ck-btn2">확인</button>
    </div>

    <br><hr style="border: 1px dotted; color:rgba(0,0,0,0.2);"><br>

    <div class="form-group">
        <label>상호명을 입력해주세요</label>
        <input type="text" class="form-control" id="bizName" placeholder="입력" required>
    </div>
    <p>사업자 등록증을 첨부해주세요 <span style="font-weight: 700; color: orangered;">(필수)</span></p>
    <div class="custom-file mb-3">
        <input type="file" class="custom-file-input" id="customFile" name="filename">
        <label class="custom-file-label" for="customFile">이미지 첨부</label>
      </div>
    
      <br><br><br>


    <div class="form-group form-check" style="display: none;">
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
<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
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

    $(".custom-file-input").on("change", function() {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
    </script>



</script>