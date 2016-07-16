package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import beans.DoctorBean;
import services.SearchService;

@Controller
@RequestMapping(value = "search")
public class SearchingController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="/searchDoctor", method=RequestMethod.POST)
	public ModelAndView doSearchDoctor(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView model = new ModelAndView("searchedDoctors");
		
		String doctorsName = request.getParameter("doctorsName");
		String area = request.getParameter("area");
		String specializedSection = request.getParameter("specializedSection");
		String gender = request.getParameter("gender");
		
		model.addObject("doctorList", searchService.getAllDoctors(doctorsName, area, specializedSection, gender));
		
	//	request.setAttribute("doctorList", searchService.getAllDoctors(doctorsName, area, specializedSection, gender));
		
		return model;
		
	}
	
	@RequestMapping(value="/allDoctors", method=RequestMethod.GET)
	public ModelAndView allDoctors(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView model = new ModelAndView("allDoctors");
		
		
		model.addObject("doctorList", searchService.getAllDoctors());
		
		return model;
		
	}
	

	@RequestMapping(value="/getAllDoctorsName", method=RequestMethod.GET, produces="applicaion/json")
	@ResponseBody
	public List<String> getAllDoctorsName(HttpServletRequest request, HttpServletResponse response){
		
		String term = request.getParameter("term");
		
		List<String> doctorsNameList = searchService.getAllDoctorsName(term);
		
	//	request.setAttribute("allDoctorsName", doctorsNameList);
		
		return doctorsNameList;
	}
}
