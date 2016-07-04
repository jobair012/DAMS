<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Specialized Section Registration Form</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" />
</head>
<body>
	<div class="col-md-6 col-md-offset-3">
		<form:form class="form-horizontal"
			action="${pageContext.request.contextPath}/doRegisterSpecializedSection"
			method="POST" commandName="specializedSection">
			<fieldset>

				<!-- Form Name -->
				<legend>Specialized Section Registration Form</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">Specialized
						Section</label>
					<div class="col-md-6">
						<form:input id="speciality" name="speciality" type="text"
							path="speciality" class="form-control input-md" />

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