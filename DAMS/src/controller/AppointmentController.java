package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import beans.AppointmentBean;
import services.AppointmentService;
import services.DoctorService;

@Controller
@RequestMapping(value = "appointment")
public class AppointmentController {

	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private AppointmentService appointmentService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showAppointmentPage(HttpServletRequest request){
		
		ModelAndView model = new ModelAndView("appointment");
			
		String username = request.getParameter("username");
		
		model.addObject("appointment", new AppointmentBean());
		
		model.addObject("photoUrl", doctorService.getPhotoUrl(username));
		
		model.addObject("doctor", doctorService.getDetailsOfParticularDoctor(username));
		
		return model;
	}
	
	@RequestMapping(value = "/getAppointment", method = RequestMethod.POST)
	public ModelAndView getAppointment(@ModelAttribute("appointment") AppointmentBean appointment, HttpServletRequest request){
		
		appointment.setPatients_username(request.getUserPrincipal().getName());	
		appointment.setRequestedDate(new java.util.Date());
	//	appointment.setStatus("PENDING");
		
		appointmentService.saveNewAppointmentRequest(appointment);
		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/approaveAppointment", method = RequestMethod.POST)
	public ModelAndView approaveAppointment(@ModelAttribute("aptmnt") AppointmentBean aptmnt, HttpServletRequest request){
		
//		appointment.setPatients_username(request.getUserPrincipal().getName());	
//		appointment.setRequestedDate(new java.util.Date());
//	//	appointment.setStatus("PENDING");
		
	//	appointmentService.saveNewAppointmentRequest(appointment);
		
		appointmentService.updateAppointments(aptmnt);
		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/doctor/allRequestedAppointment", method = RequestMethod.GET)
	public ModelAndView getRequestedAppointment(HttpServletRequest request){
		
		ModelAndView model = new ModelAndView("pandingAppointments");
		
		model.addObject("aptmnt", new AppointmentBean());
		
		model.addObject("appointmentList", appointmentService.getAllPendingAppointments(request.getUserPrincipal().getName()));
		
		return model;
	
	}
	
}
