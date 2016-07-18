<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<div class="container-fluid" style="background-color: #f4f4ff;">
	<%-- 
	<img id="usersImage" src="${pageContext.request.contextPath}/resources/runtimeContent/images/doctorsImages/IMG_7321.JPG" />
 --%>

	<div class="doctorsBanner">
		<div class="doctorsBasicInfo">
			<span id="nameInBanner"><c:out value="${doctor.name}" /></span><br />
			<span><b>Speciality: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.speciality}" /></span><br />
			<span><b>Email: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.email}" /></span><br />
			<span><b>Contact Number: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.contactNumber}" /></span><br />
			<span><b>Registration Number: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.doctorsRegistrationNumber}" /></span><br />
			<span><b>Chamber Address: &nbsp;&nbsp;&nbsp;</b><c:out value="${doctor.email}" /></span><br />
			<span id="genderInBanner"><c:out value="${doctor.gender}" /></span>
			
			<%-- <table>
				<tr>
					<td>Email:</td>
					<td colspan="2"></td>
					<td><c:out value="${doctor.email}" /></td>
				</tr>
				<tr>
					<td>Reg. No.:</td>
					<td colspan="2"></td>
					<td><c:out value="${doctor.doctorsRegistrationNumber}" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td colspan="2"></td>
					<td><c:out value="${doctor.fullAddress}" /></td>
				</tr>
			</table> --%>
					
					
				
		</div>
		<div class="usersImage">
			<img src="${pageContext.request.contextPath}/resources/runtimeContent/images/${photoUrl}" />
			<form action="uploadImage" enctype="multipart/form-data" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"/>
				<input type="file" name="file"/>
				<br/>
				<input type="submit" value="upload"/>
			</form>
		</div>
	</div>


	<ul>
		<li><a href="${pageContext.request.contextPath}/#">Edit Basic Information</a></li>
		<li><a href="${pageContext.request.contextPath}/#">Add Academic Information</a></li>
		<li><a href="${pageContext.request.contextPath}/#">Upload Image</a></li>
	</ul>
</div>