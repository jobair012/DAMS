<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doctor Registration Form</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" />
</head>
<body>
	<div class="col-md-6 col-md-offset-3">
		<form:form class="form-horizontal"
			action="${pageContext.request.contextPath}/doRegisterDoctor"
			method="POST" commandName="doctor">
			<fieldset>

				<!-- Form Name -->
				<legend>Doctor Registration Form</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Name</label>
					<div class="col-md-8">
						<form:input id="name" name="name" type="text" path="name"
							class="form-control input-md" />
						<form:errors path="name" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Title</label>
					<div class="col-md-8">
						<form:input id="title" name="title" type="text" path="title"
							class="form-control input-md" />
						<form:errors path="title" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="selectbasic">Speciality</label>
					<div class="col-md-8">
						<form:select id="speciality" name="speciality" path="speciality"
							class="form-control">
							<form:option value="" label="Select" />
							<form:options items="${specialityList}" />
						</form:select>
						<form:errors path="speciality" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Gender</label>
					<div class="col-md-8">
						<form:radiobuttons path="gender" id="gender" name="gender"
							class="radio-inline" items="${genderList}" />
						<form:errors path="gender" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Date of
						Birth</label>
					<div class="col-md-8">
						<form:input id="dateOfBirth" name="dateOfBirtd" type="text"
							path="dateOfBirth" class="form-control input-md" />
						<form:errors path="dateOfBirth" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">National
						ID</label>
					<div class="col-md-8">
						<form:input id="nationalId" name="nationalId" type="text"
							path="nationalId" class="form-control input-md" />
						<form:errors path="nationalId" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">BMDC
						Registration No.</label>
					<div class="col-md-8">
						<form:input id="doctorsRegistrationNumber"
							name="doctorsRegistrationNumber" type="text"
							path="doctorsRegistrationNumber" class="form-control input-md" />
						<form:errors path="doctorsRegistrationNumber"
							cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Contact
						No.</label>
					<div class="col-md-8">
						<form:input id="contactNumber" name="contactNumber" type="text"
							path="contactNumber" class="form-control input-md" />
						<form:errors path="contactNumber" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Email</label>
					<div class="col-md-8">
						<form:input id="email" name="email" type="email" path="email"
							class="form-control input-md" />
						<form:errors path="email" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="username">Username</label>
					<div class="col-md-8">
						<form:input id="username" name="username" type="text"
							path="username" class="form-control input-md" />
						<form:errors path="username" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">Password</label>
					<div class="col-md-8">
						<form:input id="password" name="password" type="password"
							path="password" class="form-control input-md" />
						<form:errors path="password" cssClass="alert-danger"></form:errors>
					</div>
				</div>

				<!-- Confirm Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="confirmPassword">Confirm
						Password</label>
					<div class="col-md-8">
						<form:input id="confirmPassword" name="confirmPassword"
							type="password" path="" class="form-control input-md" />

					</div>
				</div>


				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-6">
						<button id="submit" name="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</fieldset>
		</form:form>
	</div>
</body>
</html>