<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("해당 게시글이 삭제 되었습니다.");
		location.href="nrboardlist.do";
	</script>
</c:if>

<c:if test="${result <= 0 }">
	<script type="text/javascript">
		alert("삭제가 실패되었습니다.");
		history.back();
	</script>
</c:if>

</body></html>