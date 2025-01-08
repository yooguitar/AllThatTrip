<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	margin-left: -2px;
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

#text-input2{
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
.control_out{
  
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
	margin-top : 4px;
	font-size : 10px;
	color : white;
}

.control-btn2{

	width: 70px;
	height : 25px;
	margin-left : 20px;
	border-radius : 15px;
	background-color : #A63641	;
	border : none;
	margin-bottom : 2px;
	margin-top : 4px;
	font-size : 10px;
	color : white;
}

.control-btn3{

	width: 70px;
	height : 25px;
	margin-left : 20px;
	border-radius : 15px;
	background-color : #57af79;
	border : none;
	margin-bottom : 2px;
	margin-top : 4px;
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
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입일자</th>
						<th>스팸여부</th>
						<th>탈퇴여부</th>
					</tr>
					<tbody  id="member">
						
					</tbody>
				</table>
			</div>
			<div class="control_box">
				<div class="control_in">
		            <label class="label-text"> 유저 ID :</label>
		            <input type="text" id="text-input" /> 
		            <input type="submit" onclick="selectMemberId()"/>
		            <br>
		           	<button class="control-btn" onclick="selectMember()">회원조회</button>
		           	<button class="control-btn" onclick="selectDeleteMember()">탈퇴조회</button>
		           	<br>
		           	<button class="control-btn" onclick="selectNewMember()">최신순</button>
		           	<button class="control-btn" onclick="selectOldMember()">오래된순</button>
		         </div>
		         <div class="control_out">
		         	<label class="label-text"> 변경할 비밀번호 :</label>
		            <input type="text" id="text-input2" />
		            <input type="submit" onclick="updatePasswordMember()"/>
		     		<button class="control-btn2" onclick="deleteMember()">회원탈퇴</button>
		     		<button class="control-btn3" onclick="unDeleteMember()" >회원복구</button>
		     		<button class="control-btn2" onclick="spamMember()">스팸처리</button>
		     		<button class="control-btn3" onclick="unSpamMember()" >스팸철회</button>
		     		
		         </div>    
			</div>
		</div>

		<div id="admin_con">
			<div class="panelist">
				<p5>판매자 목록 리스트</p5>
			</div>
			<div class="panel">
				<table>
					<tr>
						<th>유저번호</th>
						<th>실명</th>
						<th>사업자 이름</th>
						<th>아이디</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입일자</th>
						<th>스팸여부</th>
						<th>탈퇴여부</th>
					</tr>
					<tbody  id="biz_user">
						
					</tbody>
				</table>
			</div>

			<div class="control_box">
				 
		                
			
		
			</div>
		</div>
	</div>

	
	<div class="admin_pages">
		<div id="admin_con">
			<div class="panelist">
				<p5>게시글 목록 리스트</p5>
			</div>
			<div class="panel"></div>
			<div class="control_box"></div>
		</div>

		<div id="admin_con">
			<div class="panel"></div>

			<div class="control_box"></div>
		</div>
	</div>
	<script>
	
	$(function(){
		
		selectMemberPad();
		
	})
	
	
	function selectMemberPad(){
		
		$.ajax({
			url : '/att/adPad/memberFindAll',
			type : 'get',
			success : function(result){
				// console.log(result);
				
				const replies = [...result.data];
				console.log(replies);
				
				const resultStr = replies.map(e => `
													<tr>
													<td>\${e.userNo}</td>
													<td>\${e.userName}</td>
													<td>\${e.userId}</td>
													<td>\${e.email}</td>
													<td>\${e.phone}</td>
													<td>\${e.enrollDate}</td>
													<td>\${e.spam}</td>
													<td>\${e.status}</td>
													</tr>
											       `
							    				).join('');
				$('#member').html(resultStr);
			    			
			}
		
		});
	}
	
	function selectMemberId(){
		
		const userId = document.querySelector('#text-input').value;
		
		$.ajax({
			url : '/att/adPad/selectMemberId',
			type : 'get',
			data : {
				userId : userId
			},
			success : function(result){
				
				const memberInfo = result.data;
				const memberStr =  `<tr>
									<td>\${memberInfo.userNo}</td>
									<td>\${memberInfo.userName}</td>
									<td>\${memberInfo.userId}</td>
									<td>\${memberInfo.email}</td>
									<td>\${memberInfo.phone}</td>
									<td>\${memberInfo.enrollDate}</td>
									<td>\${memberInfo.spam}</td>
									<td>\${memberInfo.status}</td>
									</tr>`
				$('#member').html(memberStr);
			},
			error : function(result){
				
				const errorStr = `<tr>
								  <td>유저가 없습니다.</td>					
								  </tr>
								  `
			   $('#member').html(errorStr);
			}
			
			
		});
	}
	
function selectMember(){
		
			
		$.ajax({
			url : '/att/adPad/selectMember',
			type : 'get',
			success : function(result){
				
				const replies = [...result.data];
				
				const resultStr = replies.map(e => `
													<tr>
													<td>\${e.userNo}</td>
													<td>\${e.userName}</td>
													<td>\${e.userId}</td>
													<td>\${e.email}</td>
													<td>\${e.phone}</td>
													<td>\${e.enrollDate}</td>
													<td>\${e.spam}</td>
													<td>\${e.status}</td>
													</tr>
											       `
							    				).join('');
				$('#member').html(resultStr);
			},
			error : function(result){
				
				const errorStr = `<tr>
								  <td>유저가 없습니다.</td>					
								  </tr>
								  `
			   $('#member').html(errorStr);
			}
			
			
		});
	}
	
function selectDeleteMember(){
	
	
	$.ajax({
		url : '/att/adPad/selectDeleteMember',
		type : 'get',
		success : function(result){
			
			const replies = [...result.data];
			
			const resultStr = replies.map(e => `
												<tr>
												<td>\${e.userNo}</td>
												<td>\${e.userName}</td>
												<td>\${e.userId}</td>
												<td>\${e.email}</td>
												<td>\${e.phone}</td>
												<td>\${e.enrollDate}</td>
												<td>\${e.spam}</td>
												<td>\${e.status}</td>
												</tr>
										       `
						    				).join('');
			$('#member').html(resultStr);
		},
		error : function(result){
			
			const errorStr = `<tr>
							  <td>유저가 없습니다.</td>					
							  </tr>
							  `
		   $('#member').html(errorStr);
		}
		
		
	});
}

function selectNewMember(){
	
	
	$.ajax({
		url : '/att/adPad/selectNewMember',
		type : 'get',
		success : function(result){
			
			const replies = [...result.data];
			
			const resultStr = replies.map(e => `
												<tr>
												<td>\${e.userNo}</td>
												<td>\${e.userName}</td>
												<td>\${e.userId}</td>
												<td>\${e.email}</td>
												<td>\${e.phone}</td>
												<td>\${e.enrollDate}</td>
												<td>\${e.spam}</td>
												<td>\${e.status}</td>
												</tr>
										       `
						    				).join('');
			$('#member').html(resultStr);
		},
		error : function(result){
			
			const errorStr = `<tr>
							  <td>유저가 없습니다.</td>					
							  </tr>
							  `
		   $('#member').html(errorStr);
		}
		
		
	});
}
	
function selectOldMember(){
	
	
	$.ajax({
		url : '/att/adPad/selectOldMember',
		type : 'get',
		success : function(result){
			
			const replies = [...result.data];
			
			const resultStr = replies.map(e => `
												<tr>
												<td>\${e.userNo}</td>
												<td>\${e.userName}</td>
												<td>\${e.userId}</td>
												<td>\${e.email}</td>
												<td>\${e.phone}</td>
												<td>\${e.enrollDate}</td>
												<td>\${e.spam}</td>
												<td>\${e.status}</td>
												</tr>
										       `
						    				).join('');
			$('#member').html(resultStr);
		},
		error : function(result){
			
			const errorStr = `<tr>
							  <td>유저가 없습니다.</td>					
							  </tr>
							  `
		   $('#member').html(errorStr);
		}
		
		
	});
}	

function deleteMember(){
	
	const userId = document.querySelector('#text-input').value;

	$.ajax({
		url : '/att/adPad/deleteMember',
		type : 'post',
		data : {
			userId : userId
		},
		success : function(){
			alert("탈퇴성공");
			selectMemberId();
		}
	})
}

function unDeleteMember(){
	
	const userId = document.querySelector('#text-input').value;

	$.ajax({
		url : '/att/adPad/unDeleteMember',
		type : 'post',
		data : {
			userId : userId
		},
		success : function(){
			alert("복구성공");
			selectMemberId();
		}
	})
}

function spamMember(){
	
	const userId = document.querySelector('#text-input').value;

	$.ajax({
		url : '/att/adPad/spamMember',
		type : 'post',
		data : {
			userId : userId
		},
		success : function(){
			alert("변경성공");
			selectMemberId();
		}
	})
}

function unSpamMember(){
	
	const userId = document.querySelector('#text-input').value;

	$.ajax({
		url : '/att/adPad/unSpamMember',
		type : 'post',
		data : {
			userId : userId
		},
		success : function(){
			alert("변경성공");
			selectMemberId();
		}
	})
}

function updatePasswordMember(){
	
	const userId = document.querySelector('#text-input').value;
	const $userPwd = document.querySelector('#text-input2').value;
	console.log($userPwd);
	
	$.ajax({
		url : '/att/adPad/updatePasswordMember',
		type : 'post',
		data : {
			userId : userId,
			userPwd : $userPwd
		},
		success : function(){
			alert("변경성공");
			selectMemberId();
		}
	})
}
	</script>
</body>
</html>