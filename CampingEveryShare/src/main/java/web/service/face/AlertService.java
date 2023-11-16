package web.service.face;

import java.util.List;

import web.dto.Alert;

public interface AlertService {

	public List<Alert> getList(Alert alert);
	
	public int sendAlert(Alert alert);

	public void readAlert(Alert alert);

	public int hasNew(Alert alert);


}