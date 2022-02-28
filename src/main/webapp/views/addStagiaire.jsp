<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Newro Factory</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" media="screen">
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard"> Newro Factory </a>
        </div>
    </header>

    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-8 col-xs-offset-2 box">
                    <h1>Add Computer</h1>
                    <form action="addStagiaire" method="POST">
                        <fieldset>
                            <div class="form-group">
                                <label for="lastName">Nom</label>
                                <input type="text" class="form-control" name="last_name" id="lastName" placeholder="Nom du stagiaire" value="">
                            </div>
                            <div class="form-group">
                                <label for="firstName">Pr�nom</label>
                                <input type="text" class="form-control" name="first_name" id="firstName" placeholder="Pr�nom du stagiaire" value="">
                            </div>
                            <div class="form-group">
                                <label for="arrival">Date d'arriv�e</label>
                                <input type="date" class="form-control" name="arrival" id="arrival" placeholder="Date d'arriv�e" value="">
                            </div>
                            <div class="form-group">
                                <label for="finFormation">Date de fin de formation</label>
                                <input type="date" class="form-control" name="formation_over" id="finFormation" placeholder="Date de fin de formation" value="">
                            </div>
                            <div class="form-group">
                                <label for="promotionId">Promotion</label>
                                <select class="form-control" name="promotionId" id="promotionId" ><%!  %>
                                	<c:forEach items="${promotions}" var="promotion">
										<option value="${promotion.id}">${promotion.name} </option>     	
                                	</c:forEach>
                                </select>
                            </div>                  
                        </fieldset>
                        <div class="actions pull-right">
                            <input type="submit" value="Add" class="btn btn-primary">
                            <a href="dashboard.html" class="btn btn-default">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>