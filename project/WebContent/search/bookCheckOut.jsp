<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::대출신청</title>
</head>
<body>

<c:if test="${result > 0 and bookrs > 0}">
	<script type="text/javascript">
		alert("대출신청이 완료되었습니다.");
		location.href="bookSearchInfo.do?book_id=${book_id }&searchKeyword=${searchKeyword}";
	</script>
</c:if>
<c:if test="${result <= 0 or bookrs <= 0}">
	<script type="text/javascript">
		alert("대출이 되지않습니다.");
		history.back();
	</script>
</c:if>

</body>
</html>