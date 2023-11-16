<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
//     function sendNotification() {
//         $.post("/sendnotification", function (data) {
//             console.log(data);
//         });
//     }
   
</script>
</head>
<body>
<h2>알림 보내기</h2>
${loginId }
	<form action="/alert/sendnotification" method="post">
		<input type="text" name="userId" placeholder="사용자 아이디">
		<select name="boardCate">
			<option value="7">캠핑카</option>
			<option value="1">대여</option>
		</select>
		<input type="text" name="boardNo" placeholder="게시글 번호">
		<select name="content">
			<option value="1">승인</option>
			<option value="2">보류</option>
			<option value="3">불가</option>
			<option value="4">예약</option>
			<option value="5">취소</option>
		</select>

		<button id="btn">Send</button>
	</form>

</body>
</html>