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
	
	.room-list-div{
		width: 1200px;
		margin: auto;
	}
	
	.room-list-div>div{
		margin: 45px;
		padding: 2px;
		float: left;
	}
	
	.room-list-div>div:hover{
		transform: scale(1.15);
		font-weight: 900;
		color: #326044;
	}
	
	.room-div{
		border: 1px solid #60B557;
		border-radius: 5px;
	}
	
	.room-info{
		text-align: center;
	}
	
	.room-div>img{
		width: 300px;
		height: 160px;
	}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	
	<div class="room-list-div">
		<c:forEach items="${ roomList }" var="rl">
			<div class="room-div" onclick="room_detail(${ rl.roomNo })">
				<c:forEach items="${ roomImgList }" var="img">
	        		<c:if test="${ rl.roomNo eq img.roomNo }">
		            	<img src="/att${ img.changeName }" alt="대표 이미지">
		            </c:if>
	        	</c:forEach>
		        <div class="room-info">
		            <p>${ rl.roomName }</p>
		            <p>${ rl.price }원</p>
		        </div>
			</div>
		</c:forEach>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
	
	<script>
		function room_detail(roomNo){
			location.href = '/att/rooms/detail?roomNo=' + roomNo;
		}
	</script>
	
</body>
</html>