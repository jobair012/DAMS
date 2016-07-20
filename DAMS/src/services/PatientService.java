package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import beans.PatientBean;
import daos.PatientDao;

@Service
public class PatientService {

	@Autowired
	private PatientDao patientDao;

	public void savePatient(PatientBean patient) {
		
		patientDao.createPatient(patient);
	}
}
