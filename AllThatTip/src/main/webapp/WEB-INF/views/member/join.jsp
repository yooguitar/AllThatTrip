<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지 입니다.</title>
</head>
<body>

    <h1>회원가입</h1>

    <form action="join.me" method="post">

        <label>아이디<input type="text" placeholder="6~20자 영문, 숫자"></label><br>
        <label>비밀번호<input type="text" placeholder="6~20자 영문, 숫자, 특수문자"></label><br>
        <label>비밀번호 확인<input type="text" placeholder="6~20자 영문, 숫자, 특수문자"></label><br>
        <label>이름<input type="text" placeholder="숫자, 특수문자 사용 불가"></label><br>
        <label>이메일<input type="text" placeholder="이메일 주소"></label>@<br>
        <label>핸드폰 번호<input type="text" placeholder="- 없이 입력"></label><br>

        <label><input type="checkbox">SMS, 이메일로 상품 및 이벤트 정보 받기(선택)</label><br>
        <label><input type="checkbox">14세 미만입니다.</label><br>

        <p>만 14세 미만 회원은 법정대리인(부모님) 동의를 받은 경우만 회원가입이 가능합니다.</p>
        <button>가입완료</button>

    </form>

    
</body>
</html>