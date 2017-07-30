<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::열람실</title>
<script type="text/javascript">
//checkIn
	function chk(seatnum, seatCheck) {		
				if (seatCheck == "n"){
					if (confirm(seatnum+"번 좌석 사용자 강제퇴실 처리 합니까?") == true){
						location.href="adminseatout.do?seatnum="+seatnum;
					}else {
						return false;
					}
					
				}else {
					alert("비어있는좌석입니다");
					return false;
				}
			
	}
	//checkOut
	function seatcheck(seatnum){
		if (confirm(seatnum+"번 좌석 사용자 정보확인") == true){
			location.href="adminseatcheck.do?seatnum="+seatnum;
		}else {
			return false;
		}
	}
</script>
<style type="text/css">

td { height:142px; width: 128px; text-align: center; color: white; font-size: 25px;}

</style>

</head>

<body>

<table class="table table-hover" border="1" style="border-collapse:collapse" >
	<c:if test="${empty list}">
	<tr>	
			<td colspan="2">데이터가 없습니다.</td>
	</tr>		
	</c:if>
	
	<c:if test="${not empty list}">
	<tr>
		<td colspan="6" align="center"><img alt="" src="seat_images/door.png" width="100"></td>
	</tr>
	<tr>	
		<c:forEach var ="seat" items="${list}" varStatus="status">
		<c:set var="index" value="${status.index+1 }"/>
					<td background="seat_images/${seat.seatCheck}.GIF" id = "${seat.seatnum}">	
						<a href="javascript:void(0);" onclick="chk(${seat.seatnum},'${seat.seatCheck }');">${seat.seatnum}</a><p>
						<input class="btn btn-default" type="button" value="사용자 정보확인" onclick="seatcheck(${seat.seatnum})">
					</td>
		<c:if test="${index%6 == 0 }">
			<c:if test="${index%12 == 0 }">
			</tr><tr><td colspan="6"></td>
			</c:if>
			</tr><tr>
		</c:if>
		</c:forEach>
	</tr>
	</c:if>
</table>


</body>
</html>