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

    .qna-container {
        width: 70%;
        margin: 10px auto;
        padding: 40px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
        padding: 10px 20px;
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
    
    <div class="qna-container">
        <h1>문의하기(Q&A)</h1>
        
 		<br><br><br>
        <form id="searchForm" action="" method="get" class="search-form">
		    <div class="search-container">
		        <div class="select">
		            <select class="custom-select" name="condition">
		                <option value="writer">작성자</option>
		                <option value="title">제목</option>
		                <option value="content">내용</option>
		            </select>
		        </div>
		        <div class="text">
		            <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요">
		        </div>
		        <button type="submit" class="searchBtn">검색</button>
		    </div>
		</form>
            <br><br>
            
        <a class="write-button" style="float:right;" href="/att/board/insertForm?boardType=30">글쓰기</a>

  
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
