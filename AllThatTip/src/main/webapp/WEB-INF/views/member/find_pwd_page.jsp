<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>비밀번호 찾기</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css"/>
    
    <style>
    	#upper-div{
    		width:1200px;
    		height:150px;
    		margin:auto;
    	}
    	#lower-div{
    		width:1200px;
    		margin:auto;
    	}
    	#login-bg{
    		width:1200px;
    		height:700px;
    		margin:auto;
    	}
        #wrap{
            border : 1px solid rgba(0,0,0,0.2);
            border-radius: 5px;
            width: 500px;
            height: 700px;
            margin: auto;
            margin-top: 150px;
            margin-bottom: 100px;
        }
        .title-join-biz{
            text-align: center;
        }
		
    </style>
</head>
<body>
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
        <br>
        <h2 class="title-join-biz">비밀번호 찾기</h2>
        <br>
        <p style="color: orangered;">**비밀번호 변경을 위해 찾으시는 ID의 정보를 입력해주세요.</p>
        <form action="findPwd.me" method="post">
            <div class="form-group">
                <label>아이디를 입력 해주세요 / 반드시 모든 항목을 작성하셔야 합니다.</label>
                <input type="id" class="form-control" id="userId" placeholder="6 - 20자 영문, 숫자 입력" value="" name="userId" required>
                <div id="check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
              </div>
            <div class="form-group">
                <label style="display: block;">Email:</label>
                <input type="text" class="form-control" id="email-id" name="email" placeholder="@를 포함해서 입력해주세요" value="${ sessionScope.loginUser.email }" required>
            </div>
            <div class="form-group">
                <label>변경하실 비밀번호를 입력 해주세요</label>
                <input type="password" class="form-control" id="userPwd" placeholder="6 - 20자 영문, 숫자, 특수문자 입력" name="userPwd" required>
                <div id="pwd-check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
              </div>
              <div class="form-group">
                  <label>비밀번호 확인</label>
                  <input type="password" class="form-control" id="userPwdCk" placeholder="비밀번호를 똑같이 입력해주세요" >
                  <div id="pwd-check-result-2" style="font-size:0.9em; display:none; margin:10px;"></div>
              </div>
           
            <button type="submit" class="btn btn-primary" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68); width: 470px; height: 50px; margin-top: 10px;">변경완료</button>
        </form>
        
        <br>
        <label class="title-join-biz" style="display: block; color: rgb(33, 37, 41);">아직 회원이 아니신가요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/att/joinPage.me" style="color:rgb(50, 96, 68);">회원가입</a><br>
        </label>
        <br>
    
        
    </div>
    
    <br>
   
    
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
    
</body>


</html>