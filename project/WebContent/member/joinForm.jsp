<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.js"></script>
<title>중앙도서관::회원가입</title>

<link rel="stylesheet" type="text/css" href="${path}/all.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function chk() { 														//비밀번호 확인 체크
		if(frm.pass.value != frm.pass2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.pass2.value = "";
			frm.pass2.focus();
			return false;
		}
	}
	function confirm() {													 //아이디 중복 체크
		if (!frm.id.value) { 
			alert("아이디 입력후에 체크하세요");
			frm.id.focus();  
			return false;		
			}
			window.open("confirm.do?id="+frm.id.value,"",
			"width=350 height=220");
			
	}
	 function postCode() {												 //우편번호, 주소 찾기
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('addr1').value = fullRoadAddr;
	                

	               /*  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

	                } else {
	                    document.getElementById('guide').innerHTML = '';
	                } */
	                document.getElementById('addr2').focus();
	            }	        
	        }).open();
	        
	    }

</script>
</head>
<body>


<form action="join.do" name="frm" method="post" onsubmit="return chk()">
<div class="table-responsive wrapperjoin">
 <table class="table table-bordered">
	<tr>
		<th width="120pt">아이디</th>
		<td><input type="text" name="id" required="required" autofocus="autofocus">
		<input class="btn btn-default" type="button" name="comfirm" value="아이디 중복 확인" onclick="return confirm()"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pass" required="required"></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="pass2" required="required"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" required="required"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="date" name="birth" required="required"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" name="email" required="required"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="tel" name="phone" required="required" 
		pattern="\d{3}-\d{3,4}-\d{4}" placeholder="000-XXXX-XXXX" title="010-xxxx-xxxx"></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><input type="text" id="zipcode" name="zipcode" required="required" readonly="readonly">
		<input class="btn btn-default" type="button" name="searchzip" value="우편번호찾기"
		onclick="postCode()"></td>
	</tr>
	<tr>
		<th>도로명 주소</th>
		<td><input size="50" type="text" width="200px" id="addr1" name="addr1" required="required"></td>
	</tr>
	<tr>
		<th>상세 주소</th>
		<td><input size="50" type="text" width="200px" id="addr2" name="addr2" required="required"></td>
	</tr>
</table>
		<input class="btn btn-default" style="float: right;" type="button" value="취소하기" name="cancel" onclick="location.href='../main/main.jsp'">
		<input class="btn btn-default" style="float: right;" type="reset" value="다시작성" name="reset">
		<input class="btn btn-default" style="float: right;" type="submit" value="가입하기">
</div>
</form>

</body>
</html>