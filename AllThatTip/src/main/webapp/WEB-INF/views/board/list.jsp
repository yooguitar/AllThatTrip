<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            width:1200px;
            margin: 0 auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:100%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
</head>
<body>
	<jsp:include page="../common/include/header.jsp" />
    <div class="content">
       <br><br>
       <div class="innerOuter" style="padding:5% 10%;">
           <h2>공지사항</h2>
           
           	
           <br>
           <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 
           <c:if test="${ not empty sessionScope.loginUser}">
           	<a class="btn btn-secondary" style="float:right;" href="insertForm">글쓰기</a>
           </c:if>
           -->
       
           
           <c:choose>
               <c:when test="${board.boardType == 10}">
                   <a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=10">글쓰기</a>
               </c:when>
               <c:when test="${board.boardType == 20}">
                   <a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=20">글쓰기</a>
               </c:when>
               <c:when test="${board.boardType == 30}">
                   <a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=30">글쓰기</a>
               </c:when>
               <c:when test="${board.boardType == 40}">
                   <a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=40">글쓰기</a>
               </c:when>
               <c:otherwise>
                   <a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=50">글쓰기</a>
               </c:otherwise>
           </c:choose>
           
        
         <br>
         <br>
         <table id="boardList" class="table table-hover" align="center">
             <thead>
                 <tr>
                     <th>글번호</th>
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
         <br>
		<script>
			function detail(num) {
				//console.log(num);
				
				const boardType = '${board.boardType}';
				console.log("boardNo:", num, "boardType:", boardType); 
				window.location.href = '/att/board/list/'+num+'?boardType=' + boardType;
			}
			
		</script>
        <div id="pagingArea">
		    <ul class="pagination">
		        <c:choose>
		            <c:when test="${ pageInfo.currentPage ne 1 }">
		                <li class="page-item">
		                    <a class="page-link" href="list?boardType=${pageInfo.boardType}&page=${pageInfo.currentPage - 1}">
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
		
		        <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="num">
		            <li class="page-item">
		                <a class="page-link" href="list?boardType=${board.boardType}&page=${num}">
		                    ${num}
		                </a>
		            </li>
		        </c:forEach>
		                   
		                   
                                      
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
            </div>

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
        </div>
        <br><br>

    </div>
	<jsp:include page="../common/include/footer.jsp" />
</body>
</html>