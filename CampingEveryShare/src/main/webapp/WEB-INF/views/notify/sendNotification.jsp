<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
    function sendNotification() {
        $.post("/sendnotification", function (data) {
            console.log(data);
        });
    }
   
</script>
</head>
<body>
<h2>알림 보내기</h2>
${loginId }
	<form action="/sendnotification" method="post">
		<input type="text" value="user1" name="userId">
		<input type="text" value="Hello" name="message">
		<button id="btn">Send</button>
	</form>
    <button onclick="sendNotification()">Send Notification</button>
</body>
</html>