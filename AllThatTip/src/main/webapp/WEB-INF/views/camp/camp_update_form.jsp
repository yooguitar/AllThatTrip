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
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	
	<div class="form-div">
        <form action="/att/camps/update" method="post" enctype="multipart/form-data">
            <fieldset>
				<legend>캠핑장 등록</legend> 
				<div class="info-div">
		            캠핑장 이름 : <input type="text" name="campName" required value="${ camp.campName }"> <br>
        		</div>
        		<div class="info-div">
	            	캠핑장 주소 : 
        		</div> 
        		<div class="info-div">
		            <textarea name="campAddr" cols="150" rows="4.5" required>${ camp.campAddr }</textarea>
	            </div>
	            <div class="info-div">
	            	캠핑장 설명 : 
        		</div> 
        		<div class="info-div">
		            <textarea name="campDesc" cols="150" rows="4.5" required>${ camp.campDesc }</textarea>
	            </div> 
	            <div class="info-div title-img-div">
	            	<div>
		            	캠핑장 대표 이미지 : <br>
	             	</div>
	             	<div class="img-div">
	             		<img src="/att${ camp.changeName }" alt="대표 이미지">
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
            	<button type="submit">수정</button> <button type="reset">초기화</button> <input type="button" value="취소" onclick="backToDetail();">
        	</fieldset>
            
        	<input type="hidden" name="campNo" value="${ camp.campNo }" />
           	<input type="hidden" name="originName" value="${ camp.originName }" />
			<input type="hidden" name="changeName" value="${ camp.changeName }" />
	         
        </form>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
    
    <script>
    function backToDetail(){
		location.href = '/att/camps/detail?campNo=${ camp.campNo }';
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