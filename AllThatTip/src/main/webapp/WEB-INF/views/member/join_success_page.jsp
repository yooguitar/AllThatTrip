<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        #wrap{
            border : 1px solid rgba(0,0,0,0.2);
            border-radius: 5px;
            width: 900px;
            height: 700px;
            margin: auto;
            margin-top: 50px;
        }
        .btn-light{
            width: 280px;
            height: 70px;
            margin: 20px;
            font-weight: 800;
            font-size: large;
        }
        #btn-area{
            margin-left: 135px;
        }

    </style>
</head>
<body>
	<!-- <jsp:include page="/WEB-INF/views/common/include/header.jsp" /> -->

    <div id="wrap">

        <h2 style="margin-left: 350px; margin-top: 80px;">회원가입 완료</h2>
        <br><br><br>

        <img src="https://item.kakaocdn.net/do/039204d96618ee90c045a5ab348be9798f324a0b9c48f77dbce3a43bd11ce785" style="margin-left: 350px;" alt="축하곰이미지"/>
        <h5 style="margin-left: 410px;">환영합니다!</h5>
        <br><br>
        
        <div id="btn-area">
            <a href="loginPage.me" class="btn btn-light">로그인 하러가기</a>
            <a href="attHome.me" class="btn btn-light">메인으로</a>
        </div>
        
    </div>
    <!-- <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />-->

</body>


</html>