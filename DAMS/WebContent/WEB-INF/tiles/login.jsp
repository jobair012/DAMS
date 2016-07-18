<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid" style="background-color: #f4f4ff;">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/login" method="POST">
				<fieldset>

					<!-- Form Name -->
					<legend>Login</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="username" style="color: black;">Username</label>
						<div class="col-md-6">
							<input id="username" name="username" type="text"
								required="required" class="form-control input-md">

						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="password" style="color: black;">Password</label>
						<div class="col-md-6">
							<input id="password" name="password" type="password"
								required="required" class="form-control input-md">

						</div>
					</div>

					<!-- Error message-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="space"></label>
						<div class="col-md-6">
							<div class="alert-danger">
								<c:if test="${param.error != null}">
									<c:out value="Incorrect Username or Password Provided" />
								</c:if>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="rememberMe"></label>
						<div class="col-md-4">
							<label class="checkbox-inline" for="rememberMe" style="color: black;"> <input
								name="rememberMe" id="rememberMe" type="checkbox">
								Remember Me
							</label>
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-4">
							<button id="submit" name="submit" class="btn btn-primary">Login</button>
						</div>
					</div>



					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</fieldset>
			</form>
		</div>
	</div>
</div>
