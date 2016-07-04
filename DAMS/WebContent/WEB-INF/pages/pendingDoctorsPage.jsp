<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pending Doctors</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" />
</head>
<body>
	<h2>List of All Pending Doctors</h2>

	<table class="table table-hover">
		<tr>
			<th>Username</th>
			<th>Registration Number</th>
			<th>National ID</th>
			<th>Contact Number</th>
		</tr>
		<c:forEach var="doctor" items="${pendingDoctors}">
			<tr>
				<td><c:out value="${doctor.username}"></c:out></td>
				<td><c:out value="${doctor.doctorsRegistrationNumber}"></c:out></td>
				<td><c:out value="${doctor.nationalId}"></c:out></td>
				<td><c:out value="${doctor.contactNumber}"></c:out></td>
			</tr>
		</c:forEach>

	</table>


</body>
</html>