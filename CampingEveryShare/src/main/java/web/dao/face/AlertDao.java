package web.dao.face;

import java.util.List;

import web.dto.Alert;

public interface AlertDao {

	public List<Alert> selectByUser(Alert alert);

}
