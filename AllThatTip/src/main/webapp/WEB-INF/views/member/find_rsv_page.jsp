<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <title>예약내역 확인</title>
    <style>
        body{
            font-family: "Arial", "Helvetica", sans-serif;
        }
        #wrap{
            width: 1000px;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 100px;
        }
        #cart-div-1{
            width: 1000px;
            height: 50px;
            border-bottom: 5px solid rgb(50, 96, 68);
        }   
        #cart-div-2{
            width: 1000px;
            height: auto;
        }
        #cart-div-2 > li{
            list-style: none;
        }
        .cart-div{
            display: inline;
            float: left;
            overflow-wrap: break-word;
        }
        .content-div-temp{
            height: 250px;
        }
      </style>
</head>
<body>
    <div id="wrap">
        <div id="cart-div-1">
            <h1 style="margin-bottom: 10px;">예약 내역 조회</h1>
        </div>

        <div id="cart-div-2" class="cart-div" style="margin-top: 100px;">
            <!--찜 내역이 없을 경우 보여질 div-->
            <li id="content-empty">  
                <div class="content-div-temp">
                    <h3 style="text-align: center;">예약 내역이 없습니다. **display:none</h3>
                </div>
            </li>
            <!--찜 내역이 있을 경우 div 반복-->
            <li>
                <div class="content-div-temp" style="border-bottom: 3px dotted gainsboro;">
                    <div style="width: 40px; display: inline; float: left;">&nbsp;&nbsp;&nbsp;</div>
                    <div style="display: inline; float: left;">
                        <img src="https://m.thankqcamping.com/file/2024/03/07/2024030750360.84.jpg
                        " alt="" style="width: 220px; height: 220px; margin-top: 10px; background-color: grey;">
                    </div>
                    <div style="display: inline; float: left; width: 150px; height: fit-content; margin-top: 100px; margin-left: 150px; overflow-wrap: break-word;">
                        <a href="#" style="color:black; text-decoration: none;">상품명입력</a>
                    </div>
                    <div style="display: inline; float: left; width: 150px; height: fit-content; margin-top: 100px; margin-left: 50px; overflow-wrap: break-word;">
                        <a href="#" style="color: black; text-decoration: none;">가격입력</a>
                    </div>
                    <div>
                        <button onclick="" class="btn btn-primary" style="width: 120px; height: 40px; margin-top: 90px; margin-left: 50px; background-color:rgb(50, 96, 68); border:rgb(50, 96, 68);">예약 취소</button>
                    </div>
                </div>
            </li>
            <!-- 이건 더미 -->
            <li>
                <div class="content-div-temp" style="border-bottom: 3px dotted gainsboro;">
                    <div style="width: 40px; display: inline; float: left;">&nbsp;&nbsp;&nbsp;</div>
                    <div style="display: inline; float: left;">
                        <img src="https://m.thankqcamping.com/file/2024/03/07/2024030750360.84.jpg
                        " alt="" style="width: 220px; height: 220px; margin-top: 10px; background-color: grey;">
                    </div>
                    <div style="display: inline; float: left; width: 150px; height: fit-content; margin-top: 100px; margin-left: 150px; overflow-wrap: break-word;">
                        <a href="#" style="color:black; text-decoration: none;">목록2번</a>
                    </div>
                    <div style="display: inline; float: left; width: 150px; height: fit-content; margin-top: 100px; margin-left: 50px; overflow-wrap: break-word;">
                        <a href="#" style="color: black; text-decoration: none;">39,800원</a>
                    </div>
                    <div>
                        <button onclick="" class="btn btn-primary" style="width: 120px; height: 40px; margin-top: 90px; margin-left: 50px; background-color:rgb(50, 96, 68); border:rgb(50, 96, 68);">예약 취소</button>
                    </div>
                </div>
            </li>
        </div>


    </div>
    
</body>
</html>