<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>로그인 페이지 입니다.</title>

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
        #wrap{
            border : 1px solid rgba(0,0,0,0.2);
            border-radius: 5px;
            width: 500px;
            height: 520px;
            margin: auto;
            margin-top: 50px;
        }
        .title-join-biz{
            text-align: center;
        }

    </style>
</head>
<body>
	<!--<jsp:include page="/WEB-INF/views/common/include/header.jsp" />-->
	<!-- include 아직 하면 안됩니다. 스타일 겹쳐요 -->
	
    <div class="container" id="wrap">
        <br>
        <h2 class="title-join-biz">로그인</h2>
        <br>
        <form action="login.me" method="post">
            <div class="form-group">
                <label>ID:</label>
                <input type="id" class="form-control" id="userId" placeholder="아이디 입력" name="userId" required>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" class="form-control" id="userPwd" placeholder="비밀번호 입력" name="userPwd" required>
            </div>
            <div class="form-group form-check">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember" checked> 아이디 저장
                </label>
                    <a href="#" style="color: rgb(33, 37, 41); float:right;">아이디 / 비밀번호 찾기</a>
            </div>
            <button type="submit" class="btn btn-primary" style="width: 470px; height: 50px;">로그인</button>
        </form>
        

        <br>
        <label class="title-join-biz" style="display: block; color: rgb(33, 37, 41);">아직 회원이 아니신가요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="/AllThatTrip/joinPage.me">회원가입</a><br>
        </label>
        <br><br>
        <p class="title-join-biz" style="font-size: 12px;">비회원 예약도 가능합니다.</p><br>

    </div>

    <br>
    <label class="title-join-biz" style="display: block; color: rgb(33, 37, 41);">사장님 이신가요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="#">사업자 회원가입</a>
    </label>
    
    <!--<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />-->

</body>


</html>