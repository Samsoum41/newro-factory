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

	<section id="main">
		<h1>Login</h1>
		<form:form name='f' action="login" method='POST'>
			<table>
				<tr>
					<td>User:</td>
					<td><form:input path="identifiant" type='text' name='username' value=''/></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><form:input path="password" type='password' name='password' /></td>
				</tr>
				<tr>
					<td><input name="submit" type="submit" value="submit" /></td>
				</tr>
			</table>
		</form:form>
	</section>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</body>
</html>
