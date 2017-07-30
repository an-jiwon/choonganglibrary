<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중앙도서관::QnA</title>
<link rel="stylesheet" type="text/css" href="../all.css"> 
<style type="text/css">

</style>
<script src="../js/jquery.js"></script>
</head>
<body>
<jsp:include page="../leftbar/leftbar2_3.jsp"></jsp:include>
<div class="wrapper">
	<a id="a1"><img src="board_images/qna1.png"
		width="600px" height="45px"></a>
	<div id="div1" style="display:none"><img src="board_images/qna1_.PNG"></div><p>
	<script>
		$("#a1").click(function() {
			$("#div1").toggle("slow");
		});
	</script>
	<a id="a2"><img src="board_images/qna2.png"
		width="600px" height="45px"></a>
	<div id="div2" style="display:none"><img src="board_images/qna2_.PNG"></div><p>
	<script>
		$("#a2").click(function() {
			$("#div2").toggle("slow");
		});
	</script>
	<a id="a3"><img src="board_images/qna3.png"
		width="600px" height="45px"></a>
	<div id="div3" style="display:none"><img src="board_images/qna3_.PNG"></div><p>
	<script>
		$("#a3").click(function() {
			$("#div3").toggle("slow");
		});
	</script>
	<a id="a4"><img src="board_images/qna4.png"
		width="600px" height="45px"></a>
	<div id="div4" style="display:none"><img src="board_images/qna4_.PNG"></div><p>
	<script>
		$("#a4").click(function() {
			$("#div4").toggle("slow");
		});
	</script>
	<a id="a5"><img src="board_images/qna5.png"
		width="600px" height="45px"></a>
	<div id="div5" style="display:none"><img src="board_images/qna5_.PNG"></div><p>
	<script>
		$("#a5").click(function() {
			$("#div5").toggle("slow");
		});
	</script>
	<a id="a6"><img src="board_images/qna6.png"
		width="600px" height="45px"></a>
	<div id="div6" style="display:none"><img src="board_images/qna6_.PNG"></div><p>
	<script>
		$("#a6").click(function() {
			$("#div6").toggle("slow");
		});
	</script>
	<a id="a7"><img src="board_images/qna7.png"
		width="600px" height="45px"></a>
	<div id="div7" style="display:none"><img src="board_images/qna7_.PNG"></div><p>
	<script>
		$("#a7").click(function() {
			$("#div7").toggle("slow");
		});
	</script>
</div>
</body>
</html>

