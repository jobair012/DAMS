package beans;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class DoctorBean {

	@NotBlank
	private String name;

	@NotBlank
	private String title;

	@NotBlank
	private String speciality;

	@NotEmpty
	private String gender;

	@DateTimeFormat(pattern = "yyyy/mm/dd")
	private Date dateOfBirth;

	@NotBlank
	private String nationalId;

	@NotBlank
	private String doctorsRegistrationNumber;

	@NotBlank
	private String contactNumber;

	@NotBlank
	private String fullAddress;

	@NotBlank
	private String area;

	@Email
	@NotBlank
	private String email;

	@NotBlank
	private String username;

	@Size(min = 4, max = 15)
	private String password;

	private boolean enabled;
	private String role;

	public DoctorBean() {
	}

	public DoctorBean(String name, String title, String speciality, String gender, Date dateOfBirth, String nationalId,
			String doctorsRegistrationNumber, String contactNumber, String fullAddress, String area, String email,
			String username, String password, boolean enabled, String role) {
		this.name = name;
		this.title = title;
		this.speciality = speciality;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.nationalId = nationalId;
		this.doctorsRegistrationNumber = doctorsRegistrationNumber;
		this.contactNumber = contactNumber;
		this.fullAddress = fullAddress;
		this.area = area;
		this.email = email;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getNationalId() {
		return nationalId;
	}

	public void setNationalId(String nationalId) {
		this.nationalId = nationalId;
	}

	public String getDoctorsRegistrationNumber() {
		return doctorsRegistrationNumber;
	}

	public void setDoctorsRegistrationNumber(String doctorsRegistrationNumber) {
		this.doctorsRegistrationNumber = doctorsRegistrationNumber;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
