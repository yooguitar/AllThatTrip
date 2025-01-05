<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원탈퇴</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            height: 600px;
            margin: auto;
            margin-top: 50px;
        }
        .title-join-biz{
            text-align: center;
        }
		
    </style>
</head>
<body>
	<!--<jsp:include page="/WEB-INF/views/common/include/header.jsp" /> -->
	
    <div class="container" id="wrap">
        <br>
        <h2 class="title-join-biz">비회원 예약조회</h2>
        <br><br>
        <form action="#" method="post">
            <div class="form-group">
                <label>예약번호를 확인합니다.</label>
                <input type="password" class="form-control" id="" placeholder="입력" name="" required>
            </div>
            <br>
            <button type="submit" class="btn btn-primary" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68); width: 470px; height: 50px;">제출</button>

        </form>
        <br>
        <label class="title-join-biz" style="display: block; color: rgb(33, 37, 41);">회원 이신가요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="/att/loginPage.me" style="color:rgb(50, 96, 68);">로그인 하기</a>
        </label>
        <br>
        <hr><br>
        <pre>
        **예약 번호를 잊으셨나요?
        => 고객센터
        올댓트립 1234-1234
              
        평일: 09:00~18:00
        점심: 12:00~13:00
        (주말, 공휴일 제외)
        </pre>
        
        <c:if test="${ sessionScope.loginValue eq 1 }">
	        <script>
		        alertify
		        .alert("아이디, 비밀번호를 확인해주세요.", function(){
		          alertify.message('확인');
		        });        
	        </script>	
	        <c:remove var="loginValue" scope="session" />
        </c:if>

        

    </div>

   
    
    <!-- <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />-->

</body>


</html>