<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>내 정보</title>
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

  <c:if test="${ not empty alertMsg }">
    <script>
			alertify.alert('AllThatTrip', '${alertMsg}', function(){alertify.success('확인')});
		</script>
		<c:remove var="alertMsg" scope="session" />
  </c:if>

<!--<jsp:include page="/WEB-INF/views/common/include/header.jsp" /> -->

<div class="container" id="wrap">
  <h2>내 정보</h2>
  <br><label>가입일: <fmt:formatDate value="${ sessionScope.loginUser.enrollDate }" pattern="yyyy-MM-dd" /></label>
  <br><br>

  <form action="join.me" method="post" id="join-form">
    <div class="form-group">
      <label>ID:</label>
      <input type="id" class="form-control" id="userId" placeholder="6 - 20자 영문, 숫자 입력" value="${ sessionScope.loginUser.userId }" name="userId" readonly>
      <div id="check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>
    <div class="form-group">
      <label>Password:</label>
      <input type="password" class="form-control" id="userPwd" placeholder="6 - 20자 영문, 숫자, 특수문자 입력" value="${ sessionScope.loginUser.userPwd }" name="userPwd" readonly>
      <div id="pwd-check-result" style="font-size:0.9em; display:none; margin:10px;"></div>
    </div>

    <div class="form-group">
        <label>이름:</label>
        <input type="name" class="form-control" id="userName" value="${ sessionScope.loginUser.userName }" name="userName" readonly>
    </div>

    <div class="form-group">
        <label style="display: block;">Email:</label>
        <input type="text" class="form-control" id="email-id" value="${ sessionScope.loginUser.email }" readonly>
    </div>

    <div class="form-group">
        <label>휴대폰 번호:</label>
        <input type="phone" class="form-control" placeholder="010-1234-4567" id="phone" name="phone" value="${ sessionScope.loginUser.phone }" readonly>
      
    </div>
    <div class="form-group form-check">
        <br>
      <label class="form-check-label" style="margin-left: 310px;">
        <input onclick="getSpamCk" type="checkbox" style="accent-color:rgb(50, 96, 68);" id="spam" name="spam" value="1" checked> SMS 수신여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </label>
      <br><br>
    </div>

    <button onclick="updatePage();" type="button" class="btn btn-primary" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68); width: 380px; height: 60px;">정보 수정</button>
    <button onclick="deletePage();" type="button" class="btn btn-primary" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68); width: 380px; height: 60px;">회원 탈퇴</button>
  </form>
  
</div>
<div style="margin-left:360px">
<!-- <jsp:include page="/WEB-INF/views/common/include/footer.jsp" /> -->
</div>





</body>
</html>

<script> 
    function updatePage(){
      location.href = "updatePage.me";
    }
    function deletePage(){
      location.href = "deletePage.me";
    }

</script>