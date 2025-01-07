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
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${ requestScope.board.boardTitle }" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ requestScope.board.boardWriter }" name="boardWriter" readonly></td>
                    </tr> 
                    <tr>
                        <th><label for="upfile">첨부파일1</label></th>
                        <td>
                            <input type="file" id="upfiles" class="form-control-file border" name="upfiles" multiple>
                            <c:if test="${ not empty board.originName }">
                            
                            	현재 업로드된 파일 : 
                            	<a href="${board.changeName }" download="${ board.originName }">${ board.originName }</a>
                            	<input type="hidden" value="${ board.originName }" name="originName" />
                            	<input type="hidden" value="${ board.changeName }" name="changeName" />
                            </c:if>
                        </td>
                    </tr>
                    
		            <tr>
		                <th><label for="upfile">첨부파일2</label></th>
		                <td><input type="file" id="upfile2" class="form-control-file border" name="upfiles" multiple></td>
		            </tr>
		            <tr>
		                <th><label for="upfile">첨부파일3</label></th>
		                <td><input type="file" id="upfile3" class="form-control-file border" name="upfiles" multiple></td>
		            </tr>
		            <tr>
		                <th><label for="upfile">첨부파일4</label></th>
		                <td><input type="file" id="upfile4" class="form-control-file border" name="upfiles" multiple></td>
		            </tr>
		                    
                    
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