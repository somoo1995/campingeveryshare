<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="../layout/header.jsp" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<style>

.container {
  width: 1300px;
}

.msgmain {
  display: flex;
  border: 1px solid;
  min-height: 800px;
  width: 1300px;
}

.msglist {
  display: flex;
  flex-direction: column;
  border: 1px solid;
  width: 400px;
  flex-shrink: 0;
  padding-bottom: 10px;
  overflow-y: auto;
  max-height: 800px;
}

.msgcontent {
  display: flex;
  flex-direction: column;
  border: 1px solid;
  width: 600px;
  max-height: 800px; /* Ensure this is fixed or has a max-height */
  overflow-y: hidden; /* Hide overflow */
  justify-content: space-between;
}

.messages-container {
  display: flex;
  flex-direction: column;
  overflow-y: auto; /* Allow scrolling */
  flex-grow: 1;
  max-height: 750px; /* Adjust this value as needed */
  width: 598px;
}


.msgprofile {
  border: 1px solid;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
}

.container {
  margin-left: -10px;
  margin-right: 0px;
}

.msginput {
  width: 100%;
  border: 1px solid;
  height: 150px;
}

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
  font-size: 11px;
  margin-top: 33px;
}

.receive-time {
  margin-left: auto;
  padding-left: 10px; /* Adjust as needed */
  font-size: 11px;
  margin-top: 33px;
}


.msgFilter {
  display: flex;
  justify-content: space-between;
  padding: 10px;
  border-bottom: 1px solid #ccc;
}

.msgmain .hidden {
  display: none;
}

.msgObject:hover {
  background-color: #f7f7f7;
}

.msgPrompt {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 800px;
  width: 800px;
}
.msgObject-unread {
    background-color: #F3F781; /* 배경색을 변경하고 싶은 색상으로 설정하세요 */
}
  .msgObject-img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 10px;
  }

.msgObject-content {
  flex-grow: 1; /* 나머지 공간을 채움 */
  display: flex;
  flex-direction: column; /* 내용을 세로로 쌓음 */
  justify-content: center; /* 세로 방향 중앙 정렬 */
  align-items: flex-start; /* 가로 방향 시작 부분 정렬 */
}

  .msgObject-username {
    font-weight: bold;
  }

  .messagePreview {
    color: #555;
  }

  .lastMessageTime {
    margin-left: 10px;
    color: #aaa;
  }
.msgObject {
  display: flex; /* Flex container 설정 */
  align-items: center; /* 세로 중앙 정렬 */
  padding: 10px; /* 패딩 설정 */
  /* 기타 스타일 */
}

.msgObject-username, .messagePreview {
  white-space: nowrap; /* 텍스트가 넘칠 경우 줄바꿈 없이 처리 */
}

.userImg img{
	width: 200px;
	height: 200px;
	border-radius: 70%;
}
.pros{
	display: flex;
	flex-direction: column;
	align-items: center;
	border: 1px solid;
	background-color: #04B404;
	width: 296px;
}
.userNick{
	width: 296px;
	background-color: white;
	text-align: center;
}
</style>

<script >
var roomNo;
var currentUserId;
var receiverId;
var socket;
var select;
var userId;
var lastSentRoomNo;
var stompClient = null; 
var currentUserIdSubscription;
var receiverIdSubscription;
var newRoom
var makingRoom = false;
var newChatMessage;
var sendNewFlag = 0;
var newBoardNo;
var newTitle;
var newBoardCate;
var newNick;
var newProfile;
function scrollToBottom() {
    var messagesContainer = $('.messages-container');
    messagesContainer.scrollTop(messagesContainer.prop("scrollHeight"));
  }
function connectToRoom(roomNumber) {
    disconnectWebSocket(); // 기존 연결 해제
    console.log("connectToRoom-------------")
    roomNo = roomNumber;
    socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);

    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/' + roomNo + '/public', onMessageReceived);
        if(makingRoom &&currentUserId == newChatMessage.writerId){
            // 여기서 메시지 전송 로직을 수행
            sendNewFlag = 1;
    		stompClient.send("/app/chat/" + roomNo + "/sendMessage",{},JSON.stringify(newChatMessage))
    		console.log("이게 바로 새 메세지 발송하는거다.")
    		makingRoom=false;
    		sendNewFlag = 0;
    		lastSentRoomNo = roomNo;
    		
        }
        // 사용자 추가 메시지 보내기
        stompClient.send("/app/chat.addUser", {}, JSON.stringify({ 'currentUserId': currentUserId, 'userId':currentUserId, 'roomNo': roomNo }));
    }, onError);
}
function onError(){
	console.log("에러뜸!")
}
function sendMessage(event){
	console.log("sendMessage function start")
	lastSentRoomNo = roomNo;
	
	var messageContent = $('.msginput form').find('input[name="message"]').val()
	
	if(messageContent && stompClient){
		console.log("데이터 전송 시작")
		var chatMessage = {
			roomNo: roomNo,
			writerId: currentUserId,
			content: messageContent
		}
		stompClient.send("/app/chat/" + roomNo + "/sendMessage",{},JSON.stringify(chatMessage))
		
		
	}
}

function onMessageReceived(payload) {
    console.log("소켓에서 메세지 받는중")
    var newMessage = JSON.parse(payload.body);
    console.log(newMessage)
    var messageElement, wrapperElement, timeElement;
    var timestamp1 = newMessage.postDate;
    var date1 = new Date(timestamp1);
    var dateFormatter1 = new Intl.DateTimeFormat('ko-KR', {
        year: 'numeric', month: '2-digit', day: '2-digit', 
        hour: '2-digit', minute: '2-digit', hour12: false
    });
    var formattedDate1 = dateFormatter1.format(date1);
    console.log("여기 지나오나??");
    timeElement = $('<div>').text(formattedDate1);
    if(newMessage.receiverId === currentUserId) {
        // Received message
        messageElement = $('<div>').addClass('msgReceiverContent').text(newMessage.content);
        wrapperElement = $('<div>').addClass('message-receiver-wrapper');
        wrapperElement.append(messageElement).append(timeElement.addClass('receive-time'));
    } else {
        // Sent message
        messageElement = $('<div>').addClass('msgSendContent').text(newMessage.content);
        wrapperElement = $('<div>').addClass('message-send-wrapper');
        wrapperElement.append(timeElement.addClass('send-time')).append(messageElement);
    }

    // Append the wrapper element to the correct container
    $('.messages-container').append(wrapperElement);
      scrollToBottom()
	if(stompId && newMessage && sendNewFlag == 0){
		stompId.send("/app/chat/" + receiverId + "/sendStatus",{},JSON.stringify(newMessage))
	}
}


function disconnectWebSocket() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}

function connectWebSocket() {
    var socketId = new SockJS('/ws');
    stompId = Stomp.over(socketId);
    stompId.connect({}, function() {
        console.log("WebSocket connected");
        // 최초 접속 시, currentUserId로 구독
        subscribeToCurrentUserId();
    }, onErrorId);
}

function subscribeToCurrentUserId() {
    if (stompId && !currentUserIdSubscription) {
        currentUserIdSubscription = stompId.subscribe('/topic/' + currentUserId + '/public/g', onReceivedId);
    }
}
function subscribeToReceiverId() {
    // 기존 receiverId 구독이 있다면 해제
    if (receiverIdSubscription) {
        receiverIdSubscription.unsubscribe();
    }
    receiverIdSubscription = stompId.subscribe('/topic/' + receiverId + '/public/g', onReceivedId);
}
function onErrorId(){
	console.log("에러에용")
}
function onReceivedId(payload){
	console.log("onReceivedId function start...")
	newChatMessage = JSON.parse(payload.body);
	var testMsg = JSON.parse(payload.body)
	if(testMsg.msgStatus === 3){
		console.log("이건 아직 새로 만들거다.");
		if(testMsg.writerId == currentUserId){
		roomNo = testMsg.roomNo;
		console.log("새로운 채팅방으로 구독 시작")
		connectToRoom(roomNo);
		lastSentRoomNo = roomNo;
		console.log("이거 연결 됐다!!")
		}
		var messagePreview = testMsg.content.length > 10 ? testMsg.content.substring(0, 10) + '...' : testMsg.content;
		var date = new Date(testMsg.postDate);
	    var dateFormatter = new Intl.DateTimeFormat('ko-KR', { 
	        hour: '2-digit', minute: '2-digit', hour12: false
	    });
	    console.log("룸넘버는!!!!!!")
	    console.log(testMsg.roomNo)
	    roomNo = testMsg.roomNo;
	    
	    if(currentUserId === testMsg.writerId){
	    	var ID = testMsg.receiverId
	    }else{
	    	var ID = testMsg.writerId
	    }

	    var formattedDate = dateFormatter.format(date);
	    var chatRoomDiv = $('<div>')
        .addClass('msgObject')
        .attr('room_no',  testMsg.roomNo.toString())
	    .attr('data-board-no', newBoardNo) // boardNo 데이터 속성 추가
	    .attr('data-title', newTitle) // title 데이터 속성 추가
	    .attr('data-board-cate', newBoardCate) // boardCate 데이터 속성 추가
	    .attr('data-nick', testMsg.userNick) // nick 데이터 속성 추가
	    .attr('data-profile', testMsg.profile) // profile 데이터 속성 추가
        .append(
            $('<img>').attr('src', '/resources/img/profile'+newProfile+'.jpg').addClass('msgObject-img'),
            $('<div>').addClass('msgObject-content')
                .append(
                    $('<div>').addClass('msgObject-username').text(newUserNick),
                    $('<div>').addClass('messagePreview').text(messagePreview)
                ),
            $('<div>').addClass('lastMessageTime').text(formattedDate)
        );
	    $('.msgObjects').prepend(chatRoomDiv);
	    if(currentUserId == testMsg.receiverId){
	    	chatRoomDiv.css('background-color', '#F3F781');
	    }
	    return;
	}
	console.log(testMsg)
    var chatRoomDiv = $('.msgObject[room_no="' + testMsg.roomNo + '"]');
    var updatedContent = testMsg.content;

    if(updatedContent.length > 10) {
        updatedContent = updatedContent.substring(0, 10) + '...';
    }

    // 업데이트된 내용으로 각 요소의 텍스트를 설정합니다.
    chatRoomDiv.find('.messagePreview').text(updatedContent);

    // 날짜 포매팅 로직
    var timestamp = testMsg.postDate;
    var date = new Date(timestamp);
    var dateFormatter = new Intl.DateTimeFormat('ko-KR', { 
        hour: '2-digit', minute: '2-digit', hour12: false
    });
    var formattedDate = dateFormatter.format(date);
    chatRoomDiv.find('.lastMessageTime').text(formattedDate);

    // 채팅방 위치 이동
    $('.msgObjects').prepend(chatRoomDiv);

    // 배경색 변경
    if(testMsg.roomNo != lastSentRoomNo) {
        chatRoomDiv.css('background-color', '#F3F781');
    }
}


function formatDate(timestamp) {
    // Create a new Date object from the timestamp
    var date = new Date(timestamp * 1000); // The timestamp is in seconds, Date() requires milliseconds
    // Format the date and time
    return date.toLocaleString('ko-KR'); // This will use the Korean locale
}
$(document).ready(function() {
	$('.msginput form').on('submit', function(event) {
        event.preventDefault(); // 기본 submit 동작 방지
        var message = $(this).find('input[name="message"]').val(); // input 필드의 값을 가져옴
        if(makingRoom == false){
        sendMessage()
        }else if(makingRoom ==true){
        	console.log("makingNewRoom start")
        	receiverId = newRoom.newReceiverId;
        	subscribeToReceiverId(receiverId)
        	var newChatMessage = {
			writerId: currentUserId,
			content: message,
			receiverId: receiverId,
			boardNo: newRoom.newBoardNo,
			boardCate: newRoom.newBoardCate,
			msgStatus: 3
		}
          if(stompId && newChatMessage && makingRoom){
            stompId.send("/app/chat/" + receiverId + "/sendStatus",{},JSON.stringify(newChatMessage))
          }
        }

        $(this).find('input[name="message"]').val(''); // input 필드를 지움
        $('.msginput input').attr('placeholder', '메시지를 입력해 주세요.');
        return;
        // 여기에 메시지 전송 로직을 추가할 수 있습니다.
    });
	 
	  currentUserId = '<c:out value="${sessionScope.loginId}"/>'; // JSP EL to get current user ID

		$('.msgObjects').on('click', '.msgObject', function() {
	    roomNo = $(this).attr('room_no');
	   	var boardNo = $(this).data("boardNo");
	   	var title = $(this).data("title");
	   	var boardCate = $(this).data("boardCate");
	    var nick = $(this).data("nick");
	    var profile = $(this).data("profile")
	    $('.userImg img').attr('src', '/resources/img/profile' + profile + '.jpg');
	    $('.userNick span').text(nick);
	    var categoryText = '';
	    switch (boardCate) {
	        case 1:
	            categoryText = '캠핑카 대여';
	            break;
	        case 2:
	            categoryText = '캠핑존 공유';
	            break;
	        case 3:
	            categoryText = '캠핑인원 모집';
	            break;
	        case 4:
	            categoryText = '중고장터';
	            break;
	        default:
	            categoryText = '기타';
	    }
	    $('.category h2').text(categoryText);
	    
	    var linkUrl = '';
	    switch (boardCate) {
	        case 1:
	            linkUrl = '/rent/view?carNo=' + boardNo;
	            break;
	        case 2:
	            linkUrl = '/share/view?boardNo=' + boardNo+'&boardCate='+boardCate
	            break;
	        case 3:
	            linkUrl = '/market/view?boardNo=' + boardNo+'&boardCate='+boardCate
	            break;
	        case 4:
	            linkUrl = '/group/view?boardNo=' + boardNo+'&boardCate='+boardCate
	            break;
	    }
	    $('.link h2 a').attr('href', linkUrl).text(title);
	   	console.log("ajax 시작전 데이터 체크");
	   	console.log(boardNo)
	   	console.log(title)
	   	console.log(boardCate)
	   	console.log(nick)
	   	console.log(profile)
	    
	    lastSentRoomNo = $(this).attr('room_no');
	    // Hide the prompt and show the message content
	    $('.msgPrompt').addClass('hidden');
	    $('.msgcontent, .msgprofile').removeClass('hidden');
	    $(this).css('background-color','white');

	    // AJAX call to get messages
	    $.ajax({
	      url: './msgload',
	      type: 'GET',
	      data: { RoomNo: roomNo,
	    	  currentUserId: currentUserId
	      },
	      success: function(messages){
	        // Clear previous messages
	        $('.messages-container').empty();
	        console.log("ajax데이터")
	        // Iterate through messages and add to the page
	        messages.forEach(function(message) {
	            var messageElement, wrapperElement, timeElement;
// 	            console.log(message.receiverId)
// 	            console.log("여기서 확인해보자구요?")
	            if(currentUserId === message.writerId){
	            	receiverId = message.receiverId
	            }else{
	            	receiverId = message.writerId
	            }
	            var timestamp = message.postDate;
	            var date = new Date(timestamp);
	            var dateFormatter = new Intl.DateTimeFormat('ko-KR', {
	                year: 'numeric', month: '2-digit', day: '2-digit', 
	                hour: '2-digit', minute: '2-digit', hour12: false
	            });
	            var formattedDate = dateFormatter.format(date);
	            //console.log(formattedDate)
	            timeElement = $('<div>').text(formattedDate);
	            if(message.receiverId === currentUserId) {
	                // Received message
	                messageElement = $('<div>').addClass('msgReceiverContent').text(message.content);
	                wrapperElement = $('<div>').addClass('message-receiver-wrapper');
	                wrapperElement.append(messageElement).append(timeElement.addClass('receive-time'));
	            } else {
	                // Sent message
	                messageElement = $('<div>').addClass('msgSendContent').text(message.content);
	                wrapperElement = $('<div>').addClass('message-send-wrapper');
	                wrapperElement.append(timeElement.addClass('send-time')).append(messageElement);
	            }

	            // Append the wrapper element to the correct container
	            $('.messages-container').append(wrapperElement);
	              scrollToBottom()
	        });
	        select = 1
	        
		    console.log(receiverId)
		    console.log("리시버 아이디로 접속을 할거야 이건 뜨면")
		    subscribeToReceiverId(receiverId)
	      },
	      error: function(error){
	        console.log("AJAX request failed");
	      }
	    });
	    connectToRoom(roomNo);
	    var userId = '<c:out value="${sessionScope.loginId}"/>'
	    
	  });
//====================================================onfunction로직 시작 부분=====================================
	console.log("onfunction 로직 시작")
	currentUserId = '<c:out value="${sessionScope.loginId}"/>';
	connectWebSocket()
	console.log("현재 아이디로 구독 완료")
    var newMaking = '<c:out value="${newMaking}" escapeXml="false"/>';
    if(newMaking) {
        newRoom = JSON.parse(newMaking);
        console.log(newRoom.newBoardCate);
        console.log(newRoom.newBoardNo);
        console.log(newRoom.newReceiverId);
        makingRoom = true;
        console.log(newRoom)
        $('.msginput input').attr('placeholder', '메시지를 입력하면 새로운 채팅이 시작됩니다.');
        $('.msgPrompt').addClass('hidden');
        $('.msgcontent, .msgprofile').removeClass('hidden');
        newBoardNo = newRoom.newBoardNo
        newTitle = newRoom.newTitle
        console.log("이거 왜 안 들어옴?")
        console.log(newTitle);
        newBoardCate = newRoom.newBoardCate
        newNick = newRoom.newNick
        newProfile = newRoom.newProfile
	    $('.userImg img').attr('src', '/resources/img/profile' + newProfile + '.jpg');
	    $('.userNick span').text(newNick);
	    var categoryText = '';
	    switch (newBoardCate) {
	        case 1:
	            categoryText = '캠핑카 대여';
	            break;
	        case 2:
	            categoryText = '캠핑존 공유';
	            break;
	        case 3:
	            categoryText = '캠핑인원 모집';
	            break;
	        case 4:
	            categoryText = '중고장터';
	            break;
	        default:
	            categoryText = '기타';
	    }
	    $('.category h2').text(categoryText);
	    
	    var linkUrl = '';
	    switch (newBoardNo) {
	        case 1:
	            linkUrl = '/rent/view?carNo=' + newBoardNo;
	            break;
	        case 2:
	            linkUrl = '/share/view?boardNo=' + newBoardNo+'&boardCate='+boardCate
	            break;
	        case 3:
	            linkUrl = '/market/view?boardNo=' + newBoardNo+'&boardCate='+boardCate
	            break;
	        case 4:
	            linkUrl = '/group/view?boardNo=' + newBoardNo+'&boardCate='+boardCate
	            break;
	    }
	    $('.link h2 a').attr('href', linkUrl).text(newTitle);
        
    }
    var targetRoomNo = '<c:out value="${targetRoomNo}" escapeXml="false"/>'
    if(targetRoomNo){
    	console.log("이것 지나오나요?")
    	 $(".msgObject[room_no='" + targetRoomNo + "']").click();
    }
	console.log("이것들이 나오나요?")
	
    
	 
	});

</script>
<!-- 작성 공간 -->
<div class="container">

<div class="pageTitle">
<h3 id="pageTitle">메세지</h3>
<hr style="width: 1300px;">
</div>
<div class="msgmain">

<div class="msglist">
  <div class="msgFilter">
    <!-- 필터 메뉴 -->
    <select name="filter" style=" padding: 10px; margin-right: 10px;">
      <option value="all">전체</option>
      <option value="rent">대여</option>
      <option value="recruit">모집</option>
      <option value="market">중고장터</option>
    </select>
    
    <!-- 검색창 -->
    <form method="post" style="display: flex; align-items: center;"> <!-- action 속성 추가 예정 -->
  <input type="text" placeholder="검색" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; flex-grow: 1;">
  <!-- 이미지 버튼 -->
  <button type="submit" style="border: none; background: none; padding: 0; margin-left: 10px;">
    <img alt="search" src="/resources/img/search_gray.png" style="width:35px; height:35px; margin-left:-64px;">
  </button>
</form>

   	
  </div>
  <!-- 나머지 msglist 내용 -->
<div class="msgObjects">
  <c:forEach var="list" items="${list}">
    <div class="msgObject ${list.msgStatus == 1 ? 'msgObject-unread' : ''}"  room_no="${list.roomNo}" data-board-no=${list.boardNo } data-title=${list.title } data-board-cate=${list.boardCate } data-nick=${list.userNick } data-profile=${list.profile }>
	 <img src="/resources/img/profile${list.profile}.jpg" alt="Profile Image" class="msgObject-img">
      <div class="msgObject-content">
        <div class="msgObject-username">${list.userNick}</div>
        <div class="messagePreview">
          <c:choose>
            <c:when test="${fn:length(list.messagePreview) > 10}">
              ${fn:substring(list.messagePreview, 0, 10)}...
            </c:when>
            <c:otherwise>
              ${list.messagePreview}
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <div class="lastMessageTime">${list.lastMessageTime}</div>
    </div>
  </c:forEach>
</div>
</div>
 <div class="msgPrompt" >
      <span>메시지 리스트를 선택해주세요.</span>
 </div>
<div class="msgcontent hidden">
  <div class="messages-container">
  </div>
  <!-- 보내는 사람 메시지 -->
  
<div class="msginput">
  <form method="post"> <!-- 나중에 action 속성 추가 예정 -->
    <input type="text" placeholder="메세지를 입력해주세요" name="message"  autocomplete="off"  style="width: 80%; padding: 10px; margin-right: 10px; border-radius: 5px; border: 1px solid #ccc;
    height: 140px;">
    <button type="submit" style="padding: 10px 20px; border-radius: 5px; border: none; background-color: #4CAF50; color: white;">보내기</button>
  </form>
</div>
</div>
<div class="msgprofile hidden">

<div class="pros">
<div class="userImg">
<img alt="이미지 없음" src="/resources/img/profile1.jpg">
</div>
<div class="userNick">
<span>유저닉</span>
</div>
</div>

<div class="category">
<h2>카테고리 들어갈곳</h2>
</div>
<div class="link">
<h2><a href="링크">글제목 들어갈곳</a></h2>
</div>

</div>

</div>


</div><!-- .container -->
<c:import url="../layout/footer.jsp" />