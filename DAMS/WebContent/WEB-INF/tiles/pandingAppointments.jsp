<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container-fluid" style="background-color: #f4f4ff;">

	<h2>All Appoinments</h2>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Patients Username</th>
				<th>Requested Date</th>
				<th>Expected Date</th>
				<th>Description</th>
				<th>Welcome Date</th>				
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${appointmentList}" var="appointment">
				<tr>
					<form:form action="${pageContext.request.contextPath}/appointment/approaveAppointment" commandName="aptmnt" method="post">
					<form:hidden path="appointmentId" value="${appointment.appointmentId}"/>
					<td>
						<form:input path="" type="text" disabled="disabled" readonly="true" value="${appointment.patients_username}"/>
					</td>
					<td>
						<form:input  path="" type="text" disabled="disabled" readonly="true" value="${appointment.requestedDate}"/>
					</td>
					<td>
						<form:input path="" type="text" disabled="disabled" readonly="true" value="${appointment.expectedDate}"/>
					</td>				
					<td>
						<form:input path="" type="text" disabled="disabled" readonly="true" value="${appointment.description}"/>
					</td>							
					<td>
						<form:input path="welcomeDate" type="text" id="datepicker" />
					</td>
					<td>
						<form:select path="status">
							<form:option value="${appointment.status}"></form:option>
							<form:option value="ignored"></form:option>
							<form:option value="approved"></form:option>
						</form:select>
					</td>
					<td>
						<button>Submit</button>
					</td>
					</form:form>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>