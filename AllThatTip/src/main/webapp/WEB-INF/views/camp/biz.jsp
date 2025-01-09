<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 0px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	
	<div style="width:1200px; margin:auto;">
		<br>
		<a href="/att/camps/insert_form" style="color:black;"> camp 등록 </a> <br><br>
		
		<a href="/att/camps/biz_list" style="color:black;"> camp 리스트 </a> <br><br>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />		
</body>
</html>