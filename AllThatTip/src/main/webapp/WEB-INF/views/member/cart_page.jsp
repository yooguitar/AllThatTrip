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

    <title>장바구니</title>
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
            width: 750px;
            height: auto;
        }
        #cart-div-2 > li{
            list-style: none;
        }
        #cart-div-3{
            width: 250px;
            height: 700px;
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
            <h1 style="margin-bottom: 10px;">장바구니</h1>
        </div>

        <div id="cart-div-2" class="cart-div" style="margin-top: 100px;">
            <c:choose>
                <c:when test="${ sessionScope.findCartResult eq null }">
                    <!--예약 내역이 없을 경우 보여질 div-->
                    <li id="content-empty">  
                        <div class="content-div-temp">
                            <h3 style="text-align: center;">예약 내역이 없습니다.</h3>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <!--예약 내역이 있을 경우 div 반복-->
                    <li>
                        <div class="content-div-temp" style="border-bottom: 3px dotted gainsboro;">
                            <div style="width: 40px; display: inline; float: left;">
                                &nbsp;
                                <input type="checkbox" style="margin-top: 110px; accent-color: white;" checked>&nbsp;
                            </div>
                            <div style="display: inline; float: left;">
                                <img src="${ findCartResult[0].CHANGE_NAME }" alt="" style="width: 220px; height: 220px; margin-top: 10px;">
                            </div>
                            <div style="display: inline; float: left; width: 150px; height: fit-content; margin-top: 100px; margin-left: 50px; overflow-wrap: break-word;">
                                <a href="#" style="color:black; text-decoration: none;">${ findCartResult[0].ROOM_NAME }</a>
                            </div>
                            <div style="display: inline; float: left; width: 150px; height: fit-content; margin-top: 100px; margin-left: 50px; overflow-wrap: break-word;">
                                <a href="#" style="color: black; text-decoration: none;">${ findCartResult[0].ROOM_PRICE }&nbsp;원</a>
                            </div>
                        </div>
                    </li>
                </c:otherwise>
            </c:choose>
                
        </div>
        <c:forEach var="cartList" items="${ sessionScope.findCartResult }">
            <div id="cart-div-3" class="cart-div">
                <div style="height: 250px;">
                    <table style="margin: auto; vertical-align: auto;">
                        <br>
                        <th>주문하실 상품(checked)
                            <tr>
                                <td>목록1</td>
                                <td>가격</td>
                            </tr>
                            <tr>
                                <td>목록2</td>
                                <td>가격</td>
                            </tr>
                        </th>
                    </table>
                </div>
                <div style="border-top: 3px solid rgb(50, 96, 68);">
                    <table style="margin: auto;">
                        <br>
                        <tr style="font-weight: 800;">
                            <td>총계:&nbsp;</td>
                            <td>원</td>
                        </tr>    
                    </table>
                </div>
                <br><br>
                <button onclick="" id="submit-btn-fin" class="btn btn-primary" style="width: 250px; height: 60px; background-color:rgb(50, 96, 68); border:rgb(50, 96, 68);">주문하기</button>
            </div>
        </c:forEach>
            
        </div>
    
</body>
</html>