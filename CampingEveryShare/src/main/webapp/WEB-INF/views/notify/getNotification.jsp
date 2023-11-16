<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var urlEndPoint = "/getnotification?userId=" + "${loginId}"
	var eventSource = new EventSource(urlEndPoint)
	
	eventSource.onmessage = function (event) {
		console.log(event)
	    var message = event.data;
	    console.log(message)
	    $("#notifications").append("<p>" + decodeURI(message) + "</p>");
	}
	
// 	eventSource.addEventListener("message", function(event) {
// 		console.log(event.data)
// 		var articleData = JSON.parse( event.data )
// 		console.log("Event : " + event)
// 		$("#notifications").append("<p>" + decodeURI(articleData.message) + "</p>")
// 	})
	
})



</script>

</head>
<body>

<h2>알림 받기</h2>
${loginId }

<div id="notifications"></div>

</body>
</html>