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
	
	.info-div{
		width: 100%;
		height: 80px;
		align-content: center;
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
	
	.img-div{
		margin: 5px;
	}
	
	.title-img-div{
		height: 200px;
	}
	
	.sub-img-div{
		height: 330px;
	}
	
	.sub-img-div>.info-div{
		width: 33.3%;
		height: 100%;
		margin-top: -50px;
		float: left;
	}
	
	input[type=checkbox]{
		display: none;
	}

	form .checkDiv{
		float: left;
		margin: 5px;
		border: 1px solid;
	}
	
	.checkDiv span{
		display: block;
		text-align: center;
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
        <fieldset>
        	<legend>숙소 수정</legend>
        	<form action="/att/rooms/update" method="post" enctype="multipart/form-data">
	            <div class="info-div">
		            숙소 이름 : <input type="text" name="roomName" value="${ room.roomName }" required> <br>
        		</div>
	            <div class="info-div">
		            숙소 설명 : 
	            </div>
	            <div class="info-div">
		            <textarea name="roomDesc" cols="150" rows="4.5" required>${ room.roomDesc }</textarea>
	            </div>
	            <div class="info-div">
	           	 	숙소 가격 : <input type="number" name="roomPrice" value="${ room.roomPrice }" required>원
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
	            <div class="info-div title-img-div">
	            	<div>
		            	현재 등록된 숙소 대표 이미지 : <br>
	             	</div>
	             	<div class="img-div">
	             		<c:forEach items="${ roomImg }" var="img">
			        		<c:if test="${ img.fileLevel eq 1 }">
					            <img src="/att${ img.changeName }" alt="대표 이미지">
			        		</c:if>
			        	</c:forEach>
	             	</div>
	            </div>
	            <div class="info-div title-img-div">
	            	<div>
		            	변경할 숙소 대표 이미지 : <br> <input type="file" name="upfile" onchange="loadImg(this, 1);">
	             	</div>
	             	<div class="img-div">
	             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="title-img">
	             	</div>
	            </div>
			    <hr>
			    <div class="sub-img-div">
		            <c:forEach items="${ roomImg }" var="img">
			            <c:if test="${ img.fileLevel ne 1 }">
					   	 <div class="info-div">
			            		<div>
				            		현재 등록된 숙소 내부 및 주변 이미지 ${ img.fileLevel -1 } :
			            		</div>
			            		<div class="img-div">
						            <img src="/att${ img.changeName }" alt="주변 및 숙소 내부 이미지">
			            		</div>
					            <div class="info-div">
					            	<div>
						            	변경할 숙소 내부 및 주변 이미지 ${ img.fileLevel -1 } : <br> <input type="file" name="upfile" onchange="loadImg(this, ${ img.fileLevel });">
					             	</div>
					             	<div class="img-div">
					             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="title-img">
					             	</div>
					            </div>
				            </div>
			        	</c:if>
		            </c:forEach>
			    </div>
				<hr>
	            
	        	<input type="hidden" name="roomNo" value="${ room.roomNo }" />
	           		         
	            <br><br>
	            <button type="submit">수정</button> <input type="button" value="취소" onclick="backToList();">
        	</form>
        </fieldset>
    </div>
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
    
    <script>
    function backToList(){
		location.href = '/att/rooms/detail?roomNo=${ room.roomNo }';
	}
    
    window.onload = function(){
    	
    	const inputCount = document.getElementsByName('roomThemeNo').length;
		const list = [];
		
    	<c:forEach items="${ roomTheme }" var="theme">
    		list.push('${ theme.themeNo }');
    	</c:forEach>
    	
    	let selected = null;
    	for(let i = 0; i < inputCount; i++){
    		selected = document.querySelector('input[value = "' + list[i] + '"]');
    		if(selected != null){
    			selected.checked = true;
    			selected.parentElement.classList.add('selected');
    		}
    	}
	}
    
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