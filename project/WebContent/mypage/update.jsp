<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::정보수정</title>
</head>

<%//update.java에서넘어온 result값이 0보다크면 ok 아니면 X %>

<body>
	<c:if test="${result>0 }">
		<script type="text/javascript">
			alert("수정이 완료되었습니다.");
			location.href="updateForm.do";
		</script>
	</c:if>

	<c:if test="${result<=0 }">
		<script type="text/javascript">
			alert("수정하는 도중 오류가 발생하였습니다.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>