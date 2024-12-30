<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQ 게시판</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
  <link rel="stylesheet" href="styles.css">
<style>

    body{
        font-family: Arial, Helvetica, sans-serif;
        line-height: 1.6;
        margin: 0;
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
	<h1>자주 묻는 질문 (FAQ)</h1>
	<br><br>
	
	<ul id="faq-category">
		<li data-target="faq-point-1">Member</li>
		<li data-target="faq-point-2">Reservation</li>
		<li data-target="faq-point-3">사장님전용</li>
		<li data-target="faq-point-4">어쩌고고고고고</li>
		<li data-target="faq-point-5">저쩌고용용</li>
	</ul>
	
	<form id="searchForm" action="" method="get" align="center">
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
			<a class="btn btn-secondary" style="float:right;" href="http://localhost/att/board/insertForm?boardType=10">글쓰기</a>
		</c:if>
	</form>
	
	    
	<br><br>
	
	</div>

	<div id="faq-contentlist">
	    <div class="faq-item" id="faq-point-1">
	        <h2 class ="faq-question">1. 1번질문이에요.</h2>
	        <p class ="faq-answer">1번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item">
	        <h2 class ="faq-question">2. 2번질문이에요.</h2>
	        <p class ="faq-answer">2번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item">
	        <h2 class ="faq-question">3. 3번질문이에요.</h2>
	        <p class ="faq-answer">3번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item" id="faq-point-2">
	        <h2 class ="faq-question">4. 4번질문이에요.</h2>
	        <p class ="faq-answer">4번 답변입니다.</p>
	    </div>
	    <div class="faq-item">
	        <h2 class ="faq-question">5. 5번질문이에요.</h2>
	        <p class ="faq-answer">5번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item">
	        <h2 class ="faq-question">6. 6번질문이에요.</h2>
	        <p class ="faq-answer">6번 답변입니다.</p>
	    </div>
	    <div class="faq-item" id="faq-point-3">
	        <h2 class ="faq-question">7. 7번질문이에요.</h2>
	        <p class ="faq-answer">7번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item">
	        <h2 class ="faq-question">8. 8번질문이에요.</h2>
	        <p class ="faq-answer">4번 답변입니다.</p>
	    </div>
	    <div class="faq-item">
	        <h2 class ="faq-question">9. 9번질문이에요.</h2>
	        <p class ="faq-answer">9번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item">
	        <h2 class ="faq-question">10. 10번질문이에요.</h2>
	        <p class ="faq-answer">10번 답변입니다.</p>
	    </div>
	    <div class="faq-item" id="faq-point-4">
	        <h2 class ="faq-question">11. 11번질문이에요.</h2>
	        <p class ="faq-answer">11번 답변입니다.</p>
	    </div>
	
	    <div class="faq-item">
	        <h2 class ="faq-question">12. 12번질문이에요.</h2>
	        <p class ="faq-answer">12번 답변입니다.</p>
	    </div>
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
            })
        })
    })
    


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
