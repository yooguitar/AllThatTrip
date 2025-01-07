<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
        #img-area{
            width : 100%;
            margin : auto;
            text-align: center;
        }
        #img-area > img{
            width : 80%;
        }
    </style>
</head>
<body>
        
    <jsp:include page="../common/include/header.jsp" />   
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="/att/board/list/insert" enctype="multipart/form-data">
           		<input type="hidden" name="boardType" value="${board.boardType}">     
                <input type="hidden" name="userNo" value=1>
                <table align="center">
                    <tr>
                        <th><label for="title">* 제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">* 작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="test" name="boardWriter" readonly></td>
                    </tr>
                    <!-- <tr>
			            <th><label for="thumbnail">썸네일</label></th>
			            <td><input type="file" id="thumbnail" class="form-control-file border" name="thumbnailFile" required></td>
			        </tr> -->
			        
                    <tr>
				    <c:choose>
					    <!-- boardType이 10일 경우 -->
					    <c:when test="${board.boardType == 10}">
					        <tr>
					            <th><label for="upfile">첨부파일1</label></th>
					            <td><input type="file" id="upfile1" class="form-control-file border" name="upfiles" multiple></td>
					        </tr>
					    </c:when>
					    
					    <!-- boardType이 10이 아닌 경우 -->
					    <c:otherwise>
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
					    </c:otherwise>
					</c:choose>

					<tr>
				    <th><label for="content">* 내용</label></th>
				    <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required></textarea></td>
				</tr>

                    	 
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary" >등록하기</button>
                    <a class="btn btn-secondary" style="float:center;" href="/att/board/list?boardType=${board.boardType}">취소하기</a>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/include/footer.jsp" />    
</body>
</html>