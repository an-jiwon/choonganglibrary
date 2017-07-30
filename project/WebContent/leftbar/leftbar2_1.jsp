<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/barstyle.css"> 
<style type="text/css"> fieldset {font-size: 14px; color:gray;} </style>
<nav class="leftbar">
	<div class="bartitle">참여마당
		<ul>
			<li class="click"><a href="../board/noticeList.do">공지사항</a></li>
			<li><a href="../board/freeBoardList.do">자유게시판</a></li>
			<li><a href= "../board/qna.jsp">Q&A</a></li>
		</ul>
	</div>
</nav>

<article>
	<h1>공지사항</h1>
	<hr>

</article>
