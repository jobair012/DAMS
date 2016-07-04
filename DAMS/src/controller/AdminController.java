package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;



@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/pendingDoctors", method = RequestMethod.GET)
	public ModelAndView showAllPendinDoctors(){
		
		ModelAndView model = new ModelAndView("pendingDoctorsPage");
		
		model.addObject("pendingDoctors", adminService.getAllPendingDoctors());
		
		return model;
	}
}
