<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>


<security:authorize access="hasRole('ROLE_ADMIN')">
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/createAdmin">Add a new
		admin</a>
	<br />
	<a href="${pageContext.request.contextPath}/registerCountry">Register
		a new country</a>
	<br />
	<a href="${pageContext.request.contextPath}/registerDistrict">Register
		a new district</a>
	<br />
	<a href="${pageContext.request.contextPath}/registerDegree">Register
		a new degree</a>
	<br />
	<a href="${pageContext.request.contextPath}/registerArea">Register
		a new area</a>
	<br />
	<a href="${pageContext.request.contextPath}/registerInstitute">Register
		a new institute</a>
	<br />
	<a href="${pageContext.request.contextPath}/registerSpecializedSection">Register
		a new specialized section</a>
	<br />
</body>
	</html>
</security:authorize>
