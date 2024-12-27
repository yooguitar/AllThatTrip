<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/att/resources/css/style_header.css">
    <title>Nav Bar</title>
  </head>

  <body>
    <nav class="navbar">

      <div class="navbar__logo">
        <a class=aTag href="#" id="h-logo"><img src="/att/resources/img/logo/ATTP.png"></a>
      </div>
      <div id=navi>
        <ul id="navbar">
          <li><a href="#">Camp</a>
            <ul>
              <li><a class=aTag style = color:#ebebeb; href="#">오토캠핑장</a></li>
              
              <li><a class=aTag style = color:#ebebeb; href="#">글램핑</a></li>
              
              <li><a class=aTag style = color:#ebebeb; href="#">카라반</a></li>

              <li><a class=aTag style = color:#ebebeb; href="#">펜션</a></li>

          </ul>
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
	        <a class=aTag  href="/AllThatTrip/loginPage.me" id="login_icon"><img src="/att/resources/img/logo/ico_user_white.svg"></a>
	      </div>
	    </c:when>
	    <c:otherwise>
	      <div class="login">
	        <label style="color:white; font-size:15px;">💡<label>
	        <a class=aTag onclick="" href="redirect:/" id="login_icon"><img src="/att/resources/img/logo/ico_user_white.svg"></a>
	      </div>
	    </c:otherwise>  
      </c:choose>

    </nav>
  </body>
</html>