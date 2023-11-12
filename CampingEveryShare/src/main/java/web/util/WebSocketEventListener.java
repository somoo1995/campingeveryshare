package web.util;

import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WebSocketEventListener {
	
	private final SimpMessageSendingOperations messageTemplate = null;
	@EventListener
	public void handleWebSocketDisconnectListener(
			SessionDisconnectEvent event) {
		StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
		String username = (String)headerAccessor.getSessionAttributes().get("username");
		
//		if (username != null) {
//			log.info("User disconnected : {}", username);
//			var chatMessage = ChatMessage.builder()
//					.type(MessageType.LEAVE)
//					.build();
//			messageTemplate.convertAndSend("/topic/public",chatMessage);
//		}
	}
	

}
