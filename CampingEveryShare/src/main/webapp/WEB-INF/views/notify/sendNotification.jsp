<!-- sendNotification.jsp -->
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function sendNotification() {
            var message = "Your notification message";
            $.ajax({
                type: 'POST',
                url: '/your-context-root/send-notification',
                data: { message: message },
                success: function () {
                    alert("Notification sent successfully!");
                },
                error: function () {
                    alert("Failed to send notification.");
                }
            });
        }
    </script>
</head>
<body>
    <button onclick="sendNotification()">Send Notification</button>
</body>
</html>