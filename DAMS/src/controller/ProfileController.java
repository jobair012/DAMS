package controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.SystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AppointmentService;
import services.DoctorService;

@Controller
@RequestMapping(value="profile")
public class ProfileController {

	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private AppointmentService appointmentService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView showProfile(Authentication authentication){
		
		if(authentication.getAuthorities().toString().equals("[ROLE_DOCTOR]")){
			return new ModelAndView("redirect:/profile/doctor");
		}
		if(authentication.getAuthorities().toString().equals("[ROLE_ADMIN]")){
			return new ModelAndView("redirect:/admin");
		}
		if(authentication.getAuthorities().toString().equals("[ROLE_PATIENT]")){
			return new ModelAndView("redirect:/profile/patient");
		}
		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value="/doctor", method=RequestMethod.GET)
	public ModelAndView showDoctorsProfile(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView model = new ModelAndView("doctorsProfile");
		
		model.addObject("photoUrl", doctorService.getPhotoUrl(request.getUserPrincipal().getName()));
		
		model.addObject("doctor", doctorService.getDetailsOfParticularDoctor(request.getUserPrincipal().getName()));
		
		return model;
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView showAdminsProfile(){
		
		ModelAndView model = new ModelAndView("adminsProfile");		
		
		return model;
	}
	
	@RequestMapping(value="/patient", method=RequestMethod.GET)
	public ModelAndView showPatientsProfile(HttpServletRequest request){
		
		ModelAndView model = new ModelAndView("patientsProfile");	
		
		model.addObject("appointmentList", appointmentService.getAllAppointments(request.getUserPrincipal().getName()));
		
		return model;
	}
	
	@RequestMapping(value="/uploadImage", method=RequestMethod.POST)
	public ModelAndView doUploadImage(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String uploadPath = "";
		String imageUrl = "", username ="";
		if(SystemUtils.IS_OS_WINDOWS) {
//			uploadPath = "C://dams/runtimeContent/images/";
			uploadPath = "C://Users/surovi012/Desktop/MSC_PROJECTS/apache-tomcat-8.5.35";
		}else {
//			uploadPath = "/home/jobair012/Development/Project/Spring/DAMS/DAMS/WebContent/resources/runtimeContent/images/";
			uploadPath = "/home/jobair012/Desktop/MSC_PROJECTS/apache-tomcat-8.5.35";
		}

		uploadPath = uploadPath+"/webapps/ROOT/resources/runtimeContent/images/";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipart)
		{
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(request);
			Iterator itr = items.iterator();
			
			while(itr.hasNext())
			{
				FileItem item = (FileItem)itr.next();
				
				if(item.isFormField())
				{
					String name = item.getFieldName();
					String value = item.getString();
					
					if(name.equals("username"))	{	username = value;	}
					
				}
				
				if(!item.isFormField())
				{
					String name = item.getFieldName();
					String fName = item.getName();
					
					String filePath = uploadPath + fName;
	               	
	              	File storeFile = new File(filePath);
				              
	                item.write(storeFile);
	                
	                imageUrl = fName;
	  			}
			}
			
		}
		
		doctorService.saveOrUpdatePhoto(imageUrl, username);
		
		return new ModelAndView("redirect:/profile/doctor");
	}
	
	
	@RequestMapping(value="/viewDetails", method=RequestMethod.GET)
	public ModelAndView viewDetails(HttpServletRequest request){
		
		ModelAndView model = new ModelAndView("doctorsDetail");	
		
		String username = request.getParameter("username");
		
		model.addObject("photoUrl", doctorService.getPhotoUrl(username));
		
		model.addObject("doctor", doctorService.getDetailsOfParticularDoctor(username));
		
		return model;
	}
	
}
