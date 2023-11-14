<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>실시간 알림</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>실시간 알림</h2>

<button onclick="sendNotification()">알림 보내기</button>

<div id="notifications"></div>

<script type="text/javascript">
    function sendNotification() {
        $.get("/sendNotification", function (data) {
            console.log(data);
        });
    }

    // SSE 코드
    var eventSource = new EventSource("/getNotifications");
    eventSource.onmessage = function (event) {
        var message = event.data;
        console.log(message)
        $("#notifications").append("<p>" + message + "</p>");
    };
    
</script>

</body>
</html>