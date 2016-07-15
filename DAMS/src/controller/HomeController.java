package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.DoctorService;
import services.SearchService;

@Controller
public class HomeController {
	
	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView showHome(){
		
		ModelAndView model = new ModelAndView("landingPage");
		
		List<String> genderList = new ArrayList<String>();

		genderList.add("male");
		genderList.add("female");
		
		model.addObject("genderList", genderList);		
		model.addObject("specialityList", doctorService.getAllSpecializedSection());	
		model.addObject("areaList", searchService.getAllArea());
				
		return model;
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView showAdminPage(){
		
		ModelAndView model = new ModelAndView("adminPage");
		
		return model;
	}
}
