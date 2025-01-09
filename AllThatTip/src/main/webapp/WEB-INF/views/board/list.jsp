<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    
    
    <style>
        .content {
            width:1200px;
            margin: 0 auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:100%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
        
        .write-button {
        display: block;
        margin: 0 auto;
        padding: 8px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #326044;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
	    }
	
	    .write-button:hover {
	        background-color: #444;
	    }
    </style>
</head>
<body>
		<jsp:include page="../common/include/header.jsp" />
		<div class="content">
		   <br><br>
		   <div class="innerOuter" style="padding:5% 10%;">
		<h2>공지사항</h2>
		<br>
		<c:if test="${not empty sessionScope.loginUser and board.boardType == 10}">
			<a class="write-button style=" style="float:right;"  href="/att/board/insertForm?boardType=10">글쓰기</a>
		</c:if>
		
        
		<br><br>
		<table id="boardList" class="table table-hover" align="center">
		    <thead>
		        <tr>
		            <th>글번호</th>
		            <th>제목</th>
		            <th>작성자</th>
		            <th>조회수</th>
		            <th>작성일</th>
		        </tr>
 </thead>
		    
		    
<tbody>
		    	<c:forEach items="${boards}" var="board">
							<tr onclick="detail('${board.boardNo}')"> 
							<td>${board.boardNo}</td>
							<td>${board.boardTitle}</td>
							<td>${board.boardWriter}</td>
							<td>${board.count}</td>
							<td>${board.createDate}</td>
							</tr>
				</c:forEach>

		           
		           
       </table>
		<br>
</tbody>

        <div id="pagingArea">
		    <ul class="pagination">
		        <!-- 이전 페이지 버튼 -->
		        <c:choose>
		            <c:when test="${pageInfo.currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link"
		                       href="list?boardType=${board.boardType}&page=${pageInfo.currentPage - 1}">
		                        이전
		                    </a>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item disabled">
		                    <a class="page-link" href="#">이전</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		
		        <!-- 페이지 번호 버튼 -->
		        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="num">
		        
		         	<c:choose>
		         		<c:when test="${ empty board.condition }">
		         			<li class="page-item <c:if test='${pageInfo.currentPage == num}'>active</c:if>'">
		                		<a class="page-link" href="list?boardType=${board.boardType}&page=${num}">
				                    ${num}
				                </a>
				            </li>
		         		</c:when>
		         		<c:otherwise>												
		         			<li class="page-item <c:if test='${pageInfo.currentPage == num}'>active</c:if>'">
		                		<a class="page-link" href="list?boardType=${board.boardType}&page=${num}&condition=${board.condition}&keyword=${board.keyword}">
				                    ${num}
				                </a>
				            </li>
		         		</c:otherwise>
		         	</c:choose>
		        </c:forEach>
		
		        <!-- 다음 페이지 버튼 -->
		        <c:choose>
		            <c:when test="${pageInfo.currentPage < pageInfo.maxPage}">
		                <li class="page-item">
		                    <a class="page-link"
		                       href="list?boardType=${board.boardType}&page=${pageInfo.currentPage + 1}">
		                        다음
		                    </a>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item disabled">
		                    <a class="page-link" href="#">다음</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		    </ul>
		</div>


            <br clear="both"><br>

            <form id="searchForm" action="/att/board/list" method="get" align="center">
            	<input type="hidden" name="boardType" value="${ board.boardType }" />
                <div class="select">
                    <select class="custom-select" name="condition" id="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" id="keyword" />
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>

    </div>
    
    <script>
		function detail(num) {
			//console.log(num);
			
			const boardType = '${board.boardType}';
			// console.log("boardNo:", num, "boardType:", boardType); 
			window.location.href = '/att/board/list/'+num+'?boardType=' + boardType;
		}
		
		
       
  
			
	</script>
	
	
    <script>
   
 
    /* // 검색하기 ajax
 	function search(){
 		const select = document.getElementById('condition');
 		const condition = select.options[select.selectedIndex].value;
 		console.log("Condition:", condition);
 		console.log("Keyword:", document.getElementById('keyword').value);
 		console.log("BoardType:", "${ board.boardType }");
 		
 		$.ajax({
 			url: '/att/board/search',
			type: 'get',
			data: {
				 	condition: condition, 
	                keyword: document.getElementById('keyword').value,
	                boardType: "${ board.boardType }"
	        },
	        success: function(result) {
	            console.log(result); 
	            
	            
	            const boards = result.boards;
	            const pi = result.pi;
	            const boardType = result.boardType;
	            const condition = result.condition;
	            const keyword = result.keyword;
	            console.log(pi, boardType, condition, keyword);
	            const tableBody = document.querySelector("#boardList tbody");
	            
	            const preURL = "list?boardType="+boardType+"&page=\${pi.currentPage - 1}&condition="+condition+"&keyword="+keyword;
	            const nextURL = "list?boardType="+boardType+"&page=\${pi.currentPage + 1}&condition="+condition+"&keyword="+keyword;
	            const pageURL = "list?boardType="+boardType+"&page=\${num}&condition="+condition+"&keyword="+keyword;
	            console.log(pageURL);
	            const pagingArea = document.querySelector('#pagingArea');
	            // console.log(pagingArea);
	            
	            tableBody.innerHTML = "";
	            
	            // 검색 결과가 있을때
	            if (boards && boards.length > 0) {
	                boards.forEach(board => {
	                    
	                    var row = '';
	                        row += '<tr onclick="detail('+board.boardNo+')")>'
			                row += '   <td>'+board.boardNo+'</td>'
			                row += '     <td>'+board.boardTitle+'</td>'
			                row += '     <td>'+board.boardWriter+'</td>'
			                row += '     <td>'+board.count+'</td>'
			                row += '     <td>'+board.createDate+'</td>'
			                row += ' </tr>'
	                    ;
	                    tableBody.innerHTML += row; 
	                });
 					
 					pagingArea.innerHTML = ` <ul class="pagination">
						 				        <!-- 이전 페이지 버튼 -->
						 				        <c:choose>
						 				            <c:when test="\${pi.currentPage > 1}">
						 				                <li class="page-item">
						 				                    <a class="page-link"
						 				                       href='preURL'>
						 				                        이전
						 				                    </a>
						 				                </li>
						 				            </c:when>
						 				            <c:otherwise>
						 				                <li class="page-item disabled">
						 				                    <a class="page-link" href="#">이전</a>
						 				                </li>
						 				            </c:otherwise>
						 				        </c:choose>
						 				
						 				        <!-- 페이지 번호 버튼 -->
						 				        <c:forEach begin="1" end="4" var="num">
						 				            <li class="page-item" <c:if test='\${pi.currentPage} == num'>active</c:if>>
						 				                <a class="page-link"
						 				                   href='pageURL'>
						 				                    ${num}
						 				                </a>
						 				            </li>
						 				        </c:forEach>
						 				
						 				        <!-- 다음 페이지 버튼 -->
						 				        <c:choose>
						 				            <c:when test="\${pi.currentPage < pi.maxPage}">
						 				                <li class="page-item">
						 				                    <a class="page-link"
						 				                       href='nextURL'>
						 				                        다음
						 				                    </a>
						 				                </li>
						 				            </c:when>
						 				            <c:otherwise>
						 				                <li class="page-item disabled">
						 				                    <a class="page-link" href="#">다음</a>
						 				                </li>
						 				            </c:otherwise>
						 				        </c:choose>
						 				    </ul>`;
						 				    
					document.querySelector('option[value='+condition+']').selected = true;
	            } else {
	                // 검색 결과가 없을때
	                tableBody.innerHTML = `<tr>
	                       					 <td colspan="5">검색 결과가 없습니다.</td>//
	                   						</tr>`;
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	        }
	    });
	} */
 	</script>
    
    <script>
	    // 세션의 alertMsg 출력 후 제거
	    <c:if test="${not empty sessionScope.alertMsg}">
	        alert("${sessionScope.alertMsg}");
	        <c:set var="alertMsg" value="" scope="session"/>
	    </c:if>
	</script>
    
    
	<jsp:include page="../common/include/footer.jsp" />
</body>
</html>