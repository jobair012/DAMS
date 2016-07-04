package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import beans.AdminBean;
import beans.DoctorBean;
import daos.AdminDao;


@Service
public class AdminService {

	@Autowired
	private AdminDao adminDAO;
	
	public void createAdmin(AdminBean admin){
		
		adminDAO.createAdmin(admin);
	}

	public boolean isEmailExists(String email) {
		
		return adminDAO.isEmailExists(email);
	}

	public List<DoctorBean> getAllPendingDoctors() {
		
		return adminDAO.getAllPendingDoctors();
	}
}
