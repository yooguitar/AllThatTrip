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
	
	.sub-img-div{
		height: 120px;
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
	
	.checkDiv{
		float: left;
		margin: 5px;
		border: 1px solid;
		display: none;
	}
	
	.selected{
		display: flex;
	}
	
	.checkDiv span{
		display: block;
		text-align: center;
	}
	
	.themeImg{
		width: 80px;
		height: 40px;
	}
        
</style>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />
	<div class="detail-div">
		<fieldset>
			<legend>숙소 상세 정보</legend>
				<div class="info-div">
		            숙소 이름 : <span>${ room.roomName }</span>
        		</div>
        		<div class="info-div">
	            	숙소 종류 : <span>${ room.roomTypeName }</span>
        		</div>
        		<div class="info-div">
		            숙소 설명 : 
		            <p>${ room.roomDesc }</p>
	            </div>
	            <div class="info-div">
		            숙소 가격 : <span>${ room.price }</span>원
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
	            <br>
		        <div class="title-img-div">
		        	<c:forEach items="${ roomImg }" var="img">
		        		<c:if test="${ img.fileLevel eq 1 }">
			        		<div class="info-div">
			        			<div>
						            대표 이미지 : 
			        			</div>
			        			<div class="img-div">
						            <img src="/att${ img.changeName }" alt="대표 이미지">
			        			</div>
				            </div>
		        		</c:if>
			        </c:forEach>
		        </div>
		        <div class="sub-img-div">
		        	<c:forEach items="${ roomImg }" var="img">
		        		<c:if test="${ img.fileLevel ne 1 }">
				            <div class="info-div">
			        			<div>
						            숙소 내부 및 주변 이미지 ${ img.fileLevel - 1 } : 
			        			</div>
			        			<div class="img-div">
						            <img src="/att${ img.changeName }" alt="숙소 내부 및 주변 이미지">
			        			</div>
				            </div>
		        		</c:if>
			        </c:forEach>
		        </div>
		        <button onclick="updateRoom(${ room.roomNo });">정보 수정</button> <button class="btn-open-modal">숙소 삭제</button> <br><br>
		</fieldset>
	</div>
	
	<div class="modal" id="deleteCampModal">
        <div class="">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">숙소 삭제</h4>
                </div>
        
                <form action="/att/rooms/delete" method="post">
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
                    	<input type="hidden" name="roomNo" value="${ room.roomNo }">
                        <button type="submit" class="" id="deleteRoom" disabled>삭제</button>
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
	
		function updateRoom(roomNo){
			// console.log(campNo);
			location.href = '/att/rooms/update_form?roomNo=' + roomNo;
		}
		
		const check = document.getElementById('check');
		// console.log(check);
		check.addEventListener("keyup", function(){
			const checkVal = check.value;
			// console.log(checkVal);
			if(checkVal === '삭제하겠습니다.'){
				document.getElementById('deleteRoom').disabled = false;
			} else{
				document.getElementById('deleteRoom').disabled = true;
			}
		});
		
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
		
	</script>
	
</body>
</html>