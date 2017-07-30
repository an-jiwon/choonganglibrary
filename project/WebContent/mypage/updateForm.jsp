<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../login/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::나의정보수정</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<script type="text/javascript">
	function chk(){
		if (frm.newpasswd.value != frm.newpasswd2.value) {
			alert("암호가 암호확인과 맞지 않습니다");
			frm.newpasswd.focus();
			return false;
			//newpasswd와 newpasswd2 확인
		}
	}
</script>
</head>
<body>
<jsp:include page="../leftbar/leftbar5_1.jsp"></jsp:include>
<div class="wrapper">
<form action="update.do" method="post" name="frm" onsubmit="return chk()">
<div class="table-responsive">
 <table class="table table-bordered">
	<tr>
		<th width="180pt">아이디</th>
		<td>${id }</td>
	</tr>
	<tr>
		<th>변경할 비밀번호</th>
		<td><input type = "password" name = "newpasswd" required="required"></td>
	</tr>
	<tr>
		<th>변경할 비밀번호 확인</th>
		<td><input type = "password" name = "newpasswd2" required="required"></td>
	</tr>
	<tr>
		<th>E-Mail</th>
		<td><input type = "email" name = "email" required="required" value = "${mem.email }"></td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
		<td><input type="tel" name="phone" required="required"
					pattern="\d{3}-\d{3,4}-\d{4}" 
					title="전화번호 형식 3-3,4-4"
					placeholder="010-1111-1111" value = "${mem.phone }"></td>
	</tr>
	<tr>
		<th rowspan="3">주소</th>
		<td><input type = "text" name = "zipcode" required="required"
		placeholder="000-000" value = "${mem.zipcode }"></td>
	</tr>
	<tr>
		<td><input size="50" type = "text" name = "addr1" required="required"
		placeholder="도/시 군/구" value = "${mem.addr1 }"></td>
	</tr>
	<tr>
	<td><input size="50" type = "text" name = "addr2" required="required"
		placeholder="동/읍 상세주소" value = "${mem.addr2 }"></td>
	</tr>
</table>
	<input class="btn btn-default" style="float: right;" type = "submit" value = "확인">
</div>
</form>
</div>
</body>
</html>