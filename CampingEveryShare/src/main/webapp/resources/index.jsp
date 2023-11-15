<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.msgSendContent {
  align-self: flex-end;
  background-color: #dcf8c6;
  margin: 10px 0;
  padding: 10px;
  border-radius: 10px;
  max-width: 80%;
}

.msgReceiverContent {
  align-self: flex-start;
  background-color: #f1f1f1;
  margin: 10px 0;
  padding: 10px;
  border-radius: 10px;
  max-width: 80%;
}

.message-send-wrapper {
  align-self: flex-end;
  display: flex;
}

.message-receiver-wrapper {
  align-self: flex-start;
  display: flex;
}

.send-time {
  margin-right: auto;
  padding-right: 10px; /* Adjust as needed */
}

.receive-time {
  margin-left: auto;
  padding-left: 10px; /* Adjust as needed */
}
</style>
<body>
<div class="message-send-wrapper">
  <div class="send-time">10:45</div>
  <div class="msgSendContent">Hello!</div>
</div>

<div class="message-receiver-wrapper">
  <div class="msgReceiverContent">Hi there!</div>
  <div class="receive-time">10:46</div>
</div>
</body>
</html>