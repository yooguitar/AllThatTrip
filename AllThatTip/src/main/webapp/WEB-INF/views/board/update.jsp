<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판 수정</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
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

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
    <jsp:include page="../common/include/header.jsp" />    


    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="/att/board/list/update" enctype="multipart/form-data">
                <input type="hidden" name="boardNo" value="${ board.boardNo }" />
                <input type="hidden" name="boardType" value="${ board.boardType }" />
                <table align="center">
                    <tr>
		            <th><label for="title">제목</label></th>
		            <td><input type="text" id="title" class="form-control" value="${ requestScope.board.boardTitle }" name="boardTitle" required></td>
		        </tr>
		        <tr>
		            <th><label for="writer">작성자</label></th>
		            <td><input type="text" id="writer" class="form-control" value="${ requestScope.board.boardWriter }" name="boardWriter" readonly></td>
		        </tr> 
		        
		        <!-- 첨부파일 조건 처리 -->
		        <c:choose>
		            <c:when test="${board.boardType == 10}"> <!-- 첨부파일 1개 -->
		                <tr>
		                    <th><label for="upfile1">첨부파일1</label></th>
		                    <td>
		                        <input type="file" id="upfile1" class="form-control-file border" name="upfiles" multiple>
		                        <c:if test="${ not empty board.originName }">
		                            현재 업로드된 파일: 
		                            <a href="${ board.changeName }" download="${ board.originName }">${ board.originName }</a>
		                            <input type="hidden" value="${ board.originName }" name="originName" />
		                            <input type="hidden" value="${ board.changeName }" name="changeName" />
		                        </c:if>
		                    </td>
		                </tr>
		            </c:when>
		            <c:when test="${board.boardType == 20}"> <!-- 첨부파일 없음 -->
		                <!-- 첨부파일 필드 없음 -->
		            </c:when>
		            <c:otherwise> <!-- 첨부파일 4개 -->
		                <tr>
		                    <th><label for="upfile1">첨부파일1</label></th>
		                    <td>
		                        <input type="file" id="upfile1" class="form-control-file border" name="upfiles" multiple>
		                        <c:if test="${ not empty board.originName }">
		                            현재 업로드된 파일: 
		                            <a href="${ board.changeName }" download="${ board.originName }">${ board.originName }</a>
		                            <input type="hidden" value="${ board.originName }" name="originName" />
		                            <input type="hidden" value="${ board.changeName }" name="changeName" />
		                        </c:if>
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="2" style="text-align: left;">
		                        <li style="color: red; font-size: 0.7em; list-style-type: none; margin-left: 180px;">
		                            * 첨부파일 1번 등록 시 게시글 썸네일로 등록됩니다.
		                        </li>
		                    </td>
		                </tr>
		                <tr>
		                    <th><label for="upfile2">첨부파일2</label></th>
		                    <td><input type="file" id="upfile2" class="form-control-file border" name="upfiles" multiple></td>
		                </tr>
		                <tr>
		                    <th><label for="upfile3">첨부파일3</label></th>
		                    <td><input type="file" id="upfile3" class="form-control-file border" name="upfiles" multiple></td>
		                </tr>
		                <tr>
		                    <th><label for="upfile4">첨부파일4</label></th>
		                    <td><input type="file" id="upfile4" class="form-control-file border" name="upfiles" multiple></td>
		                </tr>
		            </c:otherwise>
		        </c:choose>
		
		        <tr>
		            <th><label for="content">내용</label></th>
		            <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required>${ requestScope.board.boardContent }</textarea></td>
		        
		        </tr>
		    </table>
		    <br>

                <div align="center">
				    <button type="submit" class="btn btn-primary">수정하기</button>
				    <button type="button" class="btn btn-danger" onclick="history.back();">이전으로</button>
				</div>

            </form>
        </div>
        <br><br>

    </div>
    

    <jsp:include page="../common/include/footer.jsp" />
</body>
</html>