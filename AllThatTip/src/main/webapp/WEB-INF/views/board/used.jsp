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

	.thumnail{
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

	.thumnail > img{
		width : 270px;
		height : 180px;
		margin-bottom : 8px;
		border : 1px solid rgb(172 205 255 / 57%);
		border-radius: 12px;
	}

	.thumnail:hover{
		cursor:pointer;
		opacity:0.8;
	}


</style>
</head>
<body>
    <div class="used_innerOuter" style="padding:5% 10%;">
    <h2>중고거래게시판</h2>
    <div class="photolist_outer">
        <div>
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
                <!-- Other content -->
            </div>
        </div>
    </div>

        <c:choose>
            <c:when test="${ empty list }">
                등록된 게시글이 존재하지 않습니다. <br>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ list }" var="board">
                    
                <div class="thumnail" align="center">
                    <input type="hidden" value="${ board.boardNo }" />
                    <img src="${ board.imagePath }" alt="이미지">
                    <p>
                        <label>No. ${ board.boardNo }</label> / <span>${ board.boardTitle }</span> <br>
                        <label>조회수</label> : <span>${ board.count }</span>
                    </p>
                </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        
        <script type="text/javascript">
            $('.thumnail').click(function(){
                
            	const boardNo = $(this).children().eq(0).val();
            
                location.href = 'detail.thumbnail?boardNo='+boardNo;    // url지정
                // console.log($(this).children().eq(1).children().eq(0).text().split(' ')[1]);	
                // console.log($(this).children().eq(0).val());    
                
            });
        </script>
        


    </div>



    </div>
</div>

</body>
</html>