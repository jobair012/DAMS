<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid" style="background-color: #f4f4ff;">
	<div class="row">
		<c:forEach items="${doctorList}" var="doctor">
			<div class="col-md-3">
				<div class="content text-center" style="border: 2px solid lightgrey; ">
					<span style="color: #004080; font-weight: bold; font-style: italic;"><c:out value="${doctor.gender}" /></span>
					<img class="center-block" style="height: 250px; width: 200px;" src="${pageContext.request.contextPath}/resources/runtimeContent/images/${doctor.photoUrl}" />
					
					<span style="color: #004080; font-size: 18px; font-weight: bold;"><c:out value="${doctor.name}" /></span>
					<br />
					<c:out value="${doctor.speciality}" />
					<br/>
					<c:out value="${doctor.email}" />
					<br />
					<c:out value="Contact No.: ${doctor.contactNumber}" />
					<br />
					<c:out value="${doctor.fullAddress}" />
					<br />
					<div style="width: 100%; height: 50px; background-color: orange;">
						<a style="color: green; font-weight: bold; font-size: 15px;" href="${pageContext.request.contextPath}/appointment?username=${doctor.username}">
							Get Appointment
						</a>
						<br/>
						<a  href="${pageContext.request.contextPath}/profile/viewDetails?username=${doctor.username}">
							View Details
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>