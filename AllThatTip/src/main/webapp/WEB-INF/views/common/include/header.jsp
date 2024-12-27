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
    <title>Nav Bar</title>
  </head>

  <body>
    <nav class="navbar">

      <div class="navbar__logo">
        <a href="#" id="h-logo"><img src="resources/img/logo/ATTP.png"></a>
      </div>
      <div id=navi>
        <ul id="navbar">
          <li><a href="#">Camp</a>
            <ul>
              <li><a style = color:#ebebeb; href="#">오토캠핑장</a></li>
              
              <li><a style = color:#ebebeb; href="#">글램핑</a></li>
              
              <li><a style = color:#ebebeb; href="#">카라반</a></li>

              <li><a style = color:#ebebeb; href="#">펜션</a></li>

          </ul></li>
          </li>
          <li><a href="#">테마검색</a></li>
              
          <li><a href="#">커뮤니티</a>
              <ul>
                  <li><a style = color:#ebebeb; href="#">블록시스템</a></li>
                  
                  <li><a style = color:#ebebeb; href="#">프로젝트관리</a></li>
                  
                  <li><a style = color:#ebebeb; href="#">다운로드</a></li>
              </ul>
          </li>
          <li><a href="#">AllThatTrip!</a>
              <ul >
                  <li><a style = color:#ebebeb; href="#">예약내역</a></li>
                  
                  <li><a style = color:#ebebeb; href="#">장바구니</a></li>
                  
                  <li><a style = color:#ebebeb; href="#">찜하기</a></li>

                  <li><a style = color:#ebebeb; href="#">이벤트</a></li>

              </ul>
          </li>
          <li><a href="#">추천맛집</a></li>

      </ul>
    </div>
      <ul class="navbar__icons">
        <li><i class="fab fa-google"></i></li>
        <li><i class="fab fa-slack"></i></li>
      </ul>
      
      <div class="login">
        <a href="/AllThatTrip/loginPage.me" id="login_icon"><img src="resources/img/logo/ico_user_white.svg"></a>
    </div>

    </nav>
  </body>
</html>