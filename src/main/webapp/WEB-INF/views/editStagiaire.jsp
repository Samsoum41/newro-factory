<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

                    <form action="editStagiaire" method="POST">
                        <input type="hidden" name="id" value="${id}" id="id"/> <!-- TODO: Change this value with the computer id -->
                        <fieldset>
                            <div class="form-group">
                                <label for="lastName">Nom</label>
                                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Nom du stagiaire" value="${stagiaire.last_name}">
                            </div>
                            <div class="form-group">
                                <label for="firstName">Pr�nom</label>
                                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Prénom du stagiaire" value="${stagiaire.first_name}">
                            </div>
                            <div class="form-group">
                                <label for="arrival">Date d'arrivée</label>
                                <input type="date" class="form-control" name="arrival" id="arrival" placeholder="Date d'arrivée" value="${stagiaire.arrival}">
                            </div>
                            <div class="form-group">
                                <label for="finFormation">Date de fin de formation</label>
                                <input type="date" class="form-control" name="formationOver" id="formationver" placeholder="Date de fin de formation" value="${stagiaire.formation_over}">
                            </div>
                            <div class="form-group">
                                <label for="promotionId">Promotion</label>
                                <select class="form-control" name="promotionId" id="promotionId" >
                                	<option selected="selected" value="${stagiaire.promotion.id}">${stagiaire.promotion.name}</option>
                                	<c:forEach items="${promotions}" var="promotion">
										<option value="${promotion.id}">${promotion.name} </option>     	
                                	</c:forEach>
                                </select>
                            </div>                            
                        </fieldset>
                        <div class="actions pull-right">
                            <input type="submit" value="Edit" class="btn btn-primary">
                            or
                            <a href="dashboard.html" class="btn btn-default">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>