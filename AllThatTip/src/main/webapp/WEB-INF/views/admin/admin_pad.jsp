<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Document</title>
<style>
.admin_pages {
	width: 1200px;
	height: 1000px;
	border: 1px solid #326044;
	border-radius: 1%;
	background-color: #326044;
	margin: auto;
	margin-bottom : 15px;
}

#admin_con {
	width: 1000px;
	height: 400px;
	margin: auto;
	margin-top: 50px;
	border-radius: 5px;
	background-color: #ffffff;
}

.control_box {
	height: 100px;
	width: 1000px;
	margin: auto;
	border-radius: 0px 0px 5px 5px;
	background-color: rgb(202, 219, 202);
	
}

.control_box>div{
	float: left;
}

.panel {
	overflow: scroll;
	width: 1000px;
	height: 280px;
}

.panelist {
	width: 1000px;
	height: 20px;
	background-color: #57af79;
	border-radius: 5px 5px 0px 0px;
	color: #ffffff;
	font-weight: 800;
}

tr {
	background-color: rgb(202, 219, 202);
	width: 1000px;
	display: flex;
	margin-top: -4px;
	}

th {
	font-size: 12px;
	width: 100px;
}

td {
	text-align: center;
	width: 100px;
	font-size: 10px;
}

table {
	width: 100%;
}

#text-input{
    margin-left : 10px;
    margin-top : 5px;
	width: 100px;
	height:25px;
}

.label-text{
    font-weight: 800px;
    font-size : 12px;
    margin-left : 10px;
}

.control_in{
        
    height : 100px;
    width : 300px;

}
.control_outt{
  
    height : 100px;
    width : 700px;
    float : left;
 	

}

.submit-btn{
	
	width : 25px;
	height: 25px;
	

}

.control-btn{

	width: 70px;
	height : 25px;
	margin-left : 20px;
	border-radius : 15px;
	background-color : #326044;
	border : none;
	margin-bottom : 2px;
	font-size : 10px;
	color : white;
}


</style>

</head>
<body>
	<jsp:include page="../common/include/ad_nav.jsp" />

	<div class="admin_pages">
		<div id="admin_con">
			<div class="panelist">
				<p5>유저 목록 리스트</p5>
			</div>
			<div class="panel">
				<table>
					<tr>
						<th>유저번호</th>
						<th>실명</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입일자</th>
						<th>스팸여부</th>
						<th>탈퇴여부</th>
					</tr>
				</table>
				<table>
					<tr>
						<td>${member.userNo}</td>
						<td>${member.userName}</td>
						<td>${member.userId}</td>
						<td>${member.userPwd}</td>
						<td>${member.email}</td>
						<td>${member.phone}</td>
						<td>${member.enrollDate }</td>
						<td>${member.spam}</td>
						<td>${member.status }</td>
					</tr>
				</table>
			</div>
			<div class="control_box">
				<div class="control_in">
		            <label class="label-text"> 유저 ID :</label>
		            <input type="text" id="text-input" /> 
		            <br>
		           	<button class="control-btn">회원조회</button>
		           	<button class="control-btn">탈퇴조회</button>
		           	<br>
		           	<button class="control-btn">최신순</button>
		           	<button class="control-btn">오래된순</button>
		         </div>
		         <div class="control_outt">
		     	
		         </div>    
			</div>
		</div>

		<div id="admin_con">
			<div class="panelist"></div>
			<div class="panel"></div>

			<div class="control_box">
				 
		                
			
		
			</div>
		</div>
	</div>

	
	<div class="admin_pages">
		<div id="admin_con">
			<div class="panelist"></div>
			<div class="panel"></div>
			<div class="control_box"></div>
		</div>

		<div id="admin_con">
			<div class="panel"></div>

			<div class="control_box"></div>
		</div>
	</div>

</body>
</html>