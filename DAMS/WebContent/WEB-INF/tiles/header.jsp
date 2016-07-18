<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- start header -->
<header>
	<div class="navbar navbar-default navbar-static-top">
		<div id="sinupOrLoginOrLogout">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form action="${pageContext.request.contextPath}/logout" method="post" id="logoutForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form> 
				<c:out value="${pageContext.request.userPrincipal.name}"/>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:formSubmit()">Logout</a>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<a href="${pageContext.request.contextPath}/registerDoctor">Signup</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/login">Login</a>
			</c:if>		
		</div>
	
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/img/logo.gif" alt="DAMS" height="70px" width="100px" /></a>
			</div>
			<div class="navbar-collapse collapse ">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/search/allDoctors">All Doctors</a></li>
					<li><a href="services.html">About Us</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>
<!-- end header -->
