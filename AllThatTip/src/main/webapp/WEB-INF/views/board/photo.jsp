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
            border:1px solid lightgray;
            width:100%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }



	.list-area{
		text-align : center;
	}

	.thumbnail{
		box-shadow : 1px 1px 2px #0000002e;
		width : 300px;
		padding : 12px;
		margin : 25px;
		display : inline-block;
		background-color: #ffffffb0;
		color:#000000b0;
		font-weight: bold;
		border-radius: 12px;
	}

	.thumbnail > img{
		width : 270px;
		height : 180px;
		margin-bottom : 8px;
		border : 1px solid rgb(172 205 255 / 57%);
		border-radius: 12px;
	}

	.thumbnail:hover{
		cursor:pointer;
		opacity:0.8;
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
            <img src="/att/resources/img/etc/review_banner.png" alt="Review Banner" style="width: 1200px; height: auto; display: block; margin: 0 auto;" >
        <br><br>    
            <!-- 검색창 -->
            <div class="action-bar">
                <form id="searchForm" action="" method="get" align="center" style="display: inline-block;">
                <input type="hidden" name="boardType" value="${ board.boardType }" />
                    <div class="select" style="display: inline-block;">
                        <select class="custom-select" name="condition">
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
                <a class="btn btn-secondary" href="/att/board/insertForm?boardType=40" style="display: inline-block; margin-left: 10px;">글쓰기</a>
	            </div>
	            <div class="list-area">
	            </div>
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
                    <img src="/att${ board.imagePath }" alt="이미지" style="width: 270px; height: 180px;">
                    <p>
                        <label>No. ${ board.boardNo }</label> / <span>${ board.boardTitle }</span> <br>
                        <label>조회수</label> : <span>${ board.count }</span>
                    </p>
                </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
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