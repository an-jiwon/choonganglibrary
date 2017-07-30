<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::글내용</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<%
	String id = (String) session.getAttribute("id");
%>		
<script type="text/javascript">
	//글 삭제 확인
	function deleteBoard() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="deleteBoard.do?num=${num }&pageNum=${pageNum}";
		}else{   //취소
		    return false;
		}	
	}
	//파일 다운로드
	function onDownload(num) {
		var o = document.getElementById("ifrm_filedown");	
		o.src = "download.do?num="+num;
	}
	//댓글폼 보였다 사라졌다
	function writeReply() {
		var id = '<%=id%>';
		var writeReply = document.getElementById("writeReply");
		if(id == null || id == "" || id == "null"){
			window.open("../login/loginForm.jsp","로그인","width=500  height=250 left=100 top=50");
		}else{
			if(writeReply.style.display=="none"){
				writeReply.style.display="block";
				reForm.inputReply.focus();
			}else{
				writeReply.style.display="none";
			}
		 } 
	}
	//댓글 수정창 보였다 사라졌다
	function showUpdateReply(reply_num) {

		var re_main = document.getElementsByClassName("re_main")[reply_num-1];
		var re_main2 = document.getElementsByClassName("re_main2")[reply_num-1];
		var re_update = document.getElementsByClassName("re_update")[reply_num-1];
		var updateRe = document.getElementsByClassName("updateRe")[reply_num-1];
		
		if(re_main2.style.display=="none") {
			re_main.style.display="none";
			re_main2.style.display="block";
			updateRe.re_updateMain.focus();
			$(re_update).text("취소");
			// re_update.value="취소";
		}else {
			re_main2.style.display="none";
			re_main.style.display="block";
			$(re_update).text("수정");
			// re_update.value="수정";
		}
	}
	//댓글 수정 확인
	function updateReply() {
		if (confirm("수정하시겠습니까?") == true){    //확인
			document.updateRe.submit();
		}else{   //취소
		    return false;
		}
	}
	//댓글 삭제 확인창
	function deleteReply(reply_num) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="deleteReply.do?num=${num}&reply_num="+reply_num+"&pageNum=${pageNum }";
		}else{   //취소
		    return false;
		}
	}
</script>
</head>
<body>
<c:if test="${board.category == 'notice' }">
<jsp:include page="../leftbar/leftbar2_1.jsp"></jsp:include>
</c:if>
<c:if test="${board.category !=  'notice'}">
<jsp:include page="../leftbar/leftbar2_2.jsp"></jsp:include>
</c:if>
<div class="wrapper">
<iframe id="ifrm_filedown"  style="position:absolute; z-index:1;visibility : hidden;"></iframe>  
		<!-- 글내용 -->
		<div class="table-responsive">
		 <table class="table table-bordered">
			<tr>
				<th colspan="4" style="text-align: center;" bgcolor="#d8df8f">${board.title }</th>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.board_date }</td>
				<th>작성자</th>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><a href="#" onclick="onDownload('${board.num}')">${board.board_file}</a></td>
				<th>조회수</th>
				<td>${board.board_view }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea cols="100" rows="10" name="content" required="required" 
				style="width:95%; background-color: white; border: none; resize: none;" wrap="hard" disabled="disabled">${board.board_main }</textarea></td>
			</tr>
		</table>
			<c:if test="${board.category=='notice' }">
				<input type="button" value="글목록" class="btn btn-default" style="float: right;"
						onclick="location.href='noticeList.do?pageNum=${pageNum}'">
			</c:if>
			<c:if test="${board.category != 'notice' }">
				<input type="button" value="댓글달기" class="btn btn-default" style="float: right;"
							  onclick="writeReply()" >
				<input type="button" value="글쓰기" class="btn btn-default" style="float: right;"
								onclick="location.href='writeBoardForm.jsp'">
				<input type="button" value="글목록" class="btn btn-default" style="float: right;"
						onclick="location.href='freeBoardList.do?pageNum=${pageNum}'">
							<c:if test="${board.writer==id }">
								 <input type="button" value="글수정" class="btn btn-default" style="float: right;"
									onclick="location.href='updateBoardForm.do?num=${num }&pageNum=${pageNum}'">
								<input type="button" value="글삭제" class="btn btn-default" style="float: right;"
								onclick="deleteBoard()">
							</c:if>
							  
			</c:if>

		</div>
		<!-- 댓글달기폼 -->
		<form action="insertReply.do" method="post" name="reForm">
		<input type="hidden" name="writer" value="${id}">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum }">
			<div id="writeReply" style="display: none">
				<input type="button" class="btn btn-default" style="float: right;" value="취소" onclick="writeReply()">
				<input type="submit" class="btn btn-default" style="float: right;" value="확인">
				<input type="text" size="80" name="inputReply" style="float: right;">
			</div>
		</form>
		<!-- 여기서부터 댓글 -->
		<p><p>
		댓글
		<hr style="border-style:groove;">
		<c:if test="${empty reply }">
		댓글이 없습니다.
		</c:if>
		<c:if test="${not empty reply }">
		<c:forEach var="r" items="${reply }">
		<table>
		<tr>
			<th style="font-weight:bold; padding-right: 10px;">${r.writer }</th>
			<td align="right">${r.reply_update }</td>
		</tr>
		<tr>
			<td><div class="re_main">${r.main }</div>
			
			<div class="re_main2" style="display: none">
			<form action="updateReply.do" class="updateRe" name="updateRe" method="post" onsubmit="return updateReply()" >
			<input type="hidden" name="reply_num" value="${r.reply_num }">
			<input type="hidden" name="num" value="${num }">
			<input type="text" name="re_updateMain" value="${r.main }">
			<input type="submit" class="btn btn-default" style="float: right;" value="수정">
			</form></div></td>
		<c:if test="${r.writer==id }">	
			<th align="right">
			<input type="button" class="btn btn-default" style="float: right;" value="삭제" id="re_delete" onclick="return deleteReply(${r.reply_num})">
			<%-- <input type="button" class="btn btn-default re_update" style="float: right;" value="수정" onclick="showUpdateReply(${r.reply_num})"> --%>
			<button class="btn btn-default re_update" style="float: right;" onclick="showUpdateReply(${r.reply_num})">수정</button>
			</th>
		</c:if>
		<c:if test="${r.writer!=id }">
		<input type="hidden" class="btn btn-default" style="float: right;" value="삭제" id="re_delete" onclick="return deleteReply(${r.reply_num})">
		 <input type="hidden" class="btn btn-default re_update" style="float: right;" value="수정" onclick="showUpdateReply(${r.reply_num})">
		</c:if>
		</tr>
		
		</table>
		<hr>
		</c:forEach>
		</c:if>
</div>
</body>
</html>