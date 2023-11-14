package web.service.face;

import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import web.dto.Notification;

public interface NotificationService {

	public void addNotification(Notification message);

	public List<Notification> getMessages();

	public void addEmitter(SseEmitter emitter);

	public void removeEmitter(SseEmitter emitter);

	public void clearEmitters();

  
	
}
