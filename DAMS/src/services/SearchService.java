package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
