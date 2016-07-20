<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<div class="container-fluid" style="background-color: #f4f4ff;">
	<%-- 
	<img id="usersImage" src="${pageContext.request.contextPath}/resources/runtimeContent/images/doctorsImages/IMG_7321.JPG" />
 --%>

	<div class="doctorsBanner">
		<div class="doctorsBasicInfo">
			<span id="nameInBanner"><c:out value="${doctor.name}" /></span><br />
			<span><b>Speciality: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.speciality}" /></span><br />
			<span><b>Email: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.email}" /></span><br />
			<span><b>Contact Number: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.contactNumber}" /></span><br />
			<span><b>Registration Number: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.doctorsRegistrationNumber}" /></span><br />
			<span><b>Chamber Address: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.email}" /></span><br />
			<span id="genderInBanner"><c:out value="${doctor.gender}" /></span>
							
		</div>
		<div class="usersImage1">
			<img src="${pageContext.request.contextPath}/resources/runtimeContent/images/${photoUrl}" />
		</div>
		<a style="color: green; font-weight: bold; font-size: 15px;" href="${pageContext.request.contextPath}/getAppointment?username=${doctor.username}">
			Get Appointment
		</a>
	</div>
</div>