package controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import beans.AdminBean;
import beans.DoctorBean;
import services.AdminService;
import services.DoctorService;
import services.UserService;


@Controller
public class AccountController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private DoctorService doctorService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLoginPage() {

		ModelAndView model = new ModelAndView("loginPage");

		return model;
	}

	@RequestMapping(value = "/createAdmin", method = RequestMethod.GET)
	public ModelAndView showAdminCreationForm() {

		ModelAndView model = new ModelAndView("adminCreationFormPage");

		model.addObject("admin", new AdminBean());

		return model;
	}

	@RequestMapping(value = "/doCreateAdmin", method = RequestMethod.POST)
	public ModelAndView createAdmin(@ModelAttribute("admin") @Valid AdminBean admin, BindingResult result) {

		ModelAndView model = new ModelAndView("adminPage");

		if (result.hasErrors()) {

			return new ModelAndView("adminCreationFormPage");
		}

		admin.setEnabled(true);
		admin.setRole("ROLE_ADMIN");
		admin.setStatus("active");

		boolean isUserExists = userService.isUserExists(admin.getUsername());
		boolean isEmailExists = adminService.isEmailExists(admin.getEmail());

		if (isUserExists == false && isEmailExists == false) {
			adminService.createAdmin(admin);
		} else {

			if (isEmailExists == true) {

				result.rejectValue("email", "duplicateEmail", "This email is already used");
			}
			if (isUserExists == true) {

				result.rejectValue("username", "duplicateUsername", "Username already exists");
			}

			return new ModelAndView("adminCreationFormPage");
		}

		return model;
	}

	@RequestMapping(value = "/registerDoctor", method = RequestMethod.GET)
	public ModelAndView showDoctorRegistrationForm() {

		ModelAndView model = new ModelAndView("doctorRegistrationFormPage");

		model.addObject("doctor", new DoctorBean());

		List<String> genderList = new ArrayList<String>();

		genderList.add("male");
		genderList.add("female");

		model.addObject("genderList", genderList);

		model.addObject("specialityList", doctorService.getAllSpecializedSection());

		return model;
	}

	@RequestMapping(value = "/doRegisterDoctor", method = RequestMethod.POST)
	public ModelAndView doRegisterDoctor(@ModelAttribute("doctor") @Valid DoctorBean doctor, BindingResult result) {

		ModelAndView model = new ModelAndView("landingPage");

		if (result.hasErrors()) {

			ModelAndView model1 = new ModelAndView("doctorRegistrationFormPage");

			List<String> genderList = new ArrayList<String>();

			genderList.add("male");
			genderList.add("female");

			model1.addObject("genderList", genderList);

			model1.addObject("specialityList", doctorService.getAllSpecializedSection());

			return model1;
		}

		doctor.setRole("ROLE_DOCTOR");
		doctor.setEnabled(false);

		boolean isContactNumberExists = doctorService.isContactNumberExists(doctor.getContactNumber());
		boolean isNationalIdExists = doctorService.isNationalIdExists(doctor.getNationalId());
		boolean isUserExists = userService.isUserExists(doctor.getUsername());
		boolean isEmailExists = doctorService.isEmailExists(doctor.getEmail());
		boolean isDoctorsRegistrationNumberExists = doctorService
				.isDoctorsRegistrationNumberExists(doctor.getDoctorsRegistrationNumber());

		if (isContactNumberExists == false && isNationalIdExists == false && isUserExists == false
				&& isEmailExists == false && isDoctorsRegistrationNumberExists == false) {

			doctorService.createDoctor(doctor);
		} else {
			ModelAndView model2 = new ModelAndView("doctorRegistrationFormPage");

			List<String> genderList = new ArrayList<String>();

			genderList.add("male");
			genderList.add("female");

			model2.addObject("genderList", genderList);
			model2.addObject("specialityList", doctorService.getAllSpecializedSection());

			if (isUserExists == true) {
				result.rejectValue("username", "duplicateUsername", "Username already exists");
			}

			if (isNationalIdExists == true) {
				result.rejectValue("nationalId", "duplicateNationalId", "This National ID is already used");
			}

			if (isContactNumberExists == true) {
				result.rejectValue("contactNumber", "duplicateContactNumber", "This Contact Number is already used");
			}

			if (isEmailExists == true) {
				result.rejectValue("email", "duplicateEmail", "This email is already used");
			}

			if (isDoctorsRegistrationNumberExists == true) {
				result.rejectValue("doctorsRegistrationNumber", "duplicateDoctorsRegistrationNumber",
						"This Registration Number is already used");
			}

			return model2;
		}

		return model;
	}
}
