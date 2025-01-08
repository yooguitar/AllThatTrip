<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	body{
		margin: 0px;
	}
	
	.form-div{
		width: 1200px;
		height: auto;
		margin: auto;
	}

	input[type=radio]{
		display: none;
	}
	
	input[type=checkbox]{
		display: none;
	}
	
	form .radioDiv{
		float: left;
	}
	
	form .checkDiv{
		float: left;
		margin: 5px;
		border: 1px solid;
	}
	
	.info-div{
		width: 100%;
		height: 80px;
		align-content: center;
	}
	
	.radioDiv span{
		display: block;
		text-align: center;
	}
	
	.checkDiv span{
		display: block;
		text-align: center;
	}
	
	.title-img-div{
		height: 200px;
	}
	
	.sub-img-div{
		height: 200px;
	}
	
	.sub-img-div>.info-div{
		width: 33.3%;
		height: 180px;
		float: left;
	}
	
	.img-div{
		margin: 5px;
	}
	
	.selected{
		border: 1px solid #326044;
		color: #60B557;
		font-weight: 800;
	}
	
	.img-div>img{
		display: block;
		width: 300px;
		height: 120px;
	}
	
	.radioImg{
		width: 90px;
		height: 40px;
	}
	
	.themeImg{
		width: 90px;
		height: 40px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	<div class="form-div">
        <form action="/att/rooms/insert" method="post" enctype="multipart/form-data">
        	<fieldset>
        		<legend>숙소 등록</legend>
        		<div class="info-div">
		            숙소 이름 : <input type="text" name="roomName" required> <br>
        		</div>
        		<div class="info-div">
	            	숙소 종류 : 
        		</div>
        		<div class="info-div">
		            <div class="radioDiv">
		            	<input type="radio" name="roomTypeNo" id="autoCamp" value=1 required>
		            	<label for="autoCamp">
		            		<img src="/att/resources/img/room/001.svg" alt="" class="radioImg">
		            		<span>오토 캠핑장</span>
		            	</label>
		            </div>
		            <div class="radioDiv">
		            	<input type="radio" name="roomTypeNo" id="glamping" value=2>
		            	<label for="glamping">
		            		<img src="/att/resources/img/room/002.svg" alt="" class="radioImg">
		            		<span>글램핑</span>
		            	</label>
		            </div>
		            <div class="radioDiv">
		            	<input type="radio" name="roomTypeNo" id="caravan" value=3>
		            	<label for="caravan">
		            		<img src="/att/resources/img/room/003.svg" alt="" class="radioImg">
		            		<span>카라반</span>
		            	</label>
		            </div>
		            <div class="radioDiv">
		            	<input type="radio" name="roomTypeNo" id="pension" value=4>
		            	<label for="pension">
		            		<img src="/att/resources/img/room/004.svg" alt="" class="radioImg">
		            		<span>펜션</span>
		            	</label>
		            </div>
	            </div>		  
	            <div class="info-div">
		            숙소 테마 :  
	            </div>
	            <div class="info-div">
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme1" value=1>
		            	<label for="theme1">
		            		<img src="/att/resources/img/room/101.svg" alt="" class="themeImg">
		            		<span>전기</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme2" value=2>
		            	<label for="theme2">
		            		<img src="/att/resources/img/room/102.svg" alt="" class="themeImg">
		            		<span>스파</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme3" value=3>
		            	<label for="theme3">
		            		<img src="/att/resources/img/room/103.svg" alt="" class="themeImg">
		            		<span>수영장</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme4" value=4>
		            	<label for="theme4">
		            		<img src="/att/resources/img/room/104.svg" alt="" class="themeImg">
		            		<span>컴퓨터</span>
		            	</label>
		            </div>
	            </div>
	            <div class="info-div">
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme5" value=5>
		            	<label for="theme5">
		            		<img src="/att/resources/img/room/105.svg" alt="" class="themeImg">
		            		<span>카페</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme6" value=6>
		            	<label for="theme6">
		            		<img src="/att/resources/img/room/106.svg" alt="" class="themeImg">
		            		<span>주차가능</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme7" value=7>
		            	<label for="theme7">
		            		<img src="/att/resources/img/room/107.svg" alt="" class="themeImg">
		            		<span>당구장</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme8" value=8>
		            	<label for="theme8">
		            		<img src="/att/resources/img/room/108.svg" alt="" class="themeImg">
		            		<span>온수</span>
		            	</label>
		            </div>
	            </div>
	            <div class="info-div">
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme9" value=9>
		            	<label for="theme9">
		            		<img src="/att/resources/img/room/109.svg" alt="" class="themeImg">
		            		<span>화장실</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme10" value=10>
		            	<label for="theme10">
		            		<img src="/att/resources/img/room/110.svg" alt="" class="themeImg">
		            		<span>에어컨</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme11" value=11>
		            	<label for="theme11">
		            		<img src="/att/resources/img/room/111.svg" alt="" class="themeImg">
		            		<span>와이파이</span>
		            	</label>
		            </div>
		            <div class="checkDiv">
		            	<input type="checkbox" name="roomThemeNo" id="theme12" value=12>
		            	<label for="theme12">
		            		<img src="/att/resources/img/room/112.svg" alt="" class="themeImg">
		            		<span>샤워시설</span>
		            	</label>
		            </div>
	            </div>
	            <div class="info-div">
		            숙소 설명 : 
	            </div>
	            <div class="info-div">
		            <textarea name="roomDesc" cols="150" rows="4.5" required></textarea>
	            </div>
	            <div class="info-div">
	           	 	숙소 가격 : <input type="number" name="roomPrice" value=0 required>
	            </div>
	            <div class="info-div title-img-div">
	            	<div>
		            	숙소 대표 이미지 : <br> <input type="file" name="upfile" required onchange="loadImg(this, 1);">
	             	</div>
	             	<div class="img-div">
	             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="title-img">
	             	</div>
	            </div>
	            <div class="sub-img-div">
		             <div class="info-div">
		             	<div>
			            	숙소 내부 및 주변 이미지 1 : <br> <input type="file" name="upfile" required onchange="loadImg(this, 2);">
		             	</div>
		             	<div class="img-div">
		             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="sub-img1">
		             	</div>
		            </div>
		             <div class="info-div">
			            <div>
			            	숙소 내부 및 주변 이미지 2 : <br> <input type="file" name="upfile" required onchange="loadImg(this, 3);">
		             	</div>
		             	<div class="img-div">
		             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="sub-img2">
		             	</div>
		            </div>
		             <div class="info-div">
			            <div>
			            	숙소 내부 및 주변 이미지 3 : <br> <input type="file" name="upfile" required onchange="loadImg(this, 4);">
		             	</div>
		             	<div class="img-div">
		             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="sub-img3">
		             	</div>
		            </div>
	            </div>
	             <div class="info-div">
		            <button type="submit">등록</button> <button type="reset">초기화</button> <input type="button" value="취소" onclick="backToMain();">
	            </div>
        	</fieldset>
        	<input type="hidden" name="campNo" value="${ campNo }" />
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />	
    
    <script>
    	function backToMain(){
    		location.href = '/att';
    	}
    	
   		document.querySelectorAll('input[name="roomTypeNo"]').forEach(function(radio){
   			radio.addEventListener('change', function(){
   				document.querySelectorAll('input[name="roomTypeNo"]').forEach(function(r){
   					r.parentElement.classList.remove('selected');
   				});
   				if(this.checked){
   					this.parentElement.classList.add('selected');	
   				}
   			});
   		});
   		
   		document.querySelectorAll('input[name="roomThemeNo"]').forEach(function(check){
   			check.addEventListener('change', function(){
   				if(this.checked){
   					this.parentElement.classList.add('selected');	
   				} else{
   					this.parentElement.classList.remove('selected');
   				}
   			});
   		});
   		
   		function loadImg(inputFile, num){
			if(inputFile.files.length === 1){
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					const url = e.target.result;
					switch(num){
					case 1 : document.getElementById('title-img').src = url; break;
					case 2 : document.getElementById('sub-img1').src = url; break;
					case 3 : document.getElementById('sub-img2').src = url; break;
					case 4 : document.getElementById('sub-img3').src = url; break;
					}
				};
			} else{
				const emptyImg = '/att/resources/img/room/uploadimg.png';
				switch(num){
				case 1 : document.getElementById('title-img').src = emptyImg; break;
				case 2 : document.getElementById('sub-img1').src = emptyImg; break;
				case 3 : document.getElementById('sub-img2').src = emptyImg; break;
				case 4 : document.getElementById('sub-img3').src = emptyImg; break;
				}
			}
   		}
    </script>
    
</body>
</html>