<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid" style="background-color: #f4f4ff;">

	<h2>All Appoinments</h2>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Doctors Username</th>
				<th>Requested Date</th>
				<th>Expected Date</th>
				<th>Welcome Date</th>
				<th>Description</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${appointmentList}" var="appointment">
				<tr>
					<td><c:out value="${appointment.doctors_username}"></c:out></td>
					<td><c:out value="${appointment.requestedDate}"></c:out></td>
					<td><c:out value="${appointment.expectedDate}"></c:out></td>
					<td><c:out value="${appointment.welcomeDate}"></c:out></td>
					<td><c:out value="${appointment.description}"></c:out></td>
					<td><c:out value="${appointment.status}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>