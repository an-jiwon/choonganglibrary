<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<style type="text/css">
	h3 {margin-bottom: 0px; }
	#header {font-size: small; margin-top: 0px;}
	table {margin :auto;}
	#foot { font-size:small; text-align: center; }
</style>
<script type="text/javascript">
	function join() {
		opener.location.href="../member/joinForm.jsp";
		window.close();
	}
</script>
</head>
<body>

<h3>아이디 찾기</h3>
<font id="header">가입당시 입력하신 성함과 연락처를 입력해 주세요.</font>
<hr>

<form action="findid.do">
<table>
	<tr><th>가입자명</th><td><input type="text" name="name" required="required" autofocus="autofocus"></td></tr>
	<tr><th>연락처</th><td><input type="text" name="phone" required="required"></td></tr>
	<tr><th colspan=2 style="text-align: center;"><input class="btn btn-default" type=submit value="아이디 찾기" ></th></tr>
</table>
</form>

<hr>
<div id="foot">아직 중앙도서관 회원이 아니십니까?
<button class="btn btn-default" onclick="join()">회원가입하기</button></div> 

</body>
</html>