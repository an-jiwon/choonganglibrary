<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html ><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.js"></script>
<title>중앙도서관::신규추천도서</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<script type="text/javascript">
	function back() {
		history.back();
	}
	
</script>
</head>
<body>
<jsp:include page="../leftbar/leftbar1_2.jsp"></jsp:include>
<div class="wrapper">
	<form action="modifyok.do">
		<input type="hidden" name=num value=${nboard.num }>
		<div class="table-responsive">
		<table class="table table-bordered">
			<tr><th width="100pt">분류</th>
				<td>
					<select name="category">
						<c:if test="${not empty nboard.category }">
							<option value="${nboard.category }">${nboard.category }
						</c:if>
						<option> 신규 </option> <option> 추천 </option>
					</select>
				</td>
			</tr>
	
			<tr><th>제목</th>
				<td>
					<input type="text" name="title" value="${nboard.title }" required="required">
				</td>
			</tr>
			
			<tr><th>작성자</th>
				<td>${nboard.writer }</td>
			</tr>
	
			<tr><th>작성일</th>
				<td>${nboard.nr_date }</td>
			</tr>
	
			<tr><th>조회수</th>
				<td>${nboard.nr_view }</td>
			</tr>
			
			<tr><th>첨부파일</th>
				<td>
					<input type="file" name="NRBoard_file" multiple="multiple">
				</td>
			</tr>
			
			<tr><th>첨부된 파일</th>
				<td>
					<input type="hidden" name="NRBoard_file" value="${nboard.NRBoard_file }">
						${nboard.NRBoard_file }
					<button onclick="location.href='filedelete.do?NRBoard_file=${nboard.NRBoard_file}&num=${nboard.num }'">삭제</button>
				</td>
			</tr>
	
			<tr><th>내용</th>
				<td>
					<textarea cols="100" rows="10" name="main" required="required" style="width:90%" wrap="hard">${nboard.main }</textarea>
				</td>
			</tr>
		</table>
				<button onclick="back()" style="float: right;" class="btn btn-default">취소</button>
				<input type="submit" value="수정" style="float: right;" class="btn btn-default">  &nbsp;
		</div>
	</form>
	</div>
</body>
</html>