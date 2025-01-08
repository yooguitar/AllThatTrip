<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>중고거래리스트</title>
    <meta charset="utf-8">
    <!--생략하셔도 됩니다.-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
  <style> 
    
    .used_innerOuter {
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
	#pagingArea {width:fit-content; margin:auto;}


	.list-area{
		text-align : center;
		
	}

	.thumbnail{

		box-shadow : 1px 1px 2px #0000002e;
		width : 310px;
		padding : 12px;
		margin : 20px;
		display : inline-block;
		background-color: #ffffffb0;
		color:#000000b0;
		font-weight: bold;
		border-radius: 12px;
	}

	.thumbnail > img{
		width : 300px;
		height : 200px;
		margin-bottom : 8px;
		border : 1px solid rgb(172 205 255 / 57%);
		border-radius: 12px;
	}

	.thumbnail:hover{
		cursor:pointer;
		opacity:0.8;
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
    <div class="used_innerOuter" style="padding:5% 10%;">
    <h2>중고거래게시판</h2>
    <div class="photolist_outer">
        <div>
        <br>
            <img src="/att/resources/img/etc/photo_banner.jpg" alt="Review Banner" style="width: 1150px; height: auto; display: block; margin: 0 auto;" >
        <br><br>    
        
           <!-- 검색창 -->
           <div class="action-bar">
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
			<button type="submit" class="searchBtn btn btn-secondary" style="display: inline-block;">검색</button>
		</form>
           <br><br> 
               
		<c:if test="${not empty sessionScope.loginUser and board.boardType == 40}">
			<a class="btn btn-secondary" style="float:right;" id="write-button" href="/att/board/insertForm?boardType=40">글쓰기</a>
		</c:if>
			<br>
            </div>
            </div>
            <div class="list-area">
	        </div>
	    </div>

        <c:choose>
            <c:when test="${ empty boards }">
                등록된 게시글이 존재하지 않습니다. <br>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ boards }" var="board">
                    
                <div class="thumbnail" align="center">
                    <input type="hidden" value="${ board.boardNo }" />
                    <img src="/att${ board.imagePath }" alt="이미지" style="width: 100%; height: 100%;">
                    <p>
                        <label>No.  ${ board.boardNo }</label> <br>
                        <label>제목: ${ board.boardTitle }</label> <br>
                        <label>작성자: ${ board.boardWriter }</label> <br>
                        <label>조회수</label> : <span>${ board.count }</span>
                    </p>
                </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
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
		$('.thumbnail').click(function() {
		    const num = $(this).children().eq(0).val(); // 게시글 번호
		    const boardType = $(this).data('boardType'); // 게시판 타입

		    location.href = '/att/board/list/' + num + '?boardType=' + boardType; // URL 지정
		});
		</script>
		
    <jsp:include page="../common/include/footer.jsp" />   

</body>
</html>