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

    <title>이벤트 게시판</title>
    <style>
        body{
            font-family: "Arial", "Helvetica", sans-serif;
        }
        #wrap{
            width: 1000px;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 100px;
        }
        #main-banner-img{
            width: fit-content;
            height: 400px;
        }
        .carousel-inner img {
        width: 100%;
        height: 100%;
        overflow: hidden;
        margin: auto;
        }
        #event-div-1{
            width: 1000px;
            height: 50px;
            border-bottom: 5px solid rgb(50, 96, 68);
        }   
        #event-div-2{
            width: 1000px;
            height: auto;
            background-color: antiquewhite;
        }
        .li-content{
            list-style: none;
        }
      </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/include/header.jsp" />
    <div id="wrap">
        <div id="main-banner-img">
            <div id="demo" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                  <li data-target="#demo" data-slide-to="0" class="active"></li>
                  <li data-target="#demo" data-slide-to="1"></li>
                  <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                
                <!-- The slideshow -->
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="#" alt="" width="1000" height="400">
                  </div>
                  <div class="carousel-item">
                    <img src="#" alt="" width="1000" height="400">
                  </div>
                  <div class="carousel-item">
                    <img src="#" alt="" width="1000" height="400">
                  </div>
                </div>
                
                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                  <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                  <span class="carousel-control-next-icon"></span>
                </a>
              </div>
        </div>

        <div id="event-div-1">
            <h2 style="margin-bottom: 10px;">진행중인 이벤트</h2>
        </div>

        <div id="event-div-2" style="margin-top: 50px;">
            <li class="li-content">
                <img src="" alt="#" style="width: 250px; height: 250px; display: inline; float: left;">
            </li>
            <li class="li-content">
                <img src="" alt="#" style="width: 250px; height: 250px; display: inline; float: left;">
            </li>
            <li class="li-content">
                <img src="" alt="#" style="width: 250px; height: 250px; display: inline; float: left;">
            </li>
            <li class="li-content">
                <img src="" alt="#" style="width: 250px; height: 250px; display: inline; float: left;">
            </li>
            
        </div>

    </div>
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
</body>
</html>