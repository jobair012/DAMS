package controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.DoctorService;

@Controller
@RequestMapping(value="profile")
public class ProfileController {

	@Autowired
	private DoctorService doctorService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView showProfile(Authentication authentication){
		
		if(authentication.getAuthorities().toString().equals("[ROLE_DOCTOR]")){
			return new ModelAndView("redirect:/profile/doctor");
		}
		if(authentication.getAuthorities().toString().equals("[ROLE_ADMIN]")){
			return new ModelAndView("redirect:/admin");
		}
		if(authentication.getAuthorities().toString().equals("[ROLE_PATIENT]")){
			return new ModelAndView("redirect:/patient");
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
	public ModelAndView showPatientsProfile(){
		
		ModelAndView model = new ModelAndView("patientsProfile");		
		
		return model;
	}
	
	@RequestMapping(value="/uploadImage", method=RequestMethod.POST)
	public ModelAndView doUploadImage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		final String uploadPath = "C://Users/Mohammad/git/DAMS/DAMS/WebContent/resources/runtimeContent/images/";
		
		String imageUrl = "", username ="";
		
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
	
	
}
