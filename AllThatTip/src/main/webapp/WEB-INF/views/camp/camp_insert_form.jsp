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
		margin: auto;
	}
	
	.info-div{
		width: 100%;
		height: 80px;
		align-content: center;
	}
	
	.title-img-div{
		height: 200px;
	}
	
	.img-div{
		margin: 5px;
	}
	
	.img-div>img{
		display: block;
		width: 300px;
		height: 120px;
	}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	<div class="form-div">
        <form action="/att/camps/insert" method="post" enctype="multipart/form-data">
        	<fieldset>
				<legend>캠핑장 등록</legend> 
				<div class="info-div">
		            캠핑장 이름 : <input type="text" name="campName" required> <br>
        		</div>
        		<div class="info-div">
	            	캠핑장 주소 : 
        		</div> 
        		<div class="info-div">
		            <textarea name="campAddr" cols="150" rows="4.5" required></textarea>
	            </div>
	            <div class="info-div">
	            	캠핑장 설명 : 
        		</div> 
        		<div class="info-div">
		            <textarea name="campDesc" cols="150" rows="4.5" required></textarea>
	            </div> 
	            <div class="info-div title-img-div">
	            	<div>
		            	캠핑장 대표 이미지 : <br> <input type="file" name="upfile" required onchange="loadImg(this, 1);">
	             	</div>
	             	<div class="img-div">
	             		<img alt="" src="/att/resources/img/room/uploadimg.png" id="title-img">
	             	</div>
	            </div>      	
            	<button type="submit">등록</button> <button type="reset">초기화</button> <input type="button" value="취소" onclick="backToMain();">
        	</fieldset>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />	
    <script>
    	function backToMain(){
    		location.href = '/att';
    	}
    	
    	function loadImg(inputFile, num){
			if(inputFile.files.length === 1){
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					const url = e.target.result;
					switch(num){
					case 1 : document.getElementById('title-img').src = url; break;
					}
				};
			} else{
				const emptyImg = '/att/resources/img/room/uploadimg.png';
				switch(num){
				case 1 : document.getElementById('title-img').src = emptyImg; break;
				}
			}
   		}
    </script>
    
</body>
</html>