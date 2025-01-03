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
			<a class="btn btn-secondary" style="float: right;"
				href="/att/admin/admin_notice">목록으로</a> <br>
			<br>

			<table id="contentArea" align="center" class="table">
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
					test="${ sessionScope.loginAdmin.adId eq requestScope.adNotice.adWriter }">
					<!-- 
					<a class="btn btn-primary" href="/att/admin/ad_update_form">수정하기</a>
					<a class="btn btn-danger" href="/att/admin/delete">삭제하기</a>
					 -->
				  	
					<a class="btn btn-primary" onclick="postSubmit();">수정하기</a>
					<a class="btn btn-danger" onclick="postDelete();">삭제하기</a>
				
				</c:if>
			</div>

			<script>
	    		function postSubmit(){
	    				location.href = '/att/admin/ad_update_form?adNoticeNo=${adNotice.adNoticeNo}';
	    		}
	    		
	    		function postDelete() {
	    			$('#postForm').attr('action', '/att/admin/ad_delete').submit();
	    		}
	    	</script>
				<form action="" method="post" id="postForm">
				<input type="hidden" name="adNoticeNo" value="${ adNotice.adNoticeNo }" />
				<input type="hidden" name="adChaName" value="${ adNotice.adChaName }" /> 
				<input type="hidden" name="adWriter" value="${ adNotice.adWriter }" />
			</form>
			<br>
			<br>

			<table id="replyArea" class="table" align="center">
				<thead>

					<c:choose>
						<c:when test="${ empty sessionScope.loginAdmin }">
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
    				url : '/att/admin/adReply',
    				data : {
    					adRepNo : ${adNotice.adNoticeNo},
    					adRepContent : $('#content').val(),
    					adRepName : '${sessionScope.loginAdmin.adId}'
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
    		
    		selectReply();
    	})
    	
    	
    	
    	function selectReply(){
    		
    		$.ajax({
    			url : '/att/admin/adreply',
    			type : 'get',
    			data : {
    				adNoticeNo : ${adNotice.adNoticeNo}
    			},
    			success : function(result){
    				//console.log(result);
    				
    				const replies = [...result.data];
    				console.log(replies);
    				
    				const resultStr = replies.map(e => `<tr>
								    					<td>\${e.adRepName}</td>
								    					<td>\${e.adRepContent}</td>
								    					<td>\${e.adCreateDate}></td>
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
