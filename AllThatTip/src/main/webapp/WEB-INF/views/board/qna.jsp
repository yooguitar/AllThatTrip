<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Q&A(문의하기)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

    <style>
    body {
        font-family: Arial, sans-serif;
        width:1200px;
        margin: 0 auto;
        padding: 0;
        

    }
	#pagingArea {width:fit-content; margin:auto;}
	
    .qna-container {
        width: 70%;
        margin: 10px auto;
        padding: 40px;
        background-color: #fff;
        
    }

    h1 {
        text-align: center;
        font-size: 30px;
        color: #333;
        margin-bottom: 30px;
    }
	
   
    .qna-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .qna-table th,
    .qna-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .qna-table th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

   

    .write-button {
        display: block;
        margin: 0 auto;
        padding: 8px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #326044;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .write-button:hover {
        background-color: #444;
    }
    
    .search-form {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
	}
	
	.search-container {
	    display: flex;
	    align-items: center;
	    gap: 10px; /* 입력 필드 간 간격 */
	}
	
	.search-container .select select {
	    padding: 5px 12px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    font-size: 15px;
	    outline: none;
	}
	
	.search-container .text input {
	    padding: 12px 16px;
	    border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 15px; /* 글자 크기 */
        width: 300px; /* 검색창 너비 조정 */
        outline: none;
	}
	
	.search-container .searchBtn {
	    padding: 8px 16px;
	    border: none;
	    border-radius: 4px;
	    background-color: #6c757d;
	    color: white;
	    font-size: 14px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	.search-container .searchBtn:hover {
	    background-color: #5a6268;
	}


    </style>
</head>
<body>

    <jsp:include page="../common/include/header.jsp" />   
    <br><br>
    <h1>문의하기(Q&A)</h1>
    <div class="qna-container">
        
 		<br>
		<form id="searchForm" action="/att/board/list" method="get" align="center" style="display: inline-block;">
			<input type="hidden" name="boardType" value="${ board.boardType }" />
				<div class="select" style="display: inline-block;">
				     <select class="custom-select" name="condition" id="condition">
				         <option value="title">제목</option>
				         <option value="content">내용</option>
				         <option value="writer">작성자</option>
				     </select>
				 </div>
				<div class="text" style="display: inline-block;">
				    <input type="text" class="form-control" name="keyword">
				</div>
			<button type="submit" class="write-button" style="display: inline-block;">검색</button>
		</form>
		<br><br> 
           	<c:if test="${not empty sessionScope.loginUser and board.boardType == 30}">
				<a class="write-button" style="float:right;" href="/att/board/insertForm?boardType=30">글쓰기</a>
			</c:if>
		<br><br> 
  
    	<br><br>
        <table class="qna-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    
                </tr>
            </thead>
			<tbody>
			  	<c:forEach items="${boards}" var="board">
					<tr onclick="detail('${board.boardNo}')"> 
						<td>${board.boardNo}</td>
						<td>${board.boardTitle}</td>
						<td>${board.boardWriter}</td>
						<td>${board.count}</td>
						<td>${board.createDate}</td>
			  		</tr>
				</c:forEach>
			</tbody>
        </table>
    </div>
	
	<!-- 페이징 -->
        <div id="pagingArea">
		    <ul class="pagination">
		        <!-- 이전 페이지 버튼 -->
		        <c:choose>
		            <c:when test="${pageInfo.currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link"
		                       href="list?boardType=${board.boardType}&page=${pageInfo.currentPage - 1}">
		                        이전
		                    </a>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item disabled">
		                    <a class="page-link" href="#">이전</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		
		        <!-- 페이지 번호 버튼 -->
		        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="num">
		        
		         	<c:choose>
		         		<c:when test="${ empty board.condition }">
		         			<li class="page-item <c:if test='${pageInfo.currentPage == num}'>active</c:if>'">
		                		<a class="page-link" href="list?boardType=${board.boardType}&page=${num}">
				                    ${num}
				                </a>
				            </li>
		         		</c:when>
		         		<c:otherwise>												
		         			<li class="page-item <c:if test='${pageInfo.currentPage == num}'>active</c:if>'">
		                		<a class="page-link" href="list?boardType=${board.boardType}&page=${num}&condition=${board.condition}&keyword=${board.keyword}">
				                    ${num}
				                </a>
				            </li>
		         		</c:otherwise>
		         	</c:choose>
		        </c:forEach>
		
		        <!-- 다음 페이지 버튼 -->
		        <c:choose>
		            <c:when test="${pageInfo.currentPage < pageInfo.maxPage}">
		                <li class="page-item">
		                    <a class="page-link"
		                       href="list?boardType=${board.boardType}&page=${pageInfo.currentPage + 1}">
		                        다음
		                    </a>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item disabled">
		                    <a class="page-link" href="#">다음</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		    </ul>
		</div>
        

		<script>
			function detail(num) {
				const boardType = '${board.boardType}';
				window.location.href = '/att/board/list/'+num+'?boardType=' + boardType;
			}
			
		</script>
 <!-- 로그인안해도 보임 -->

    <jsp:include page="../common/include/footer.jsp" />
</body>
</html>
