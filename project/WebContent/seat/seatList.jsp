<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::열람실</title>
<style type="text/css">
	body {margin: 0 auto;}
</style>
<%
	String id = (String)session.getAttribute("id");
%>
<script type="text/javascript">
//checkIn
	function chk(seatnum, seatCheck, seatid) {
		var id = '<%=id%>';
		
		if(id == null || id == "" || id== "null") {
			window.open("../login/loginForm.jsp","로그인","width=500  height=250 left=100 top=50");	
		} else {
				if (seatCheck == "n"){
					alert("이미 선택된 좌석입니다. 다른 좌석을 이용해주세요.");
					return false;
				}else if(id == seatid) {
					alert("열람실은 아이디당 하나의 좌석만 이용가능합니다. 욕심 No!");
					return false;
				}else {
					if (confirm(seatnum+"번 좌석을 사용하겠습니까?") == true){
						location.href="checkIn.do?id="+id+"&seatnum="+seatnum;
					}else {
						return false;
					}
				}
			}
	}
	//checkOut
	function checkOut(seatnum,id){
		if (confirm("퇴실하시겠습니까?") == true){
			location.href="checkOut.do?seatnum="+seatnum+"&id="+id;
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


<table border="1" style="border-collapse:collapse" >
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
						<a href="javascript:void(0);" onclick="chk(${seat.seatnum},'${seat.seatCheck }','${idlist.id}');">${seat.seatnum}</a><p>
					</td>
		<c:if test="${index%6 == 0 }">
			<c:if test="${index%12 == 0 }">
			</tr><tr><td colspan="6" style="height: 50px;"></td>
			</c:if>
			</tr><tr>
		</c:if>
		</c:forEach>
		</tr>
	</c:if>
</table>


</body>
</html>