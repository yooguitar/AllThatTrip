<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/style_header.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css"/>
    
    <title>Nav Bar</title>
  </head>

  <body>
    <nav class="navbar">
      <div class="navbar__logo">
        <a class=aTag href="common/main" id="h-logo"><img src="resources/img/logo/ATTP.png"></a>
      </div>
      <div id=navi>
        <ul id="navbar">
          <li><a href="#">Camp</a>
            <ul>
              <li><a class=aTag style = color:#ebebeb; href="#">오토캠핑장</a></li>
              
              <li><a class=aTag style = color:#ebebeb; href="#">글램핑</a></li>
              
              <li><a class=aTag style = color:#ebebeb; href="#">카라반</a></li>

              <li><a class=aTag style = color:#ebebeb; href="#">펜션</a></li>

          </ul></li>
          </li>
          <li><a class=aTag href="#">테마검색</a></li>
              
          <li><a class=aTag href="#">커뮤니티</a>
              <ul>
                  <li><a class=aTag style = color:#ebebeb; href="#">블록시스템</a></li>
                  
                  <li><a class=aTag style = color:#ebebeb; href="#">프로젝트관리</a></li>
                  
                  <li><a class=aTag style = color:#ebebeb; href="#">다운로드</a></li>
              </ul>
          </li>
          <li><a href="#">AllThatTrip!</a>
              <ul >
                  <li><a class=aTag style = color:#ebebeb; href="#">예약내역</a></li>
                  
                  <li><a class=aTag style = color:#ebebeb; href="#">장바구니</a></li>
                  
                  <li><a class=aTag style = color:#ebebeb; href="#">찜하기</a></li>

                  <li><a class=aTag style = color:#ebebeb; href="#">이벤트</a></li>

              </ul>
          </li>
          <li><a class=aTag  href="#">추천맛집</a></li>

      </ul>
    </div>
      <ul class="navbar__icons">
        <li><i class="fab fa-google"></i></li>
        <li><i class="fab fa-slack"></i></li>
      </ul>
      
      <c:choose>
      	<c:when test="${ sessionScope.loginUser eq null }">
	      <div class="login">
	        <a href="/att/loginPage.me" id="login_icon"><img src="resources/img/logo/ico_user_white.svg"></a>
	      </div>
	    </c:when>
	    <c:otherwise>
	      <div class="login">
	        <label style="color:white; font-size:15px;">💡</label>
	        <a onclick="logout();" href="#" id="login_icon"><img src="resources/img/logo/ico_user_white.svg"></a>
	      </div>
	    </c:otherwise>  
      </c:choose>

    </nav>
  </body>
  

<script>
function logout(){
	const logoutLink = document.getElementById('logoutLink');
	
	alertify.confirm("로그아웃 하시겠어요?",
			  function(){
			    alertify.success('예');
			    location.href = "/att/logout.me";
			  },
			  function(){
			    alertify.error('아니오');
			  });
}


</script>  

</html>