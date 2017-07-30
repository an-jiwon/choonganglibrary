<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Enumeration"%> 
    
    <%@ include file="../adminpage/adminSessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::관리자</title>

</head>
<body>

<h2>관리자 페이지</h2>

<h3>사용중인 관리자 : ${adminid }</h3><br>
<h3>접속한 IP :<%=request.getRemoteAddr()%></h3><br/> 




</body>
</html>