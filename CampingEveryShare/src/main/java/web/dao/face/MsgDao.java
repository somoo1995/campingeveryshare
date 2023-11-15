package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Msg;
import web.dto.User;

public interface MsgDao {

	public List<Map<String, Object>> selectRoomNo(User user);

	public List<Msg> selectByRoomNo(Msg roomNo);

	public int insertmessage(Msg msg);

	public Msg getColunmInfo(Msg msg);

	public Msg selectByMsgNo(Msg msg);

	public Msg selectByRoomNoLast(Msg msg);

	public void updateStatus(Map<String, Object> map);



}
