<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지 입니다.</title>
</head>
    
    <form action="login.me" method="post">
        <label>ID*
            <input type="text" placeholder="아이디 입력" id="userId"><br>
        </label>
        <label>Password*
            <input type="text" placeholder="비밀번호 입력" id="userPwd"><br>
        </label>
        <input type="checkbox" checked>
        <a href="#">아이디 / 비밀번호 찾기</a><br>
        <button>로그인</button>
        
    </form>

    <label>아직 회원이 아니신가요?
        <a href="#">회원가입</a><br>
    </label>

    <p>비회원으로도 이용 가능합니다.</p><br>

    <label>사장님 이신가요?
        <a href="#">사업자 회원가입</a>
    </label>

</body>
</html>