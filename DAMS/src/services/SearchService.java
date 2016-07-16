package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import beans.DoctorBean;
import daos.AreaDao;
import daos.DoctorsDao;

@Service
public class SearchService {

	@Autowired
	private AreaDao areaDao;
	
	@Autowired
	private DoctorsDao doctorsDao;
	
	public List<String> getAllArea(){
		
		return areaDao.getAllArea();
	}
	
	public List<String> getAllDoctorsName(String term){
		
		return doctorsDao.getAllDoctorsName(term);
	}

	public List<DoctorBean> getAllDoctors(String doctorsName, String area, String specializedSection, String gender) {
	
		return doctorsDao.getAllDoctors(doctorsName, area, specializedSection, gender);
	}

	public List<DoctorBean> getAllDoctors() {
		
		return doctorsDao.getAllDoctors();
	}
}
