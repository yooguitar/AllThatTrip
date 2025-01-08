<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
      
        #admin_page{
            margin : auto;
        }
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #326044;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }
        
        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #ffffff;
            display: block;
            transition: 0.3s;
        }
        
        .sidenav a:hover {
            color: #f1f1f1;
        }
        
        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }
        
        #ad_navi{
        
        	width  : 1200px;
        	height : 50px;
        	
        	background-color: #326044;
        	margin : auto;
        	margin-bottom : 15px;
        	border-radius : 0px 0px 5px 5px;
        }
        
        span{
        
        	margin-left : 10px;
        	
        
        }
        
        #h-logos > img{
        
        	width : 50px;
        	height : 50px;
        	margin-left : 575px;
        	margin-top : -55px;
        
        }
        
        
        @media screen and (max-height: 450px) {
          .sidenav {padding-top: 15px;}
          .sidenav a {font-size: 18px;}
        }
        
        
        </style>
 
</head>
<body id="admin_page">
<div id="ad_navi">
    <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/att/admin/admin_notice">공지사항</a>
  <a href="/att/adPad/controller">회원 조회</a>
  <a href="#">판매자 조회</a>
  <a href="#">게시글 조회</a>
  <a href="#">신고 목록 조회</a>
  <hr>
  <a href="#">관리자 권한</a>
  <a href="#">맛집 탐방</a>
  <hr>
  <a href="/att">메인 화면</a>

</div>


<span style="font-size:30px;color:white;cursor:pointer" onclick="openNav()">&#9776; </span>

<div id="h-logos"><img src="/att/resources/img/logo/ATTP.png"></div>


</div>

<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
    }
    
    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
    </script>


</body>
</html>