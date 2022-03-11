package com.samsoum.newro.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.ui.PageStagiaire;
import com.samsoum.newro.ui.PaginationException;
import com.samsoum.newro.util.Context;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StagiaireService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
		
		service = Context.getInstance().getBean(StagiaireService.class);
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Order by a field if requested

		HttpSession session = request.getSession(true);
		String search = getSearchAttribute(request);
		String orderField = getOrderFieldAttribute(request);
		String newOrder = request.getParameter("order");
		if (newOrder == null && session.getAttribute("order") != null) {
			orderField = session.getAttribute("order").toString();
		}
		else if (newOrder !=null){
			// Ici on enregistre le nouveau critère d'ordre dans la session
			session.setAttribute("order", newOrder);
			orderField = newOrder;
		}
		// Getting and setting rows per page and index of page
		String rowsParameter = request.getParameter("rows");
		String pageIndexParameter = request.getParameter("page");
		try {
			int nbRows = convertRows(rowsParameter);
			PageStagiaire page = getPageFromParameter(pageIndexParameter, nbRows, orderField, search);
			int nb_stagiaires = service.getNumberOfStagiaires();
			int numOfPages = page.getNumberOfPages();
			request.setAttribute("nb_stagiaires", nb_stagiaires);
			request.setAttribute("page_stagiaires", page);
			request.setAttribute("rows", nbRows);
			request.setAttribute("numOfPages", numOfPages);
			request.setAttribute("nextPage", PageStagiaire.next(page));
			request.setAttribute("page", page.getNumero());
			request.setAttribute("previousPage", PageStagiaire.previous(page));
			request.setAttribute("navigationPages", getNavigationPages(page.getNumero(), numOfPages));
			request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);

		} catch(ServiceException | PaginationException e) {
			request.getRequestDispatcher("/views/500.jsp").forward(request, response);
			e.printStackTrace();
		}
		System.out.println(1);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] selection = request.getParameter("selection").split(",");
		for(String stringId : selection) {
			int id = Integer.parseInt(stringId);
			try {
				service.delete(id);
			} catch (ServiceException e) {
				e.printStackTrace();
				request.getRequestDispatcher("/views/500.jsp").forward(request, response);
				return;
			}
		}
		doGet(request, response);
	}
	
	private PageStagiaire getPageFromParameter(String pageIndexParameter, int nbRows, String orderField, String search) throws ServiceException {
		// D'abord on fixe le numéro de la page à afficher
		PageStagiaire page;
		int numPage = mapPageIndex(pageIndexParameter);
		// Puis on choisit l'ordre à mettre sur la page
		switch(orderField) {
			case "first_name":
				page = service.getOrderdAndPaginatedAndFiltered(StagiaireField.FIRST_NAME, StagiaireField.FIRST_NAME, search, numPage, nbRows);
				break;
			case "last_name":
				page = service.getOrderdAndPaginatedAndFiltered(StagiaireField.LAST_NAME, StagiaireField.FIRST_NAME, search, numPage, nbRows);
				break;
			case "arrival":
				page = service.getOrderdAndPaginatedAndFiltered(StagiaireField.ARRIVAL, StagiaireField.FIRST_NAME, search, numPage, nbRows);
				break;
			case "formation_over":
				page = service.getOrderdAndPaginatedAndFiltered(StagiaireField.FORMATION_OVER, StagiaireField.FIRST_NAME, search, numPage, nbRows);
				break;
			default:
				page = service.getOrderdAndPaginatedAndFiltered(StagiaireField.FIRST_NAME, StagiaireField.FIRST_NAME, search, numPage, nbRows);
				break;
		}
		return page;
	}
	
	private int mapPageIndex(String pageString) {
		if (pageString==null) {
			return PageStagiaire.STARTING_PAGE;
		}
		else {
			return Integer.parseInt(pageString);
		}	
	}
	
	private int convertRows(String rowsString) {
		if(rowsString != null) {
			int rows =  Integer.parseInt(rowsString);
			if(rows<=100) {
				return rows;
			}
			else {
				return 100;
			}
		}
		else {
			return PageStagiaire.NOMBRES_DE_LIGNES_PAR_DEFAUT;
		}
	}
    private String getSearchAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String search = request.getParameter("search");
		if (search == null && session.getAttribute("search") != null) {
			search = session.getAttribute("search").toString();
			request.setAttribute("search", search);
		}
		else if (search !=null){
			// Ici on enregistre le nouveau critère d'ordre dans la session
			session.setAttribute("search", search);
		}
		else {
			search = "";
		}
		return search;
    }
    
    private String getOrderFieldAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
    	String orderField = "";
		String newOrder = request.getParameter("order");
		if (newOrder == null && session.getAttribute("order") != null) {
			orderField = session.getAttribute("order").toString();
		}
		else if (newOrder !=null){
			// Ici on enregistre le nouveau critère d'ordre dans la session
			session.setAttribute("order", newOrder);
			orderField = newOrder;
		}
		return orderField;
    }

	
	/**
	 * Méthode qui renvoie le triplet de nombres qui représentent les pages disponible dans la navigation pour une page donnée
	 * 
	 * @param currentPage 	: Numéro de la page actuelle
	 * @param nbOfPages		: Nombre total de pages
	 * @return
	 */
	private ArrayList<Integer> getNavigationPages(int currentPage, int nbOfPages){
		ArrayList<Integer> result = new ArrayList<Integer>();
		if(currentPage == nbOfPages) {
			result.add(currentPage - 2);
			result.add(currentPage - 1);
			result.add(currentPage);
		}
		else if (currentPage == nbOfPages - 1) {
			result.add(currentPage - 1);
			result.add(currentPage);
			result.add(currentPage + 1);
		}
		else {
			result.add(currentPage);
			result.add(currentPage + 1);
			result.add(currentPage + 2);		}
		return result;
	}
}
