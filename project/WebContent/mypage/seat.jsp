<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ include file="../login/sessionCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::열람실이용내역</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
</head>
<body>
<jsp:include page="../leftbar/leftbar5_4.jsp"></jsp:include>
<div class="wrapper">
<div class="table-responsive">
 <table class="table table-hover">
	<thead><tr>
		<th>자리</th>
		<th>입실시간</th>
		<th>퇴실시간</th>
	</tr></thead>
	<c:if test="${empty list }">
			<tr>
				<td colspan="3">사용내역이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="mem" items="${list}">
				<tr>
					<td>${mem.seatnum}</td>
					<td><fmt:formatDate value="${mem.seatIn}"  type="both"/></td>
					<td><c:if test="${mem.seatOut  != '' || mem.seatOut  ne null}">
							<fmt:formatDate value="${mem.seatOut}"  type="both"/>
						</c:if>
						<c:if test="${mem.seatOut eq null}">
							<input class="btn btn-default" type="button" value="퇴실" 
							onclick="location.href='myseatOut.do?id=${mem.id}&seatin=${mem.seatIn}&seatnum=${mem.seatnum}'">
						</c:if>
						
					</td>
				</tr>
			</c:forEach>
		</c:if>
</table>
</div>
<div align="center">
<c:if test="${startPage > PAGEPERBLOCK }">
		<a href="seat.do?pageNum=${endPage-PAGEPERBLOCK}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="seat.do?pageNum=${i}" >[${i}]</a>
</c:forEach>
<c:if test="${endPage < totPage }">
		<a href="seat.do?pageNum=${startPage+PAGEPERBLOCK}">[다음]</a>
</c:if>	
</div>
</div>
</body>
</html>