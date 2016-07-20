package beans;

import java.util.Date;

public class PatientBean {

	private String username;
	private String name;
	private String email;
	private String gender;
	private String nationalId;
	private String birthCertificateId;
	private Date dateOfBirth;
	private String contactNumber;
	private String fullAddress;
	private String password;
	private boolean enabled;
	private String role;

	public PatientBean() {
	}

	public PatientBean(String username, String name, String email, String gender, String nationalId,
			String birthCertificateId, Date dateOfBirth, String contactNumber, String fullAddress, String password,
			boolean enabled, String role) {
		this.username = username;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.nationalId = nationalId;
		this.birthCertificateId = birthCertificateId;
		this.dateOfBirth = dateOfBirth;
		this.contactNumber = contactNumber;
		this.fullAddress = fullAddress;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationalId() {
		return nationalId;
	}

	public void setNationalId(String nationalId) {
		this.nationalId = nationalId;
	}

	public String getBirthCertificateId() {
		return birthCertificateId;
	}

	public void setBirthCertificateId(String birthCertificateId) {
		this.birthCertificateId = birthCertificateId;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
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
