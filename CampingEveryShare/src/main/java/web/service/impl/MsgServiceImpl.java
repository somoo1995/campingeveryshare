package web.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.sql.TIMESTAMP;
import web.dao.face.MsgDao;
import web.dto.Msg;
import web.dto.User;
import web.service.face.MsgService;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.ZoneId;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Service
public class MsgServiceImpl implements MsgService {
	@Autowired MsgDao msgDao;

	@Override
	public List<Map<String, Object>> getmsglist(User user) {
	    List<Map<String, Object>> list = msgDao.selectRoomNo(user);
	    DateTimeFormatter formatter;
	    LocalDateTime now = LocalDateTime.now();

	    for (Map<String, Object> map : list) {
	        Object tsObject = map.get("lastMessageTime");

	        // Oracle TIMESTAMP 타입 체크 및 변환
	        Timestamp ts = null;
	        if (tsObject instanceof TIMESTAMP) {
	            try {
					ts = ((TIMESTAMP) tsObject).timestampValue();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        } else {
	            // 이미 java.sql.Timestamp 타입인 경우
	            ts = (Timestamp) tsObject;
	        }

	        LocalDateTime messageTime = ts.toLocalDateTime();

	        // 날짜 포맷 결정 로직은 동일하게 유지
	        if (messageTime.isAfter(now.minusDays(1))) {
	            formatter = DateTimeFormatter.ofPattern("HH:mm");
	        } else {
	            formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd ");
	        }

	        // 포맷된 날짜로 업데이트
	        String formattedDate = messageTime.format(formatter);
	        map.put("lastMessageTime", formattedDate);
	    }

	    return list;
	}

	@Override
	public List<Msg> getMsgLoad(Msg roomNo, String currentUserId) {
		List<Msg> msg = new ArrayList<Msg>();
		msg = msgDao.selectByRoomNo(roomNo);
		DateTimeFormatter formatter;
	    for (Msg msglist : msg) {
	        Date tsObject = msglist.getPostDate();
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        String formattedDate = dateFormat.format(tsObject);
	        Date target = null;
			try {
				target = dateFormat.parse(formattedDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	        msglist.setPostDate(target);
//	        System.out.println(msglist.getPostDate());
//	        System.out.println("여기서 확인해봐");
	        
	    }
	    Map<String,Object> map = new HashMap<String, Object>();
	    map.put("userId", currentUserId);
	    map.put("roomNo", roomNo.getRoomNo());
	    msgDao.updateStatus(map);
		
		return msg;
	}

	@Override
	public Msg sendmessage(Msg msg) {
		String content = msg.getContent();
		String writer = msg.getWriterId(); //user1
		System.out.println("writer Id : " + writer);
		msg = msgDao.getColunmInfo(msg);
		String sender = msg.getWriterId();
		msg.setWriterId(writer);
		if(msg.getReceiverId().equals(writer)) {
			msg.setReceiverId(sender);
		}
		
		msg.setContent(content);
		System.out.println(msg.toString());
		msgDao.insertmessage(msg);
		Integer msgNo = msg.getMsgNo();
		System.out.println("새로 얻은 msgNo : " + msgNo);
		msg = msgDao.selectByMsgNo(msg);
		System.out.println("새로 얻은 객체 : " + msg);
		return msg;
	}
	
	

	@Override
	public Msg getMessage(Msg msg) {
		// TODO Auto-generated method stub
		return msgDao.selectByRoomNoLast(msg);
	}

	@Override
	public void updateStatus(Map<String, Object> map) {
		msgDao.updateStatus(map);
	}


	


}
