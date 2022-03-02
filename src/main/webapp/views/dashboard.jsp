<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

<title>Newro Factory</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/css/font-awesome.css"
	rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/css/main.css"
	rel="stylesheet" media="screen">
</head>


<body>
	<header class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="dashboard"> Newro Factory </a>
		</div>
	</header>

	<section id="main">
		<div class="container">
			<h1 id="homeTitle">4 Stagiaires found</h1>
			<div id="actions" class="form-horizontal">
				<div class="pull-left">
					<form id="searchForm" action="#" method="GET" class="form-inline">

						<input type="search" id="searchbox" name="search"
							class="form-control" placeholder="Search name" /> <input
							type="submit" id="searchsubmit" value="Filter by name"
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

		<form id="deleteForm" action="#" method="POST">
			<input type="hidden" name="selection" value="">
		</form>

		<div class="container" style="margin-top: 10px;">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->

						<th class="editMode" style="width: 60px; height: 22px;"><input
							type="checkbox" id="selectall" /> <span
							style="vertical-align: top;"> - <a href="#"
								id="deleteSelected" onclick="$.fn.deleteSelected();"> <i
									class="fa fa-trash-o fa-lg"></i>
							</a>
						</span></th>
						<th>Stagiaire</th>
						<th>Date d'arrivée</th>
						<!-- Table header for Discontinued Date -->
						<th>Date de fin de formation</th>
						<!-- Table header for Company -->
						<th>Promotion</th>

					</tr>
				</thead>
				<!-- Browse attribute computers -->
				<tbody id="results">
					<c:forEach items="${page_stagiaires.contenu}" var="stagiaire">
						<tr>
							<td class="editMode"><input type="checkbox" name="cb"
								class="cb" value="0"></td>
							<td><a href="editStagiaire?id=${stagiaire.id}" onclick="">${stagiaire.first_name }
									${ stagiaire.last_name }</a></td>
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
				<li>
					<a href="dashboard?page=${ previousPage }&rows=${rows}" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach items="${navigationPages}" var="page">
					<li>
					<c:choose>
						<c:when test="${ page==page_stagiaire.numero }">
							<a href="dashboard?page=${page}&rows=${rows}" id ="highlighted-li">${page}</a>
						</c:when>
						<c:otherwise>
							<a href="dashboard?page=${page}&rows=${rows}">${page}</a>
						</c:otherwise>
					</c:choose>
					</li>
				</c:forEach>
				<li>
					<a href="dashboard?page=${ nextPage }&rows=${rows}" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>

			<div class="btn-group btn-group-sm pull-right" role="group">
				<a href="dashboard?rows=10" class="btn btn-default">10</a> 
				<a href="dashboard?rows=50" class="btn btn-default">50</a> 
				<a href="dashboard?rows=100" class="btn btn-default">100</a> 
			</div>
		</div>
	</footer>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/dashboard.js"></script>

</body>
</html>
