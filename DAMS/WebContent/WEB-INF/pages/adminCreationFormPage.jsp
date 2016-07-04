<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Creation Form</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" />
</head>
<body>
	<div class="col-md-6 col-md-offset-3">
		<form:form class="form-horizontal"
			action="${pageContext.request.contextPath}/doCreateAdmin"
			method="POST" commandName="admin">
			<fieldset>

				<!-- Form Name -->
				<legend>Admin Creation Form</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Name</label>
					<div class="col-md-6">
						<form:input id="name" name="name" type="text" path="name"
							class="form-control input-md" />
						<form:errors path="name" cssClass="alert-danger" />
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="username">Username</label>
					<div class="col-md-6">
						<form:input id="username" name="username" type="text"
							path="username" class="form-control input-md" />
						<form:errors path="username" cssClass="alert-danger" />
					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password">Password</label>
					<div class="col-md-6">
						<form:input id="password" name="password" type="password"
							path="password" class="form-control input-md" />
						<form:errors path="password" cssClass="alert-danger" />
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Email</label>
					<div class="col-md-6">
						<form:input id="email" name="email" type="email" path="email"
							class="form-control input-md" />
						<form:errors path="email" cssClass="alert-danger" />
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-4">
						<button id="submit" name="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</fieldset>
		</form:form>
	</div>
</body>
</html>