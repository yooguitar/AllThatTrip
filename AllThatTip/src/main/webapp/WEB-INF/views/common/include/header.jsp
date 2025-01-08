<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css"/>
    

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
              
          <li><a class=aTag href="http://localhost/att/board/list?boardType=10">커뮤니티</a>
              <ul>
                  <li><a class=aTag style = color:#ebebeb; href="http://localhost/att/board/list?boardType=10">공지사항</a></li>
                  
                  <li><a class=aTag style = color:#ebebeb; href="http://localhost/att/board/list?boardType=20">FAQ</a></li>
                  
                  <li><a class=aTag style = color:#ebebeb; href="http://localhost/att/board/list?boardType=30">자주묻는질문</a></li>
                
                  <li><a class=aTag style = color:#ebebeb; href="http://localhost/att/board/list?boardType=40">중고거래</a></li>
                
                  <li><a class=aTag style = color:#ebebeb; href="http://localhost/att/board/list?boardType=50">리뷰게시판</a></li>
              </ul>
          </li>

          
          <c:choose>
          <c:when test="${ sessionScope.loginUser eq null }">
	          <li><a href="#">AllThatTrip!</a>
	              <ul>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/nonUserFindRsvPage.me">예약내역</a></li>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/cartPage.me">장바구니</a></li>
	                  <li><a class=aTag style = color:#ebebeb; href="#" onclick="alertNeedLogin();">찜하기</a></li>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/eventListPage.me">이벤트</a></li>
	              </ul>
	          </li>
	      </c:when>
	      <c:otherwise>
	          <li><a href="/att/myPage.me">내정보</a>
	              <ul>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/findRsvPage.me">예약내역</a></li>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/cartPage.me">장바구니</a></li>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/wishlistPage.me">찜하기</a></li>
	                  <li><a class=aTag style = color:#ebebeb; href="/att/eventListPage.me">이벤트</a></li>
	              </ul>
	          </li>
	      </c:otherwise>
          </c:choose>
          

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



	        <a class="aTag"  href="/att/loginPage.me" id="login_icon"><img src="/att/resources/img/logo/ico_user_white.svg"></a>


	      </div>
	    </c:when>
	    <c:otherwise>
	      <div class="login">

	        <label style="color:white; font-size:15px;">💡</label>

	        <a onclick="logout();" href="redirect:/" id="login_icon"><img src="/att/resources/img/logo/ico_user_white.svg"></a>

	      </div>
	    </c:otherwise>  
      </c:choose>


    </nav>
  </body>
  

<script>
function logout(){
	alertify.confirm("로그아웃 하시겠어요?",
			  function(){
			    alertify.success('예');
			    location.href = "/att/logout.me";
			  },
			  function(){
			    alertify.error('아니오');
			  });
}
function alertNeedLogin(){
  alertify.alert("로그인 후 이용해주세요.");
}


</script>  

</html>