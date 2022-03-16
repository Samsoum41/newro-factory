<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="container">
			<h1 id="homeTitle"><span>${nb_stagiaires}</span> Stagiaires found</h1>
			<div id="actions" class="form-horizontal">
				<div class="pull-left">
					<form id="searchForm" action="#" method="GET" class="form-inline">

						<input type="search" id="searchbox" name="search"
							class="form-control" placeholder="Search name" value="${search}"/> 
						<input type="submit" id="searchsubmit" value="Filter by name"
							class="btn btn-primary" />
					</form>
				</div>
				<div class="pull-right">
					<a class="btn btn-success" id="addStagiaire" href="addStagiaire">Ajout
						stagiaire</a> <a class="btn btn-default" id="editStagiaire" href="#"
						onclick="$.fn.toggleEditMode();">Modifier</a>
				</div>
			</div>
		</div>

		<form id="deleteForm" action="dashboard" method="POST">
			<input type="hidden" name="selection" value="">
		</form>

		<div class="container" style="margin-top: 10px;">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->
						<th class="editMode" style="width: 60px; height: 22px;">
							<input type="checkbox" id="selectall" /> 
							<span style="vertical-align: top;"> - 
								<a href="#" id="deleteSelected" onclick="$.fn.deleteSelected();"> 
									<i class="fa fa-trash-o fa-lg"></i>
								</a>
							</span>
						</th>
						<th><a href="dashboard?page=${page}&rows=${rows}&order=firstName">Prénom du stagiaire</a></th>
						<th><a href="dashboard?page=${page}&rows=${rows}&order=lastName">Nom du stagiaire</a></th>
						<th><a href="dashboard?page=${page}&rows=${rows}&order=arrival">Date d'arrivée</a></th>
						<!-- Table header for Discontinued Date -->
						<th><a href="dashboard?page=${page}&rows=${rows}&order=formationOver">Date de fin de formation</a></th>
						<!-- Table header for Company -->
						<th><a href="dashboard?page=${page}&rows=${rows}&order=promotion">Promotion</a></th>

					</tr>
				</thead>
				<!-- Browse attribute computers -->
				<tbody id="results">
					<c:forEach items="${page_stagiaires.contenu}" var="stagiaire">
						<tr>
							<td class="editMode">
								<input type="checkbox" name="cb" class="cb" value="${stagiaire.id}">
							</td>
							<td>
								<a href="editStagiaire?id=${stagiaire.id}" onclick="">
									${stagiaire.first_name }
								</a>
							</td>
							<td>
								<a href="editStagiaire?id=${stagiaire.id}" onclick="">
									${stagiaire.last_name}
								</a>
							</td>
							<td>${stagiaire.arrival }</td>
							<td>${stagiaire.formation_over }</td>
							<td>${stagiaire.promotion.name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<footer class="navbar-fixed-bottom">
		<div class="container text-center flex-center">
			<ul class="pagination">
				<li><a href="dashboard?page=${ previousPage }&rows=${rows}&order=${order}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li> 
				<c:forEach items="${navigationPages}" var="page">
					<li><c:choose>
							<c:when test="${ page==page_stagiaires.numero }">
								<a href="dashboard?page=${page}&rows=${rows}"
									id="highlighted-li">${page}</a>
							</c:when>
							<c:otherwise>
								<a href="dashboard?page=${page}&rows=${rows}">${page}</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
				<li><a href="dashboard?page=${ nextPage }&rows=${rows}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>

			<div class="btn-group btn-group-sm pull-right" role="group">
				<a href="dashboard?page=${page}&rows=10&order=${order}" class="btn btn-default">10</a> <a
					href="dashboard?page=${page}&rows=50&order=${order}" class="btn btn-default">50</a> <a
					href="dashboard?page=${page}&rows=100&order=${order}" class="btn btn-default">100</a>
			</div>
		</div>
	</footer>
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/dashboard.js"/>"></script>

</body>
</html>
