package web.util;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
//	@MessageMapping("/chat.sendMessage")
//	
//	public ChatMessage sendMessage(
//			
//			@Payload ChatMessage chatMessage
//			) {
//		log.info(chatMessage.toString());
//		return chatMessage;
//	}
	@MessageMapping("/chat/{msgNo}/sendMessage")
	@SendTo("/topic/{msgNo}/public")
	public ChatMessage sendMessage(@DestinationVariable String roomId, @Payload ChatMessage chatMessage) {
	    // 서비스 임플 부분 << db에 date를 insert 해주는 구문
		//
		//-------------------------------------------------
		return chatMessage;
	}
	
	
	
	@MessageMapping("/chat.addUser")
	@SendTo("/topic/public")
	public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
	    // Add username in web socket session
	    headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
	    return chatMessage;
	}
	
	@GetMapping("/layout/header")
	public void dd() {
		
	}
}
