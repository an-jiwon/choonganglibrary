<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::대출현황</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
</head>
<body>
<jsp:include page="../leftbar/leftbar5_2.jsp"></jsp:include>
<div class="wrapper">
<div class="table-responsive">
 <table class="table table-hover">
	<thead><tr>
		<th width="400pt">책</th>
		<th>대출일</th>
		<th>반납일</th>
		<th>연체일</th>
	</tr></thead>
	<c:if test="${empty list }">
			<tr>
				<td colspan="5">대출기록이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="checkoutResult" items="${list}">
				<tr>
					<td><a href="../search/bookSearchInfo.do?book_id=${checkoutResult.book_id }">${checkoutResult.title}</a></td>
					<td>${checkoutResult.checkout_date}</td>
					<td><c:if test="${checkoutResult.check_ok!='대출중'}">
							${checkoutResult.checkin_date}
						</c:if>
						<c:if test="${checkoutResult.check_ok=='대출중' }">
							<input class="btn btn-default" type="button" value="반납" onclick="location.href='mycheckin.do?id=${checkoutResult.id}&book_id=${checkoutResult.book_id}'">
						</c:if>
						
					</td>
					<c:if test="${checkoutResult.overdate<=0 }">
					<td>0</td>
					</c:if>
					<c:if test="${checkoutResult.overdate>0 }">
					<td>${checkoutResult.overdate}</td>
					</c:if>
					
				</tr>
			</c:forEach>
		</c:if>
</table>


<div align="center">
<c:if test="${startPage > PAGEPERBLOCK }">
		<a href="checkout.do?pageNum=${endPage-PAGEPERBLOCK}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="checkout.do?pageNum=${i}" >[${i}]</a>
</c:forEach>
<c:if test="${endPage < totPage }">
		<a href="checkout.do?pageNum=${startPage+PAGEPERBLOCK}">[다음]</a>
</c:if>	
</div>
</div>
</div>


</body>
</html>