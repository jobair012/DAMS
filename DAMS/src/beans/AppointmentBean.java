package beans;

import java.util.Date;

public class AppointmentBean {

	private int appointmentId;

	private Date requestedDate;

	private Date expectedDate;

	private String welcomeDate;

	private String status;

	private String doctors_username;

	private String patients_username;

	private String description;

	public AppointmentBean() {
	}

	public AppointmentBean(int appointmentId, Date requestedDate, Date expectedDate, String welcomeDate, String status,
			String doctors_username, String patients_username, String description) {
		this.appointmentId = appointmentId;
		this.requestedDate = requestedDate;
		this.expectedDate = expectedDate;
		this.welcomeDate = welcomeDate;
		this.status = status;
		this.doctors_username = doctors_username;
		this.patients_username = patients_username;
		this.description = description;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	public Date getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(Date expectedDate) {
		this.expectedDate = expectedDate;
	}

	public String getWelcomeDate() {
		return welcomeDate;
	}

	public void setWelcomeDate(String welcomeDate) {
		this.welcomeDate = welcomeDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDoctors_username() {
		return doctors_username;
	}

	public void setDoctors_username(String doctors_username) {
		this.doctors_username = doctors_username;
	}

	public String getPatients_username() {
		return patients_username;
	}

	public void setPatients_username(String patients_username) {
		this.patients_username = patients_username;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
