package web.service.face;

import java.util.List;

import web.dto.Msg;

public interface MypageService {

	public List<Msg> msgList(Msg msg);

	public void sendMsg(Msg msg);

}