package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import services.SearchService;

@Controller
@RequestMapping(value = "search")
public class SearchingController {
	
	@Autowired
	private SearchService searchService;

	@RequestMapping(value="/getAllDoctorsName", method=RequestMethod.GET)
	@ResponseBody
	public void getAllDoctorsName(HttpServletRequest request, HttpServletResponse response){
		
		String term = request.getParameter("term");
		
		List<String> doctorsNameList = searchService.getAllDoctorsName(term);
		
		request.setAttribute("allDoctorsName", doctorsNameList);
		
		//return searchService.getAllDoctorsName(term);
	}
}
