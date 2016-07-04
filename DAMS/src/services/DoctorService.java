package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import beans.DoctorBean;
import daos.DoctorsDao;
import daos.SpecializedSectionDao;


@Service
public class DoctorService {

	@Autowired
	private SpecializedSectionDao specializedSectionDAO;

	@Autowired
	private DoctorsDao doctorsDAO;

	public List<String> getAllSpecializedSection() {

		return specializedSectionDAO.getAllSpecializedSection();
	}

	public void createDoctor(DoctorBean doctor) {
		doctorsDAO.createDoctor(doctor);

	}

	public boolean isNationalIdExists(String nationalId) {

		return doctorsDAO.isNationalIdExists(nationalId);
	}

	public boolean isContactNumberExists(String contactNumber) {

		return doctorsDAO.isContactNumberExists(contactNumber);

	}

	public boolean isEmailExists(String email) {
		
		return doctorsDAO.isEmailExists(email);
	}

	public boolean isDoctorsRegistrationNumberExists(String doctorsRegistrationNumber) {
		
		return doctorsDAO.isDoctorsRegistrationNumberExists(doctorsRegistrationNumber);
	}
}
