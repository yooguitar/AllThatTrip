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

        <ul id="faq-category">
            <li data-target="faq-point-1">Category 1</li>
            <li data-target="faq-point-2">Category 2</li>
            <li data-target="faq-point-3">Category 3</li>
            <li data-target="faq-point-4">Category 4</li>
            <li data-target="faq-point-5">Category 5</li>
        </ul>

        <form id="searchForm" action="" method="get" align="center">
        <input type="hidden" name="boardType" value="${ board.boardType }" />
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            
            <div class="text">
                <input type="text" class="form-control" name="keyword">
            </div>
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            <c:if test="${ not empty sessionScope.loginUser}">
                <a class="btn btn-secondary" style="float:right;" href="http://localhost/att/board/insertForm?boardType=20">글쓰기</a>
            </c:if>
        </form>
        
        <br><br>
    </div>

    <!-- 동적 게시판 렌더링 -->
	
	<div id="faq-contentlist">
	    <c:forEach items="${boards}" var="board">
	        <div class="faq-item" id="faq-point-${board.boardNo}">
	            <h2 class="faq-question">${board.boardTitle}</h2>
	            <p class="faq-answer">${board.boardContent}</p>
	        </div>
	    </c:forEach>
	</div>
    
    <!-- 로그인안해도 보임 -->
	<a class="btn btn-secondary" style="float:right;" href="/att/board/insertForm?boardType=20">글쓰기</a>
	

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
