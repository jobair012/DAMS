<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container-fluid" style="background-color: #f4f4ff;">

	<form:form class="form-horizontal pull-left" name = "appointmentForm" action="${pageContext.request.contextPath}/appointment/getAppointment" commandName="appointment" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>Appointment</legend>

			<form:hidden path="doctors_username" value="${doctor.username}"/>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="Date Expect"
					style="color: black;">Date Expect</label>
				<div class="col-md-8">
					<form:input id="datepicker" name="dateExpect" type="text" path="expectedDate"
						class="form-control input-md" />

				</div>
			</div>

			<!-- Textarea -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="description"
					style="color: black;">Problem Description</label>
				<div class="col-md-8">
					<form:textarea class="form-control" id="description" name="description" path="description"></form:textarea>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="appointment"></label>
				<div class="col-md-4">
					<button id="appointment" name="appointment" class="btn btn-primary">Get
						Appointment</button>
				</div>
			</div>

		</fieldset>
	</form:form>




	<div class="col-md-3 pull-right">
		<div class="content text-center" style="border: 2px solid lightgrey;">
			<span style="color: #004080; font-weight: bold; font-style: italic;"><c:out
					value="${doctor.gender}" /></span> <img class="center-block"
				style="height: 250px; width: 200px;"
				src="${pageContext.request.contextPath}/resources/runtimeContent/images/${photoUrl}" />

			<span style="color: #004080; font-size: 18px; font-weight: bold;"><c:out
					value="${doctor.name}" /></span> <br />
			<c:out value="${doctor.speciality}" />
			<br />
			<c:out value="${doctor.email}" />
			<br />
			<c:out value="Contact No.: ${doctor.contactNumber}" />
			<br />
			<c:out value="${doctor.fullAddress}" />
			<br />
		</div>
	</div>

</div>