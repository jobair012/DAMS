<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="container-fluid" style="background-color: #f4f4ff;">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<form:form class="form-horizontal"
				action="${pageContext.request.contextPath}/doRegisterDoctor"
				method="POST" commandName="doctor">
				<fieldset>

					<!-- Form Name -->
					<legend>Doctor Registration Form</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">Name</label>
						<div class="col-md-8">
							<form:input id="name" name="name" type="text" path="name"
								class="form-control input-md" />
							<form:errors path="name" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">Title</label>
						<div class="col-md-8">
							<form:input id="title" name="title" type="text" path="title"
								class="form-control input-md" />
							<form:errors path="title" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="selectbasic" style="color: black;">Speciality</label>
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
						<label class="col-md-4 control-label" for="name" style="color: black;">Gender</label>
						<div class="col-md-8" style="color: black;">
							<form:radiobuttons path="gender" id="gender" name="gender"
								class="radio-inline" items="${genderList}" style="text-color: black;"/>
							<form:errors path="gender" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">Date of
							Birth</label>
						<div class="col-md-8">
							<form:input id="datepicker" name="dateOfBirtd" type="text"
								path="dateOfBirth" class="form-control input-md" />
							<form:errors path="dateOfBirth" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">National
							ID</label>
						<div class="col-md-8">
							<form:input id="nationalId" name="nationalId" type="text"
								path="nationalId" class="form-control input-md" />
							<form:errors path="nationalId" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">BMDC
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
						<label class="col-md-4 control-label" for="name" style="color: black;">Contact
							No.</label>
						<div class="col-md-8">
							<form:input id="contactNumber" name="contactNumber" type="text"
								path="contactNumber" class="form-control input-md" />
							<form:errors path="contactNumber" cssClass="alert-danger"></form:errors>
						</div>
					</div>
					
					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="selectbasic" style="color: black;">Area</label>
						<div class="col-md-8">
							<form:select id="area" name="area" path="area"
								class="form-control">
								<form:option value="" label="Select" />
								<form:options items="${areaList}" />
							</form:select>
							<form:errors path="area" cssClass="alert-danger"></form:errors>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">Full Address</label>
						<div class="col-md-8">
							<form:textarea id="fulAddress" name="fullAddress"
								path="fullAddress" class="form-control input-md" />
							<form:errors path="fullAddress" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="name" style="color: black;">Email</label>
						<div class="col-md-8">
							<form:input id="email" name="email" type="email" path="email"
								class="form-control input-md" />
							<form:errors path="email" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="username" style="color: black;">Username</label>
						<div class="col-md-8">
							<form:input id="username" name="username" type="text"
								path="username" class="form-control input-md" />
							<form:errors path="username" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="password" style="color: black;">Password</label>
						<div class="col-md-8">
							<form:input id="password" name="password" type="password"
								path="password" class="form-control input-md" />
							<form:errors path="password" cssClass="alert-danger"></form:errors>
						</div>
					</div>

					<!-- Confirm Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="confirmPassword" style="color: black;">Confirm
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
	</div>
</div>