<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Page</title>
    <script src="https://cdn.jsdelivr.net/sockjs/1.0.3/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <h2>Spring WebSocket Chat</h2>
    <form>
        <input type="text" id="user" placeholder="Enter your name"/>
        <input type="text" id="message" placeholder="Enter a message"/>
        <button onclick="sendMessage(); return false;">Send</button>
    </form>
    <ul id="messages"></ul>

    <script>
        var socket = new SockJS('/chat');
        var stompClient = Stomp.over(socket);

        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/topic/messages', function(messageOutput) {
                displayMessage(JSON.parse(messageOutput.body));
            });
        });

        function sendMessage() {
            var user = document.getElementById('user').value;
            var message = document.getElementById('message').value;
            stompClient.send("/app/message", {}, JSON.stringify({'user': user, 'content': message}));
        }

        function displayMessage(message) {
            var messages = document.getElementById('messages');
            var messageElement = document.createElement('li');
            messageElement.appendChild(document.createTextNode(message.user + ": " + message.content));
            messages.appendChild(messageElement);
        }
    </script>
</body>
</html>