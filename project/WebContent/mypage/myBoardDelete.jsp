<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::글삭제</title>
</head>
<body>
	<c:if test="${result>0}">
		<script type="text/javascript">
			alert("삭제가 완료되었습니다.");
			if (category != "notice") {
				location.href = "adminBoardFree.do?pageNum=${pageNum}";
			} else {
				location.href = "adminBoardNotice.do?pageNum=${pageNum}";
			}
		</script>
	</c:if>
	<c:if test="${result<=0}">
		<script type="text/javascript">
			alert("삭제 중 오류가 발생하였습니다.");
			history.go(-1);
		</script>
	</c:if>
	<%-- 
	
	<c:if test="${result2>0}">
		<script type="text/javascript">
			alert("댓글 삭제가 완료되었습니다.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result2 <=0}">
		<script type="text/javascript">
			alert("댓글 삭제 중 오류가 발생하였습니다.");
			history.go(-1);
		</script>
	</c:if>	
	
	 --%>
</body>
</html>