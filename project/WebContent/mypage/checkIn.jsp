<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head><body>

<c:if test="${bookrs>0 }">	
	<script type="text/javascript">		
		alert("반납이 완료되었습니다.");
		location.href = "checkout.do";
	</script>
	</c:if>
	<c:if test="${bookrs<=0 }">
	<script type="text/javascript">
		alert("반납 중 오류가 발생하였습니다.");
		history.go(-1);
	</script>
	</c:if>

</body>
</html>