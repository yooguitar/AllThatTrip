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
        width:1500px;
        margin: 0 auto;
        padding: 0;

    }

    .gna-container {
        width: 70%;
        margin: 0 auto;
        padding: 20px;
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
	
   
    .gna-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .gna-table th,
    .gna-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .gna-table th {
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


    </style>
</head>
<body>

    <jsp:include page="../common/include/header.jsp" />   
    
    <div class="gna-container">
        <h1>문의하기(Q&A)</h1>
        
 
        <br clear="both"><br>
        <form id="searchForm" action="" method="get" align="center">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="writer">작성자</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" name="keyword">
            </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        <a class="write-button" style="float:right;" href="/att/board/insertForm?boardType=30">글쓰기</a>

  
    <br><br>
        <table class="gna-table">
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
