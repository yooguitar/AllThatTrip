<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css"/>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

	body{
		margin: 0px;
	}
	
	.modal{
		position: fixed;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0;
		left: 0;
		width: 100%;  
		height: 100%;
		margin: auto;
		background-color: rgba(255,255,255,0.8);
	}
	
	.modal_body{
		position: absolute;
		top: 50%;
		width: 200px;  
		height: 300px; 
        padding: 40px;  
        text-align: center;
        background-color: rgb(255,255,255);
        border-radius: 10px; 
        box-shadow: 0 2px 3px 0 rgba(34,36,38,0.15); 
        transform: translateY(-50%); 
	}
	
	.detail-div{
		width: 1200px;
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
	
	<div class="detail-div">
		<fieldset>
			<legend>캠핑장 상세 정보</legend>
			<div class="info-div">
				캠핑장 이름 : <span>${ camp.campName }</span>
			</div>
			<div class="info-div">
				캠핑장 주소 : 
				<p>${ camp.campAddr }</p>
			</div>
			<div class="info-div">
				캠핑장 설명 : 
				<p>${ camp.campDesc }</p>
			</div>
			<br>
	        <div class="title-img-div">
       			<div>
		            대표 이미지 : 
       			</div>
       			<div class="img-div">
		            <img src="/att${ camp.changeName }" alt="대표 이미지">
       			</div>
	        </div>
	        <button onclick="updateCamp(${camp.campNo});">정보 수정</button> <button class="btn-open-modal">캠핑장 삭제</button> <br><br>
		</fieldset>
	</div>
	
	<div class="modal" id="deleteCampModal">
        <div class="">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="">캠핑장 삭제</h4>
                </div>
        
                <form action="/att/camps/delete" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                    	<div class="reason">
	                    	<label for="deleteReason" class="">삭제 이유 : </label>
	                        <input type="text" class="" id="deleteReason" name="deleteReason">
                    	</div>
                        <br> 정말로 삭제 하시려면 <br> '삭제하겠습니다.' 를 입력해주세요. <br><br>
                        <label for="check" class="">입력란 : </label>
                        <input type="text" class="" id="check" name="check">
                    </div>
                    <br> 
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    	<input type="hidden" name="campNo" value="${ camp.campNo }">
                    	<input type="hidden" name="changeName" value="${ camp.changeName }">
                        <button type="submit" class="" id="deleteCamp" disabled>삭제</button>
                        <button type="button" class="" id="cancle">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

	<script>
		const modal = document.querySelector('.modal');
	    const btnOpenModal = document.querySelector('.btn-open-modal');
	    btnOpenModal.addEventListener("click", () => {
	        modal.style.display="flex";
	    });
	    
	    const btnCancle = document.querySelector('#cancle');
	    btnCancle.addEventListener("click", () => {
	    	document.querySelector('#deleteReason').value = "";
	    	document.querySelector('#check').value = "";
	    	modal.style.display="none";
	    });
	    
		function updateCamp(campNo){
			// console.log(campNo);
			location.href = '/att/camps/update_form?campNo=' + campNo;
		}
		
		const check = document.getElementById('check');
		// console.log(check);
		check.addEventListener("keyup", function(){
			const checkVal = check.value;
			// console.log(checkVal);
			if(checkVal === '삭제하겠습니다.'){
				document.getElementById('deleteCamp').disabled = false;
			} else{
				document.getElementById('deleteCamp').disabled = true;
			}
		});
	</script>
	
</body>
</html>