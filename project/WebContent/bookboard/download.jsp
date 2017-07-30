<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String NRBoard_file = request.getParameter("NRBoard_file");
		String file_location = request.getSession().getServletContext().getRealPath("/listfile") + "/" + NRBoard_file;

		File file = null;

		BufferedInputStream fin = null;

		BufferedOutputStream outs = null;

		try {
			file = new File(file_location,  NRBoard_file );
			response.reset();
			response.setHeader("Content-Type", "application");
			response.setHeader("Content-Disposition", "attachment; NRBoard_file =" +  NRBoard_file  + ";");

			if (file != null) {
				fin = new BufferedInputStream(new FileInputStream(file));
				outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;
				while ((read = fin.read()) != -1) {
					outs.write(read);
				}
			}

		} catch (Exception e) {
			response.setContentType("text/html;charset=euc-kr");
			out.println("<script type='text/javascript'>");
			out.println("alert('파일 오픈 중 오류가 발생하였습니다.');");
			out.println("</script>");

		} finally {
			if (outs != null)
				fin.close();
			if (fin != null)
				outs.close();
		}
	%>

</body>
</html>