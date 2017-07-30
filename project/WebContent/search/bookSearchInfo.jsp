<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::도서검색</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<style type="text/css">
	ul li { list-style: none; font-size: 16px; margin-top: 10px}
	ul li label { float: left; width: 80px; line-height: 25px;	}
	.right_side, .left_side {	margin: 0;	padding: 5px;	width: 47%;}
	.right_side {	float: right; padding: 15px; }
	.left_side {	float: left; padding: 15px; height: 180px; width:150px; margin-right: 15px; margin-left: 15px;}
	.bottom {clear:both; padding: 10px; }
</style>

<script type="text/javascript">
	function loginPop(n) {
		var url = "../login/loginForm.jsp";
		var name = "로그인";
		var win;
		if (n==0) win = window.open(url,name,"width=500  height=250 left=100 top=50");
	}	

</script>
</head><body>
<jsp:include page="../leftbar/leftbar1_1.jsp"></jsp:include>
<div class="wrapper">
<% String id =(String) session.getAttribute("id"); %>



<form action="bookSearch.do">
분류선택
	<select name="category" >
	<option value="${book.category }">${book.category }</option>
		<option value="전체">전체 <option value="총류">총류 <option value="IT">IT <option value="과학">과학
		<option value="예술">예술 <option value="언어">언어 <option value="문학">문학 <option value="역사">역사 <option value="기타">기타
	</select>
<input type=text name="searchKeyword" size=50 value="${param.searchKeyword }">
<input type=submit value="검색" class="btn btn-default" ><p>
</form>

검색결과<P>
<hr>


<table class="left_side" border="1">
	<tr>
	<c:if test="${book.image==null}">
		<td><img alt="" src="../bookImage/null.png" width = 149px height = 179px></img></td>
	</c:if>
	<c:if test="${book.image!=null}">
		<td><img alt="미리보기가 없습니다." src="../bookImage/${book.image }" width = 149px height = 179px></img>	</td>
	</c:if>
	</tr>
</table>

<ul class="rigth_side">
	<li><label>분류</label> ${book.category }</li>
	<li><label>제목</label> ${book.title }</li>
	<li><label>저자</label> ${book.author }</li>
	<li><label>출판사</label> ${book.company }</li>
	<li><label>출판연도</label>${book.year }</li>
</ul>

<p></p>

<div class="table-responsive" style="clear: both; padding: 10px;" >
<table class="table table-bordered" >
	<tr><th>소장위치</th><th width="95pt">청구기호</th><th>도서상태</th><th width="200pt">반납기한</th><th>대출상태</th><th>예약상태</th><th>대출</th><th>예약</th></tr>
	<tr><td>${book.area }</td><td>${book.giho }</td><td>${book.state }</td>
	<td>
		<c:if test="${checkout.check_ok == '대출중' }">
			${checkout.checkout_date } ~ ${checkout.checkin_date }
		</c:if>
		<c:if test="${checkout.check_ok != '대출중' }">
			-
		</c:if>
	</td>
	<c:if test="${checkout.check_ok == '대출중' }">
	<td>${checkout.check_ok }</td>
	</c:if>
	<c:if test="${checkout.check_ok != '대출중' }">
			<td>-</td>
		</c:if>
	<td>${reserve.reserve_ok }</td>
	<c:if test="${id == null || id == ''  }">
	<td colspan="2">
	로그인 후 이용해주세요.
	</td>
	</c:if>
	<c:if test="${id != null && id != ''  }">
	<td> 
		<c:if test="${id != null and book.state == 'y'}">
			<c:if test="${checkout.check_ok == '반납' or checkout.book_id == null}">
				<c:if test="${reserve.book_id == null or reserve.reserve_ok != '예약중' }">
					<button onclick="location.href='checkOut.do?book_id=${book.book_id}&id=${id }&searchKeyword=${searchKeyword }&state=${book.state}'" class="btn btn-default">대출하기</button>
				</c:if>
				<c:if test="${reserve.book_id != null or reserve.reserve_ok == '예약중' }">
					<button disabled="disabled" class="btn btn-default">대출하기</button>
				</c:if>
			</c:if>
			<c:if test="${checkout.check_ok == '대출중'}">
				<button disabled="disabled" class="btn btn-default">대출하기</button>
			</c:if>
		</c:if>
		<c:if test="${id == null or book.state == 'n' }">
			<button disabled="disabled" class="btn btn-default">대출하기</button>
		</c:if>	
	</td>
	<td>
	<c:if test="${id != null and book.state == 'n' }">
		<c:if test="${checkout.check_ok == '대출중' and reserve.reserve_ok != '예약중' and id != checkout.id}">
			<button class="btn btn-default" onclick="location.href='reserve.do?book_id=${book.book_id}&id=${id }&searchKeyword=${searchKeyword }'">예약하기</button>
		</c:if>
		<c:if test="${checkout.check_ok != '대출중' or reserve.reserve_ok == '예약중' or id == checkout.id}">
			<button class="btn btn-default" disabled="disabled">예약하기</button>
		</c:if>
	</c:if>
	<c:if test="${id == null or book.state == 'y' }"><button disabled="disabled" class="btn btn-default">예약하기</button></c:if>
	</td>
	</c:if>
</table>
</div>
<hr>
<h3>목차</h3>
<textarea cols="100" rows="10" name="content" required="required" 
				style="width:95%; background-color: white; border: none; resize: none;" wrap="hard" disabled="disabled">${book.book_index}</textarea>
</div>
</body>
</html>