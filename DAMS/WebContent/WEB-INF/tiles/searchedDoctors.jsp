<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid" style="background-color: #f4f4ff;">
	<div class="row">
		<c:forEach items="${doctorList}" var="doctor">
			<div class="col-md-3">
				<div class="content" style="border: 1px solid orange;">
					<img src="${pageContext.request.contextPath}/resources/runtimeContent/images/${photoUrl}" />
				
					<c:out value="${doctor.username}" />
					<br />
					<c:out value="${doctor.name}" />
					<br />
					<c:out value="${doctor.email}" />
					<br />
					<c:out value="${doctor.gender}" />
					<br />
					<c:out value="${doctor.title}" />
					<br />
					<c:out value="${doctor.dateOfBirth}" />
					<br />
					<c:out value="${doctor.doctorsRegistrationNumber}" />
					<br />
					<c:out value="${doctor.fullAddress}" />
					<br />
					<c:out value="${doctor.area}" />
					<br />
				</div>
			</div>
		</c:forEach>
	</div>
</div>