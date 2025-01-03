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
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        .comment-delete-btn {
		    background-color: #326044;
		    color: white;
		    border: none;
		    padding: 8px 12px; /* 크기를 줄임 */
		    font-size: 13px;
		    border-radius: 5px; /* 모서리를 둥글게 */
		}

        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>
<jsp:include page="../common/include/header.jsp" />
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>
            <a class="btn btn-secondary" style="float:right;" href="/att/board/list?boardType=${board.boardType}">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="6">${board.boardTitle}</td> 	<!-- Map에 담은 key값 기재. board. -->
                </tr>
                <tr>
                    <th>작성자</th><td colspan="1"></td>
                    <td>${board.userNo}</td>
                    <th>작성일</th>
                    <td colspan="3">${board.createDate}</td>
                </tr>
                <tr>
                    <th scope="row">첨부파일</th>
                    <td id="files" colspan="1">
                    <c:choose>
	 					<c:when test="${ empty board.fileList }">                   
		                    <td colspan="3">
		                    	첨부파일이 존재하지 않습니다.
		                    </td>
	 					</c:when>
	 					<c:otherwise>
	 						<c:forEach items="${ board.fileList }" var="file">
							    <td colspan="5">
			                        <a href="${ file.changeName }" download="${ file.originName }">${file.originName}</a>
			                    </td>
							</c:forEach>
	                    </c:otherwise>
 					</c:choose>
                </tr>
                
                
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="10"><p style="height:150px;">${ board.boardContent }</p></td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
               
                <a class="btn btn-primary" onclick="postSubmit(1);">수정하기</a>
                <a class="btn btn-danger" onclick="postSubmit(2);">삭제하기</a>
             
            </div>
            
            <form action="/att/board/list/update" method="post" id="postForm">
            	<input type="hidden" name="boardType" value="${param.boardType}">
            	<input type="hidden" name="boardNo" value="${ board.boardNo }" />
            	<input type="hidden" name="changeName" value="${ board.changeName }" />
            	<input type="hidden" name="boardWriter" value="${ board.boardWriter }" />
            		<!-- 사실.. 인터셉터 안쓰면 히든으로 userId넘기는거 이거 필수야. boardNo랑 현재 로그인한사람이랑 같은지 비교해야지
            
            	 -->
            </form>
		
            <script>
            	function postSubmit(num) {
            		const boardNo = $('input[name="boardNo"]').val(); 
            		const boardType = $('input[name="boardType"]').val();
				
            		if(num == 1){
            			$('#postForm').attr('action', '/att/board/list/update-form').submit();
            		} else { 
            			$('#postForm').attr('action', '/att/board/list/delete').submit();
            		}
				}
            </script>
            
            
            <!-- 
            	case 1: 수정하기 누르면 수정할 수 있는 입력 양식이 있어야함
            			입력양식에는 원본 게시글 정보들이 들어있어야함
            			
            	case 2: 삭제하기 누르면 Board테이블에 가서 STAUS 컬럼 'N'으로 바꾸고
            			혹시 첨부파일도 있었다면 같이 지워줌
            
             -->
            
            <br><br>

            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
            <table id="CommentArea" class="table" align="center">
                <thead>
                
                	<!-- 비회원 노출 영역 
                	<c:choose>
	                	<c:when test="${ empty sessionScope.loginUser }">
	                	
	                    <tr>
	                        <th colspan="2">
	                            <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용 가능합니다.</textarea>
	                        </th>
	                        <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th> 
	                    </tr>
	                    </c:when>
	                    <c:otherwise>
	                    <tr>
	                     <th colspan="2">
	                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
	                        </th>
	                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addComment();">등록하기</button></th> 
	                    </tr>
	                    </c:otherwise>
                    </c:choose>
                    비회원으로 일단하자..--> 
                    
                    
                    <tr>
					    <th colspan="2">
					        <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
					    </th>
					    <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addComment();">등록하기</button></th> 
					</tr>
                    
                    
                    
                    
                    
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                
                
                
                
                
                <tbody>
                   
                   
                </tbody>
            </table>
        </div>
        <br><br>

    </div>
    
    <script>
    
    	
    	// 댓글 리스트 호출
    	$(function(){
    		// alert(${board.boardNo})
    		selectComment();
    	})
    	
    	function addComment() {
			
    		if($('#content').val().trim() != ''){
    			
    			$.ajax({
    				url: '/att/comment',
    				type: 'post',
    				data: {
    					 	boardNo: ${board.boardNo}, 
    		                commentContent: $('#content').val(),
    		                userNo: '1' // 테스트용 사용자 번호 추후 로그인세션으로 변경하기
    		        },
    				success: function(result) {
						
    					console.log(result);
    					
    					if(result.data === 1){
    						$('#content').val(''); 
    					}
    						selectComment();
    						$('html, body').animate({ scrollTop: $('#CommentArea').offset().top }, 'slow');
					}
    				
    			});
    		}
		}
		

    	// 댓글목록
    	function selectComment(){
    		
    		$.ajax({
    			url: '/att/comment',
    			type: 'get',
    			data: {
    				boardNo : ${board.boardNo}
    			},
    			success: function(result){
    				
    				// console.log(result);
    				
    				const replies = [...result.data];
    				// console.log(replies);
    				
    				const resultStr = replies.map(e => 
								    					`<tr>
								    					<td>\${e.userId}</td>
								    					<td>\${e.commentContent}</td>
								    					<td>\${e.createDate}</td>
								    					<td>
							                            <button class="comment-delete-btn" onclick="deleteByComment(\${e.commentNo});">삭제</button>
							                        	</td>
														</tr>`    					
								    				).join('');
    				
    				$('#CommentArea tbody').html(resultStr);
    				$('#rcount').text(result.data.length);
    			}
    		});
    		
    	}
    	
    	
    	// 댓글삭제
    	function deleteByComment(commentNo) {
    		if(confirm('댓글을 삭제하시겠습니까?')){
    			$.ajax({
    				url: '/att/comment/delete',
    				type: 'post',
    				data:{
    					commentNo: commentNo
    				},
    				success: function(result){
    					// console.log(result);
    					if(result.data === 1){
	   						alert('댓글이 삭제되었습니다.');
	   		            }
	                    selectComment(); // 삭제 후 댓글 목록 갱신
	   		        },
   		            error: function(xhr, status, error) {
   		                // console.log('댓글 삭제 오류:' + error);
   		                alert('댓글 삭제 중 오류가 발생했습니다.');
   		            }
   		        });
   		    }
   		}
    	
    	
    	
    </script>
    
    
    <jsp:include page="../common/include/footer.jsp" />
</body>
</html>