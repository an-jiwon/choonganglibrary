<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::회원탈퇴</title>
</head>
<body>
	<c:if test="${result>0 }">	
	<script type="text/javascript">		
		alert("탈퇴 완료");
		location.href = "main.jsp";
	</script>
	</c:if>
	<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("똑바로 해");
		history.go(-1);
	</script>
	</c:if>
</body>
</html>