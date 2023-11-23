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
	private final Map<String, String> userConnections = new ConcurrentHashMap<>();

	@MessageMapping("/chat/{roomNo}/sendMessage")
	@SendTo("/topic/{roomNo}/public")
	public Msg sendMessage(@DestinationVariable String roomNo, @Payload Msg msg
			,SimpMessageHeaderAccessor headerAccessor) {
		System.out.println("여기 들릅니다");
		System.out.println("-----------------------------------------------------");
		if(msg.getMsgStatus() !=3) {
			msg = msgService.sendmessage(msg);			
		}else {
			msg.setMsgStatus(1);
		}
		System.out.println("-----------------------------------------------------");
		System.out.println(msg.toString());
		System.out.println(userConnections);

//
		String receiverStatus = userConnections.get(msg.getReceiverId());
		String receiverId = null;
		if(receiverStatus != null) {
			String[] parts = receiverStatus.split("#");
			receiverId = parts[0];
			roomNo = parts[1];
		}
		
	    if (receiverStatus != null && msg.getReceiverId().equals(receiverId) && msg.getRoomNo() == Integer.parseInt(roomNo) ) {
	        // 읽음 상태로 업데이트
	    	Map<String,Object> map = new HashMap<String, Object>();
	        System.out.println("여기서 이제 읽음상태 업데이트를 해줄거다!!");
	        map.put("userId", receiverId);
		    map.put("roomNo", msg.getRoomNo());
		    msgService.updateStatus(map);
	    }
//		
		
		return msg;
	}
	
	@MessageMapping("/chat/{Id}/sendStatus")
	@SendTo("/topic/{Id}/public/g")
	public Msg sendStatus(@DestinationVariable String Id, @Payload Msg msg) {
		System.out.println("여기 들릅니다 룸상태에요");
		System.out.println(msg.toString());
		if(msg.getMsgStatus() == 3) {
			msg = msgService.getNewRoom(msg);
			msg.setMsgStatus(3);
		}else {
			msg = msgService.getMessage(msg);
			
		}
		
		return msg;
	}
	

	@MessageMapping("/chat.addUser")
	@SendTo("/topic/public")
	public void addUser(@Payload Map<String,Object> userInfo, SimpMessageHeaderAccessor headerAccessor) {
		System.out.println("addUserMethod start");
		System.out.println(userInfo);
		System.out.println("userId : " + userInfo.get("userId"));
		String userId = (String) userInfo.get("userId");
		System.out.println("roomNo : " + userInfo.get("roomNo"));
		String roomNo = (String) userInfo.get("roomNo");
		String status = userId + "#" +roomNo;
		userConnections.put(userId, status);
		headerAccessor.getSessionAttributes().put("currentUserId", status);
		
	}
	

//	
	@EventListener
	public void handleWebSocketDisconnectListener(
			SessionDisconnectEvent event) {
		StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
		String username = (String)headerAccessor.getSessionAttributes().get("currentUserId");	
		System.out.println("handleWebSocketDisconnectListener start");
		if (username != null) {
			System.out.println(username + "방을 떠남");
			userConnections.remove(username);
		}
	}
	
	
	
	
	
	
	
	

	
}
