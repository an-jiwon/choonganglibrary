<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::예약취소</title>
</head>
<body>
<body>
	<c:if test="${result>0 }">	
	<script type="text/javascript">		
		alert("예약 취소 완료");
		location.href = "reserveForm.jsp";
	</script>
	</c:if>
	<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("예약 취소 실패");
		history.go(-1);
	</script>
	</c:if>
</body>
</body>
</html>