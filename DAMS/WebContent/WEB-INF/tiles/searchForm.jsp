<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dams_scripts.js"></script>


<section class="search-form">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="quick-search">

					<form role="form" action="${pageContext.request.contextPath}/search/searchDoctor" method = "POST">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="col-md-3">
							<div class="form-group ui-widget">
								<label for="name">Doctors Name</label> 
								<input id="doctorsName"
									name="doctorsName" placeholder="Enter your doctor's name"
									class="form-control input-md" type="text"/>
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label for="speciality">Specialty</label>
								<select id="speciality" name="specializedSection" class="form-control">
									<option value="">Select Specialty</option>
									 <c:forEach items="${specialityList}" var="specialty">
									 	<option value="${specialty}">${specialty}</option>
									 </c:forEach>
								</select>
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label for="location">Location</label> 
								<select id="area" name = "area" class="form-control">
									<option value="">Select Area</option>
									 <c:forEach items="${areaList}" var="area">
									 	<option value="${area}">${area}</option>
									 </c:forEach>
								</select>
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label for="gender">Gender</label> 
								<select id="gender" name="gender" class="form-control">
									<option value="">Select Gender</option>
									<c:forEach items="${genderList}" var="gender">
									 	<option value="${gender}">${gender}</option>
									 </c:forEach>
								</select>
							</div>
						</div>


						<!-- break -->
						<div class="col-md-3">
							<input name="submit" value="Search"
								class="btn btn-success btn-lg btn-block" type="submit">
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	<div class="searchDoctor" style = "display: none; ">
	<c:forEach items="${doctorList}" var="doctor">
	<c:out value="${doctor.username}"/><br/>
	<c:out value="${doctor.name}"/><br/>
	<c:out value="${doctor.email}"/><br/>
	<c:out value="${doctor.gender}"/><br/>
	<c:out value="${doctor.title}"/><br/>
	<c:out value="${doctor.dateOfBirth}"/><br/>
	<c:out value="${doctor.doctorsRegistrationNumber}"/><br/>
</c:forEach>
	</div>

</section>
