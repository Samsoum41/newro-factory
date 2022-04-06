<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>

<title>Newro Factory</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/css/font-awesome.css"/>"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet"
	media="screen">
</head>


<body>
	<header class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="dashboard"> Newro Factory </a>
		</div>
	</header>

	<section id="main" style="margin-right:auto; margin-left:auto; width:fit-content;">
		<h1>Sign Up</h1>
		<form:form action="signup" method="post" modelAttribute="userdto">
			<p>
				<form:label path="identifiant" for="identifiant">Username</form:label> 
				<form:input path="identifiant" type="text"
					id="identifiant" name="identifiant" /> 
			</p>
			<p>
				<form:label path="password" for="password">Password</form:label> 
				<form:input path="password" type="password"
					id="password" name="password" /> 
			</p>
			<input type="hidden" 
								name="${_csrf.parameterName}"
										value="${_csrf.token}" />
			<button type="submit" class="btn">Log in</button>
		</form:form>
	</section>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</body>
</html>
