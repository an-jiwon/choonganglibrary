<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::신규추천도서</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
</head>
<body>
<jsp:include page="../leftbar/leftbar1_2.jsp"></jsp:include>
<div class="wrapper">
<form action="nrboardwrite.do" method="post"  enctype="multipart/form-data">
<% String writer = (String)session.getAttribute("id"); %>
<input type="hidden" name="writer" value=<%=writer %>>
	<div class="table-responsive">
		<table class="table table-bordered"><caption>도서목록 글쓰기</caption>
			<tr><th width="100pt">분류</th>
				<td><select name="category"><option value="신규">신규 <option value="추천">추천 </select></td></tr>
			<tr><th>제목</th>
				<td><input type="text" name="title" size="50" maxlength="30" required="required" style="width:90%"></td></tr>
			<tr><th>내용</th>
				<td><textarea cols="100" rows="10" name="main" required="required" style="width:90%" wrap="hard"></textarea></td></tr>
			<tr><th>첨부파일</th>
				<td><input type="file" name="NRBoard_file" multiple="multiple"></td></tr>
		</table>
			<button onclick="location.href='nrboardlist.do'" style="float: right;" class="btn btn-default" >취소</button>
			<input type="submit" value="확인" style="float: right;" class="btn btn-default" > &nbsp;
			
	</div>
</form>
</div>
</body>
</html>