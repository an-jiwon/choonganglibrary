<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::도서검색</title>
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css" href="../all.css"> 
</head>
<body>
<%@ include file="../leftbar/leftbar1_1.jsp" %>

<div class="wrapper">
<form action="bookSearch.do" name="select" method="post">
분류선택
	<select name="category" >
		<option value="전체">전체 <option value="총류">총류 <option value="IT">IT <option value="과학">과학
		<option value="예술">예술 <option value="언어">언어 <option value="문학">문학 <option value="역사">역사 <option value="기타">기타
</select>
	<input type=text name="searchKeyword" size=50 >
	<input class="btn btn-default" type="submit" value="검색"><p>

</form>
</div>

</body>
</html>