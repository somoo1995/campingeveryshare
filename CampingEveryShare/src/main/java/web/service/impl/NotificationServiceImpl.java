package web.service.impl;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.java.Log;
import web.dto.Notification;
import web.service.face.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {
	private final CopyOnWriteArrayList<Notification> notifications = new CopyOnWriteArrayList<>();
    private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Override
	public void addNotification(Notification notification) {
		notifications.add(notification);
//		sendNotificationsToClients(notification);
		
	}

    public CopyOnWriteArrayList<Notification> getMessages() {
        return notifications;
    }

	@Override
	public void addEmitter(SseEmitter emitter) {
		 emitters.add(emitter);
	}

	@Override
	public void removeEmitter(SseEmitter emitter) {
		emitters.remove(emitter);
	}

	@Override
	public void clearEmitters() {
		emitters.clear();
	}
	
    private void sendNotificationsToClients(Notification notification) {
    	logger.info("notification : {}", notification);
    	
        for (SseEmitter emitter : emitters) {
            try {
                emitter.send(SseEmitter.event().data(notification.getMessage()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public CopyOnWriteArrayList<Notification> getNotifications() {
        return notifications;
    }
	
}
