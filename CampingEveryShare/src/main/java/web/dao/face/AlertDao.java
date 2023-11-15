package web.dao.face;

import java.util.List;

import web.dto.Alert;

public interface AlertDao {

	public List<Alert> selectByUser(Alert alert);

	public int insertAlert(Alert alert);

	public void updateAlertStatus(Alert alert);

	public int countStatus(Alert alert);

}
