<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::회원탈퇴</title>
<script type="text/javascript">
	function chk(){
		var r = confirm("탈퇴하시겠습니까?");
		if (r != true) {					
		    history.go(-1);
		    return false;
		}		
	}
</script>
</head>
<body>
<div class="wrapper">
	<form action = "drop.do" name = "frm"  onsubmit="return chk()">
	<div class="table-responsive">
	 <table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" required="required">
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" required="required"></td>
		</tr>
		<tr>		
			<td colspan = "2"><input type="submit" value = "회원탈퇴"></td>
		</tr>
	</table>
	</div>
	</form>
	</div>
</body>
</html>