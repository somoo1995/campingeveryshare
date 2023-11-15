package web.util;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.fasterxml.jackson.databind.ObjectMapper;

import web.dto.Msg;
import web.service.face.MsgService;

@Controller
public class ChatController {
	@Autowired MsgService msgService;
	private final Map<String, Integer> userConnections = new ConcurrentHashMap<>();

	@MessageMapping("/chat/{roomNo}/sendMessage")
	@SendTo("/topic/{roomNo}/public")
	public Msg sendMessage(@DestinationVariable String roomNo, @Payload Msg msg
			,SimpMessageHeaderAccessor headerAccessor) {
		System.out.println("여기 들릅니다");
		System.out.println(msg.toString());
		msg = msgService.sendmessage(msg);
		System.out.println(userConnections);

//
//		if (userConnections.getOrDefault(msg.getReceiverId(), false)) {
//            System.out.println("Receiver is online, updating message status to read");
//            Map<String,Object> map = new ConcurrentHashMap<>();
//            map.put("roomNo", msg.getRoomNo());
//            map.put("userId", msg.getReceiverId());
//            msgService.updateStatus(map);
//        }
		
//		System.out.println(msg.toString());
//		System.out.println("이건 chat컨트롤러에서 받는겁니다!");
		
		
		return msg;
	}
	
	@MessageMapping("/chat/{Id}/sendStatus")
	@SendTo("/topic/{Id}/public/g")
	public Msg sendStatus(@DestinationVariable String Id, @Payload Msg msg) {
		System.out.println("여기 들릅니다 룸상태에요");
		System.out.println(msg.toString());
		msg = msgService.getMessage(msg);
		
		return msg;
	}
	

	@MessageMapping("/chat.addUser")
	@SendTo("/topic/public")
	public void addUser(@Payload Map<String,Object> userInfo, SimpMessageHeaderAccessor headerAccessor) {
		System.out.println("addUserMethod start");
		System.out.println(userInfo);
		
	}
	
	@MessageMapping("/chat.removeUser")
	public void removeUser(String currentUserId) {
	    userConnections.remove(currentUserId);
	}
	
//	@EventListener
//	public void handleWebSocketConnectListener(SessionConnectedEvent event) {
//	    StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
//	    String currentUserId = headerAccessor.getSessionAttributes().get("username").toString();
//	    String roomNo = headerAccessor.getSessionAttributes().get("roomNo").toString(); // 채팅방 번호를 세션에 추가해야 함
//	    userConnections.put(currentUserId + "#" + roomNo, true); // 사용자 ID와 채팅방 번호를 조합한 키를 사용
//	    System.out.println(currentUserId + " connected to room " + roomNo);
//	}
//	
//	@EventListener
//	public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
//	    StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
//	    String currentUserId = headerAccessor.getSessionAttributes().get("username").toString();
//	    String roomNo = headerAccessor.getSessionAttributes().get("roomNo").toString();
//	    userConnections.remove(currentUserId + "#" + roomNo); // 조합된 키를 사용하여 상태 제거
//	    System.out.println(currentUserId + " disconnected from room " + roomNo);
//	}
	
	
	
	
	
	
	
	

	
}
