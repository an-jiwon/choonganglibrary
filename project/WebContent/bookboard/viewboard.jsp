<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html ><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::신규추천도서</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<script type="text/javascript">
	function del() {
		if (confirm("게시물을 삭제하시겠습니까?") == true) {
			location.href="delete.do?num=${nboard.num}";
		} else { return;}
	}
	function onDownload(num) {
		var o = document.getElementById("ifrm_filedown");	
		o.src = "download.do?num="+num;
	}
</script>
</head>
<body>
<jsp:include page="../leftbar/leftbar1_2.jsp"></jsp:include>
<div class=wrapper>
<iframe id="ifrm_filedown"  style="position:absolute; z-index:1;visibility : hidden;"></iframe> 
<div class="table-responsive">
	 <table class="table table-bordered">
		<tr><th >분류</th><td width="800pt">${nboard.category }</td></tr>
		<tr><th>제목</th><td>${nboard.title }</td></tr>
		<tr><th>작성자</th><td>${nboard.writer }</td></tr>
		<tr><th>작성일</th><td>${nboard.nr_date }</td></tr>
		<tr><th>조회수</th><td>${nboard.nr_view }</td></tr>
		<tr><th>첨부파일</th><td><a href="#" onclick="onDownload('${nboard.num}')">${nboard.NRBoard_file }</a></td></tr>
		<tr><th>내용</th><td><textarea cols="100" rows="10" name="content" required="required" 
				style="width:95%; background-color: white; border: none; resize: none;" wrap="hard" disabled="disabled">${nboard.main }</textarea></td></tr>
	</table>
</div>
<% String id =(String) session.getAttribute("id"); %>
<c:if test="${id == 'admin' }">
	<button onclick="del()" style="float: right;" class="btn btn-default">삭제</button>
	<button onclick="location.href='modifyForm.do?num=${nboard.num}'" style="float: right;" class="btn btn-default">수정</button>
	<button onclick="location.href='writeForm.jsp'" style="float: right;" class="btn btn-default">새글쓰기</button>
	<button style="float: right;" class="btn btn-default" onclick="location.href='nrboardlist.do'">목록</button>
</c:if>
<c:if test="${id != 'admin' }">
	<button style="float: right;" class="btn btn-default" onclick="location.href='nrboardlist.do'">목록</button>
</c:if>
</div>
</body>
</html>