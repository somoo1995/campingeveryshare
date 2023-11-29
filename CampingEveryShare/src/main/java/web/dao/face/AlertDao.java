package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Alert;

public interface AlertDao {

	public List<Map<String, Object>> selectByUser(Alert alert);

	public int insertAlert(Alert alert);

	public void updateAlertStatus(Alert alert);

	public int countStatus(Alert alert);

}
