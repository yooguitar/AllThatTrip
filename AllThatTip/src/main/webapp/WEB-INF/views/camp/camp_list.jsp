<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 리스트</title>

<style>
	body{
		margin: 0px;
	}
	
	.camp-list-div{
		width: 1200px;
		height: auto;
		overflow: hidden;
		margin: auto;
	}
	
	.camp-list-div>div{
		margin: 45px;
		padding: 2px;
		float: left;
	}
	
	.camp-list-div>div:hover{
		transform: scale(1.15);
		font-weight: 900;
		color: #326044;
	}
	
	.camp-div{
		border: 1px solid #60B557;
		border-radius: 5px;
	}
	
	.camp-info{
		text-align: center;
	}
	
	.camp-div img{
		width: 300px;
		height: 160px;
	}
	
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	
	<div class="camp-list-div">
		<c:forEach items="${ campList }" var="c">
			<div class="camp-div" onclick="camp_detail(${ c.campNo })">
				<div class="img-div">
	            	<img src="/att${ c.changeName }" alt="대표 이미지">
				</div>
		        <div class="camp-info">
		            <p>${ c.campName }</p>
		            <p>${ c.campAddr }</p>
		        </div>
	        </div>
       	</c:forEach>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
	
	<script>
		function camp_detail(campNo){
			location.href = '/att/camps/detail?campNo=' + campNo;
		}
	</script>
	
</body>
</html>