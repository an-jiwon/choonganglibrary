<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::글삭제</title>
<script type="text/javascript">
	//글 삭제 확인
	function deleteBoard() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="adminBoardDelete.do?num=${num }&pageNum=${pageNum}&category=${category}";
		}else{   //취소
		    return false;
		}	
	}


	//댓글 삭제 확인창
	function deleteReply(reply_num) {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="adminBoardDeleteReply.do?num=${num}&reply_num="+reply_num+"&pageNum=${pageNum }";
		}else{   //취소
		    return false;
		}
	}
</script>
</head>
<body>
<div class="wrapper">
		<!-- 글내용 -->
<div class="table-responsive">
 	<table class="table table-bordered">
			<tr>
				<th colspan="4">${board.title }</th>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.board_date }</td>
				<th>작성자</th>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><a href="../upload/${board.board_file}">${board.board_file}</a></td>
				<th>조회수</th>
				<td>${board.board_view }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${board.board_main }</td>
			</tr>
			<c:if test="${board.category=='notice' }">
				<tr>
					<th colspan="4"><input type="button" value="목록으로"	onclick="location.href='adminBoardNotice.do?pageNum=${pageNum}'">
									<input type="button" value="글삭제" onclick="deleteBoard()"></th>
				</tr>
			</c:if>
			<c:if test="${board.category != 'notice' }">
				<tr>
					<th colspan="4"><input type="button" value="목록으로"	onclick="location.href='adminBoardFree.do?pageNum=${pageNum}'">
									<input type="button" value="글삭제" onclick="deleteBoard()">
							
						</th>
				</tr>
			</c:if>
		</table>
		</div>

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
							<th style="font-weight:bold; ">${r.writer }</th>
							<td align="right">${r.reply_date }</td>
						</tr>
						<tr>
							<td colspan="2">${r.main }</td>
							
							<th align="right">
							<input type="button" value="삭제" id="re_delete" onclick="return deleteReply(${r.reply_num})">
							</th>
						
						</tr>
					
					</table>
				<hr>
			</c:forEach>
		</c:if>
</div>
</body>
</html>