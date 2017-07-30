<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::아이디중복확인</title>
<link rel="stylesheet" type="text/css" href="common.css">

<script type="text/javascript">
	function cl() {
		opener.frm.id.value = "${id}";
		window.close();
	} 
</script>
</head>
<body>
	<c:if test="${result>0}">
		<h2>이미 있는 아이디입니다</h2>
		<h2>다른 아이디를 입력하세요</h2>
		<form>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" required="required">
					<input class="btn btn-default" type="submit" value="확인"></td>
				</tr>

			</table>
		</form>
	</c:if>
	<c:if test="${result <= 0}">
		<h2>사용 가능한 아이디 입니다</h2>
		<button class="btn btn-default" onclick="cl()">닫기</button>
	</c:if>
</body>
</html>