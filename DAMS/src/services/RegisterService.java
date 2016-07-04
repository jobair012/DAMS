package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import beans.AdminBean;
import beans.AreaBean;
import beans.CountryBean;
import beans.DegreeBean;
import beans.DistrictBean;
import beans.InstitutionBean;
import beans.SpecializedSectionBean;
import daos.AdminDao;
import daos.AreaDao;
import daos.CountryDao;
import daos.DegreeDao;
import daos.DistrictDao;
import daos.InstitutionDao;
import daos.SpecializedSectionDao;



@Service
public class RegisterService {

	@Autowired
	private AdminDao adminDAO;

	@Autowired
	private DistrictDao districtDAO;

	@Autowired
	private DegreeDao degreeDAO;

	@Autowired
	private CountryDao countryDAO;

	@Autowired
	private AreaDao areaDAO;

	@Autowired
	private InstitutionDao institutionDAO;
	
	@Autowired
	private SpecializedSectionDao specializedSectionDAO;

	public void createAdmin(AdminBean admin) {

		adminDAO.createAdmin(admin);
	}

	public void saveDistrict(DistrictBean district) {

		districtDAO.saveDistrict(district);
	}

	public void saveDegree(DegreeBean degree) {

		degreeDAO.saveDegree(degree);
	}

	public void saveCountry(CountryBean country) {

		countryDAO.saveCountry(country);
	}

	public void saveArea(AreaBean area) {

		areaDAO.saveArea(area);
	}

	public void saveInstitution(InstitutionBean institution) {

		institutionDAO.saveInstitution(institution);
	}

	public List<String> getAllCountry() {
		
		return countryDAO.getAllCountry();
	}

	public void saveSpecializedSection(SpecializedSectionBean specializedSection) {
		
		specializedSectionDAO.saveSpecializedSection(specializedSection);
	}
}
