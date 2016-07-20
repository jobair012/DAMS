package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import beans.AppointmentBean;
import daos.AppointmentDao;

@Service
public class AppointmentService {
	
	@Autowired
	private AppointmentDao appointmentDao;

	public void saveNewAppointmentRequest(AppointmentBean appointment) {
		
		appointmentDao.saveNewAppointmentRequest(appointment);
	}

	public List<AppointmentBean> getAllAppointments(String username) {
		
		return appointmentDao.getAllAppointments(username);
	}

	public List<AppointmentBean> getAllPendingAppointments(String username) {
		
		return appointmentDao.getAllPendingAppointments(username);
	}

	public void updateAppointments(AppointmentBean aptmnt) {
		
		appointmentDao.updateAppointments(aptmnt);
		
	}

}
