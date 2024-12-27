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
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
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

</style>

</head>
<body>
  <br>
  <div class="faq-container">
    <h1>자주 묻는 질문 (FAQ)</h1>
    <br><br>
    
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
    </form>

    <br><br>
    <div>
    <br><br>

    
    </from>
    </div>
    <div class="faq-item">
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

    <div class="faq-item">
        <h2 class ="faq-question">4. 4번질문이에요.</h2>
        <p class ="faq-answer">4번 답변입니다.</p>
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

    </script>
</body>
</html>
