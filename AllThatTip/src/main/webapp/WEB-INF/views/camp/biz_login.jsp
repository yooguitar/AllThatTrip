<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인 페이지 입니다.</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	body{
		margin: 0px;
	}
	
	.container{
		width: 500px;
		border: 1px solid rgba(0, 0, 0, 0.2);
	    border-radius: 5px;
	    height: 450px;
	    margin: auto;
	    margin-top: 50px;
	    padding: 15px;
	}
	
	form{
		display: block;
	    margin-top: 0em;
	    unicode-bidi: isolate;
	}
	
	.title-join-biz {
	    text-align: center;
	}
	
	.form-group {
	    margin-bottom: 1rem;
	}
	
	label {
	    display: inline-block;
	    margin-bottom: .5rem;
	}
	
	.form-control {
	    display: block;
	    width: 100%;
	    height: calc(1.5em + .75rem + 2px);
	    padding: .375rem .75rem;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #495057;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	    box-sizing: border-box;
	}
	
	.btn {
	    display: inline-block;
	    cursor: pointer;
	    font-weight: 400;
	    color: #fff;
	    text-align: center;
	    vertical-align: middle;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    background-color: transparent;
	    border: 1px solid transparent;
	    padding: .375rem .75rem;
	    font-size: 1rem;
	    line-height: 1.5;
	    border-radius: .25rem;
	    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	}
	
	.login-btn{
		margin-top: 80px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

	
	<div class="container" id="wrap">
	    <br>
	    <h2 class="title-join-biz">사업자 로그인</h2>
	    <br>
	    <form action="/att/camps/login" method="post">
	        <div class="form-group">
	            <label>ID:</label>
	            <input type="text" class="form-control" id="userId" placeholder="아이디 입력" name="userId" required>
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <input type="password" class="form-control" id="userPwd" placeholder="비밀번호 입력" name="userPwd" required>
	        </div>
	        <div class="form-group form-check">
	    		<a href="#" style="color: rgb(33, 37, 41); float:right;">아이디 / 비밀번호 찾기</a>
			</div>
			<div class="form-group login-btn">
				<button type="submit" class="btn" style="background-color:rgb(50, 96, 68); border:rgb(50, 96, 68); width: 500px; height: 50px;">로그인</button>
			</div>
		</form>
	</div>
    
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

</body>
</html>