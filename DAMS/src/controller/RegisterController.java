package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import beans.AreaBean;
import beans.CountryBean;
import beans.DegreeBean;
import beans.DistrictBean;
import beans.InstitutionBean;
import beans.SpecializedSectionBean;
import services.RegisterService;


@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;

	@RequestMapping(value = "/registerCountry", method = RequestMethod.GET)
	public ModelAndView showCountryRegistrationForm() {

		ModelAndView model = new ModelAndView("countryRegistrationFormPage");

		model.addObject("country", new CountryBean());

		return model;
	}

	@RequestMapping(value = "/doRegisterCountry", method = RequestMethod.POST)
	public ModelAndView doRegisterCountry(@ModelAttribute("country") CountryBean country) {

		ModelAndView model = new ModelAndView("adminPage");

		registerService.saveCountry(country);

		return model;
	}

	@RequestMapping(value = "/registerDistrict", method = RequestMethod.GET)
	public ModelAndView showDistrictRegistrationForm() {

		ModelAndView model = new ModelAndView("districtRegistrationFormPage");

		model.addObject("district", new DistrictBean());

		return model;
	}

	@RequestMapping(value = "/doRegisterDistrict", method = RequestMethod.POST)
	public ModelAndView doRegisterDistrict(@ModelAttribute("district") DistrictBean district) {

		ModelAndView model = new ModelAndView("adminPage");

		registerService.saveDistrict(district);

		return model;
	}

	@RequestMapping(value = "/registerDegree", method = RequestMethod.GET)
	public ModelAndView showDegreeRegistrationForm() {

		ModelAndView model = new ModelAndView("degreeRegistrationFormPage");

		model.addObject("degree", new DegreeBean());

		return model;
	}

	@RequestMapping(value = "/doRegisterDegree", method = RequestMethod.POST)
	public ModelAndView doRegisterDegree(@ModelAttribute("degree") DegreeBean degree) {

		ModelAndView model = new ModelAndView("adminPage");

		registerService.saveDegree(degree);

		return model;
	}

	@RequestMapping(value = "/registerArea", method = RequestMethod.GET)
	public ModelAndView showAreaRegistrationForm() {

		ModelAndView model = new ModelAndView("areaRegistrationFormPage");

		model.addObject("area", new AreaBean());

		return model;
	}

	@RequestMapping(value = "/doRegisterArea", method = RequestMethod.POST)
	public ModelAndView doRegisterArea(@ModelAttribute("area") AreaBean area) {

		ModelAndView model = new ModelAndView("adminPage");

		registerService.saveArea(area);

		return model;
	}

	@RequestMapping(value = "/registerInstitute", method = RequestMethod.GET)
	public ModelAndView showInstituteRegistrationForm() {

		ModelAndView model = new ModelAndView("instituteRegistrationFormPage");

		InstitutionBean institute = new InstitutionBean();

		model.addObject("institute", institute);
		
		model.addObject("countryList", registerService.getAllCountry());


		return model;
	}

	@RequestMapping(value = "/doRegisterInstitute", method = RequestMethod.POST)
	public ModelAndView doRegisterInstitute(@ModelAttribute("institute") InstitutionBean institute) {

		ModelAndView model = new ModelAndView("adminPage");

		registerService.saveInstitution(institute);

		return model;
	}
	
	@RequestMapping(value = "/registerSpecializedSection", method = RequestMethod.GET)
	public ModelAndView showSpecializedSectionForm() {

		ModelAndView model = new ModelAndView("specializedSectionFormPage");

		model.addObject("specializedSection", new SpecializedSectionBean());

		return model;
	}

	@RequestMapping(value = "/doRegisterSpecializedSection", method = RequestMethod.POST)
	public ModelAndView doRegisterSpecializedSection(@ModelAttribute("specializedSection") SpecializedSectionBean specializedSection) {

		ModelAndView model = new ModelAndView("adminPage");

		registerService.saveSpecializedSection(specializedSection);

		return model;
	}
}
