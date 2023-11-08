package web.dao.face;

import java.util.List;

import web.dto.Msg;

public interface MypageDao {

	public List<Msg> selectByReceiver(Msg msg);

	public void insertMsg(Msg msg);

}
