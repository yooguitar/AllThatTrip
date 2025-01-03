<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            width:1200px;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:1200px;
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
        
        #adRadio{
        
        
        
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

            <form id="enrollForm" method="post" action="1ad_update_form" enctype="multipart/form-data">
                <input type="hidden" name="adNoticeNo" value="${ adNotice.adNoticeNo }"/>
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${ requestScope.adNotice.adNoticeTitle }" name="adNoticeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ requestScope.adNotice.adWriter }" name="adWriter" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile">
                       		<c:if test="${ not empty adNotice.adOriName }">
                            현재 업로드된 파일 : 
                            <a href="${ adNotice.adChaName }" download="${ adNotice.adOriName }">${ adNotice.adOriName }</a>
                            <input type="hidden" value="${ adNotice.adChaName }" name="adOriName" />
                            <input type="hidden" value="${ adNotice.adChaName }" name="adChaName" />
                            
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                    	<th><label for="importent">중요도</label></th>
                    	<td><p>중요</p><input type="radio" id="adRadio1" name="importent" value="Y"></td>
                    	<td><p>비중요</p><input type="radio" id="adRadio2" name="importent" value="N"></td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="adNoticeContent" required>${ requestScope.adNotice.adNoticeContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    <script>
    	
		    window.onload = function() {
			
					
			$('input[value="${adNotice.importent}"]').attr('checked',true);
			
				
			}    	
		    
    
    
    </script>
    <jsp:include page="../common/include/footer.jsp" />
    
</body>
</html>