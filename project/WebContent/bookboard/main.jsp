<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html ><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function loginPop(n) {
		var url = "../login/loginForm.jsp";
		var name = "로그인";
		var win;
		if (n==0) win = window.open(url,name,"width=500  height=250 left=100 top=50");
	}	
	
	function logout() {
		if (confirm("로그아웃 하시겠습니까?") == true) {
			location.href="logoutResult.jsp";
		} else { return;}
	}
</script>

</head>
<body>

<% String id =(String) session.getAttribute("id"); %>
<button onclick="loginPop(0)">로그인</button>
<c:if test="${id == null }">로그인 해 주세요.</c:if>

<button onclick="location.href='nrboardlist.do'">글목록</button>

<button onclick="location.href='../search/bookSearchForm.jsp'">도서검색</button><p>

<c:if test="${id !=null }">
<button onclick="logout()">로그아웃</button>
</c:if>

</body>
</html>