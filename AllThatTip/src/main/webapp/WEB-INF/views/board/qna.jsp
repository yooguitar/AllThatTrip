<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="style.css">

    <style>

   
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;

    }

    .faq-container {
        width: 80%;
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

    .faq-navigation {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .faq-navigation ul {
        list-style: none;
        padding: 0;
        display: flex;
        gap: 20px;
    }

    .faq-navigation li {
        font-size: 16px;
        cursor: pointer;
    }

    

    .faq-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .faq-table th,
    .faq-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .faq-table th {
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
    
    <div class="faq-container">
        <h1>문의하기(Q&A)</h1>
        <nav class="faq-navigation">
            <ul>
                <li>NOTICE</li>
                <li>FAQ</li>
                <li>Q&A</li>
                <li>CLASS</li>
                <li>우앙</li>
            </ul>
        </nav>
 
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

  
    <br><br>
        <table class="faq-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>6</td>
                    <td>예약변경 및취소</td>
                    <td>작성자</td>
                    <td>취소해주세요</td>
                    <td>2020-11-12</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>이용방법</td>
                    <td>작성자</td>
                    <td>비상입니다</td>
                    <td>2024-12-24</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>이용방법</td>
                    <td>작성자</td>
                    <td>예약하고싶어요</td>
                    <td>2024-12-12</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>계정</td>
                    <td>작성자</td>
                    <td>비밀번호 찾는 방법</td>
                    <td>2024-12-11</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>이용방법</td>
                    <td>작성자</td>
                    <td>빨리급해요</td>
                    <td>2024-12-06</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>회원정보</td>
                    <td>작성자</td>
                    <td>배송지 변경 어떻게하나요?</td>
                    <td>2024-12-01</td>
                </tr>
            </tbody>
        </table>
        <button class="write-button">글쓰기</button>
    </div>
</div>


    <jsp:include page="../common/include/footer.jsp" />
</body>
</html>
