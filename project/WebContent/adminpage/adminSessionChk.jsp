<%-- <%
	String id = (String)session.getAttribute("id");
	if (id == null || id=="") {
	response.sendRedirect("../login/loginForm.jsp");
	return;
	}
%> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String adminid = (String)session.getAttribute("adminid");
	if (adminid == null || adminid=="") {%>
	<script type="text/javascript">
	location.href ="../adminpage/adminLoginForm.jsp","login","width=500  height=250 left=100 top=50";

	</script>
<%	return;
	}
%>