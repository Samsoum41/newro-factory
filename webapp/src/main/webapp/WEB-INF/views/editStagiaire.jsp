<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<title>Newro Factory</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <a class="navbar-brand" href="dashboard.html"> Newro Factory </a>
        </div>
    </header>
    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-8 col-xs-offset-2 box">
                    <div class="label label-default pull-right">
                        id: ${id}
                    </div>
                    <h1>Modification stagiaire</h1>

                    <form:form action="editStagiaire" method="POST" modelAttribute="stagiairedto">
                        <form:input path="id" type="hidden" name="id" value="${id}" id="id"/> 
                        <fieldset>
                            <div class="form-group">
                                <form:label path="lastName" for="lastName">Nom</form:label>
                                <form:input path="lastName" type="text" class="form-control" name="lastName" id="lastName" placeholder="Nom du stagiaire" value="${stagiairedto.lastName}"/>
                            </div>
                            <div class="form-group">
                                <form:label path="firstName" for="firstName">Prénom</form:label>
                                <form:input path="firstName" type="text" class="form-control" name="firstName" id="firstName" placeholder="PrÃ©nom du stagiaire" value="${stagiairedto.firstName}"/>
                            </div>
                            <div class="form-group">
                                <form:label path="arrival" for="arrival">Date d'arrivée</form:label>
                                <form:input path="arrival" type="date" class="form-control" name="arrival" id="arrival" placeholder="Date d'arrivÃ©e" value="${stagiairedto.arrival}"/>
                            </div>
                            <div class="form-group">
                                <form:label path="formationOver" for="finFormation">Date de fin de formation</form:label>
                                <form:input path="formationOver" type="date" class="form-control" name="formationOver" id="formationOver" placeholder="Date de fin de formation" value="${stagiairedto.formationOver}"/>
                            </div>
                            <div class="form-group">
                                <form:label path="promotion" for="promotion">Promotion</form:label>
                                <form:select path="promotion.id promotion.name"  class="form-control" name="promotion" id="promotion">
                                	<form:option path="promotion" selected="selected" value="${stagiairedto.promotion}">
                                		${stagiairedto.promotion.name}
                                	</form:option>
                                	<c:forEach items="${promotions}" var="promotion">
										<option path="promotion.name" value="${promotion.name}">
											${promotion.name}
					                        <form:input path="promotion.id" type="hidden" name="id" value="${promotion.id}" id="id"/> 
										</option>     	
                                	</c:forEach>
                                </form:select>
                            </div>                            
                        </fieldset>
                        <div class="actions pull-right">
                            <input type="submit" value="Edit" class="btn btn-primary">
                            or
                            <a href="dashboard" class="btn btn-default">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>