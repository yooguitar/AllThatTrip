<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ(자주묻는질문)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

    body{
        font-family: Arial, Helvetica, sans-serif;
        line-height: 1.6;
        width:1200px;
        margin: 0 auto;
        padding: 0;
    }

    .faq-container {
        width: 80%;
        margin: auto;
        overflow: hidden;
        padding: 20px;
    }

    h1{
        text-align:center;
        color: #333;
    }

    .faq-item{
        background-color: #fff;
        margin-bottom: 20px;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        cursor: pointer;
    }

	#pagingArea {width:fit-content; margin:auto;}
    .faq-question {
        font-size: 18px;
        color:#333;
        margin: 0;
        position: relative;
        padding-right: 30px;
    }

    .faq-question::after{
        content: '+';
        position: absolute;
        right: 0;
        top: 50%;
        transform: translateY(-50%);
    }

    .faq-question.active::after {
        content:'-';
    }

    .faq-answer {
        display:none;
        margin-top: 10px;
        color: #666;
    }

    .faq-answer.show{
        display: block;
    }

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


    #faq-category {
        display: flex;
        justify-content: space-around; 
        border-radius: 50px;
        
        list-style-type: none; 
        padding: 50px; 
        margin: 15px; 
    }

    #faq-category > li {
        font-size: 16px;
        cursor: pointer;
        padding: 10px 15px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    #faq-category > li:hover {
        background-color: #60B557; 
    }


    #faq-contentlist {
        margin: 10px;
        padding: 60px;
    }

	

</style>

</head>
<body>
    <jsp:include page="../common/include/header.jsp" />    
    <br>
    <div class="faq-container">
        <h1>FAQ(자주묻는질문)</h1>
        <br><br>
		
        <form id="searchForm" action="/att/board/list" method="get" align="center">
            	<input type="hidden" name="boardType" value="${ board.boardType }" />
	                <div class="select">
	                    <select class="custom-select" name="condition" id="condition">
	                        <option value="title">제목</option>
	                        <option value="content">내용</option>
	                    </select>
	                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" id="keyword" />
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
        		<c:if test="${not empty sessionScope.loginUser and board.boardType == 20}">
					<a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=20">글쓰기</a>
				</c:if>
        <br><br>
    </div>


    <!-- 동적 게시판 렌더링 삭제하기 키 추가해야함 -->
	
	<div id="faq-contentlist">
	    <c:forEach items="${boards}" var="board">
	        <div class="faq-item" id="faq-point-${board.boardNo}">
	            <h2 class="faq-question">${board.boardTitle}</h2>
	            <p class="faq-answer">${board.boardContent}</p>
	            
	            
	        </div>
	    </c:forEach>
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
    document.addEventListener('DOMContentLoaded',function(){
        const faqItems = document.querySelectorAll('.faq-item');

        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            const answer = item.querySelector('.faq-answer');

            question.addEventListener('click',() => {
                faqItems.forEach(otherItem => {
                    if(otherItem !== item){
                        otherItem.querySelector('.faq-question').classList.remove('active');
                        otherItem.querySelector('.faq-answer').classList.remove('show');
                    }
                });

                question.classList.toggle('active');
                answer.classList.toggle('show');
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        const categoryItems = document.querySelectorAll('#faq-category > li');

        categoryItems.forEach(item => {
            item.addEventListener('click', function () {
                const targetId = this.getAttribute('data-target'); 
                if (targetId) {
                    const targetElement = document.getElementById(targetId);
                    if (targetElement) {
                        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                }
            });
        });
    });
    </script>
    
    <jsp:include page="../common/include/footer.jsp" />
</body>


</html>
