<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../login/sessionCheck.jsp" %>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::자유게시판</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<script type="text/javascript">
	function chk() {
		if(frm.sel.options[frm.sel.selectedIndex].text == "분류"){
			alert("분류를 선택하세요.");
			return false;
		}
			
	}
</script>
</head>
<body>
<jsp:include page="../leftbar/leftbar2_2.jsp"></jsp:include>
<div class="wrapper">
<form action="updateBoard.do" name="frm" method="post" onsubmit="return chk()" enctype="multipart/form-data">
<% String writer = (String)session.getAttribute("id"); %>
<input type="hidden" name="writer" value="<%=writer %>">
<input type="hidden" name="num" value="${num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<div class="table-responsive">
 <table class="table table-bordered">
<caption>글쓰기</caption>
<tr>
	<th width="100pt">분류</th>
	<td>
	
	<select name="sel" required="required" >
	<c:if test="${not empty board.category }"><option value="${board.category }">${board.category }</option></c:if>
		<option value="문의사항">문의사항</option>
		<option value="건의사항">건의사항</option>
		<option value="희망도서신청">희망도서신청</option>
		<option value="기타">기타</option>
	</select>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="title" value="${board.title }" required="required" style="width:90%" ></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea cols="100" rows="10" name="content" required="required" style="width:90%" wrap="hard">${board.board_main }</textarea></td>
</tr>
<tr>
	<th>첨부파일</th>
	<td><input type="file" name="board_file"  value="${board.board_file }"></td>
</tr>
</table>

<input type="submit" value="수정">
<input type="button" value="취소" onclick="location.href='content.do?pageNum=${pageNum}&num=${num }'">
</div>
</form>
</div>
</body>
</html>