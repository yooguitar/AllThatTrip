<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.content {
	background-color: rgb(247, 245, 245);
	width: 80%;
	margin: auto;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	background-color: white;
}

table * {
	margin: 5px;
}

table {
	width: 100%;
}
</style>
</head>
<body>

	<jsp:include page="../common/include/header.jsp" />

	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>게시글 상세보기</h2>
			<br>
			<button onclick="history.back()">난 버튼</button>
			<a class="btn btn-secondary" style="float: right;"
				href="/hyper/boards">목록으로</a> <br>
			<br>

			<table id="contentArea" algin="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${ adNotice.adNoticeTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ adNotice.adWriter }</td>
					<th>작성일</th>
					<td>${ adNotice.adUploadDate }</td>
				</tr>
				<tr>
					<th>첨부파일</th>

					<c:choose>
						<c:when test="${empty adNotice.adOriName }">
							<td colspan="3">첨부파일이 존재하지않습니다.</td>
						</c:when>
						<c:otherwise>
							<td colspan="3"><a href="${ adNotice.adOriName }"
								download="${ adNotice.adOriName }">${ adNotice.adOriName }</a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4"><p style="height: 150px;">${ adNotice.adNoticeContent }</p></td>
				</tr>
			</table>
			<br>

			<div align="center">
				<c:if
					test="${ sessionScope.loginUser.userId eq requestScope.adNotice.adWriter }">
					<a class="btn btn-primary" onclick="postSubmit(1);">수정하기</a>
					<a class="btn btn-danger" onclick="postSubmit(2);">삭제하기</a>
				</c:if>
			</div>

			<script>
	    		function postSubmit(num){
	    			if(num == 1){
	    				$('#postForm').attr('action', '/att/boards/update-form').submit();
	    			} else {
	    				$('#postForm').attr('action', '/hyper/boards/delete').submit();
	    			}
	    		}
	    	</script>

			<form action="" method="post" id="postForm">
				<input type="hidden" name="boardNo" value="${ board.boardNo }" /> <input
					type="hidden" name="changeName" value="${ board.changeName }" /> <input
					type="hidden" name="boardWriter" value="${ board.boardWriter }" />
			</form>
			
			<br>
			<br>

			<table id="replyArea" class="table" align="center">
				<thead>

					<c:choose>
						<c:when test="${ empty sessionScope.loginUser }">
							<tr>
								<th colspan="2"><textarea class="form-control" readonly
										cols="55" rows="2" style="resize: none; width: 100%;">로그인 후 이용가능합니다.</textarea>
								</th>
								<th style="vertical-align: middle"><button
										class="btn btn-secondary">등록하기</button></th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="2"><textarea class="form-control" name=""
										id="content" cols="55" rows="2"
										style="resize: none; width: 100%;"></textarea></th>
								<th style="vertical-align: middle"><button
										class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="3">댓글(<span id="rcount">0</span>)
						</td>
					</tr>

				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<br>
		<br>

	</div>

	<script>
    
    	function addReply(){
		    		
    		if($('#content').val().trim() != ''){
    			
    			$.ajax({
    				url : '/hyper/reply',
    				data : {
    					refBoardNo : ${board.boardNo},
    					replyContent : $('#content').val(),
    					replyWriter : '${sessionScope.loginUser.userId}'
    				},
    				type : 'post',
    				success  : function(result){
    					
    					//console.log(result);
    					
    					
    					if(result.data === 1){
    						
    						$('#content').val('');
    						
    					}
    				}
    			});
    			
    		}
    		
    	}
    	
    	$(function(){
    		alert(${board.boardNo})
    		selectReply();
    	})
    	
    	
    	
    	function selectReply(){
    		
    		$.ajax({
    			url : '/hyper/reply',
    			type : 'get',
    			data : {
    				boardNo : ${board.boardNo}
    			},
    			success : function(result){
    				//console.log(result);
    				
    				const replies = [...result.data];
    				console.log(replies);
    				
    				const resultStr = replies.map(e => `<tr>
								    					<td>\${e.replyWriter}</td>
								    					<td>\${e.replyContent}</td>
								    					<td>\${e.createDate}></td>
								    					</tr>`
								    				).join('');
    				$('#replyArea tbody').html(resultStr);
    				$('#rcount').text(result.data.length);
    			    			
    		}
    		
    	});
    	}
    </script>
	<jsp:include page="../common/include/footer.jsp" />

</body>
