<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html ><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("파일이 삭제되었습니다.");
		location.href="modifyForm.do";
	</script>
</c:if>

<c:if test="${result <=0 }">
	<script type="text/javascript">
		alert("파일 삭제 실패");
		history.back();
	</script>
</c:if>

</body>
</html>