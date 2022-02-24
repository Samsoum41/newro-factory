package com.samsoum.newro.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.StagiaireService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static int STARTING_PAGE = 1;
	public static int currentPage = STARTING_PAGE;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Getting and setting rows per page and index of page
		if (request.getParameter("rows")!=null) {
			int rows = Integer.parseInt(request.getParameter("rows"));
			StagiaireService.getInstance().setRowsPerPage(rows);
		}
		int page = request.getParameter("page")==null ? STARTING_PAGE : Integer.parseInt(request.getParameter("page"));
		currentPage = page;
		try {
			List<Stagiaire> stagiaires = StagiaireService.getInstance().getPaginated(page);
			int totalStagiaires = StagiaireService.getInstance().getNumberOfStagiaires();
			int numOfPages = (totalStagiaires/StagiaireService.getInstance().getRowsPerPage())+1;
					
			request.setAttribute("stagiaires", stagiaires);
			request.setAttribute("numOfPages", numOfPages);
			request.setAttribute("page", currentPage);
			request.setAttribute("nextPage", getNextPage(currentPage, numOfPages));
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("previousPage", getPreviousPage(currentPage));
			request.setAttribute("navigationPages", getNavigationPages(currentPage, numOfPages));
			request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);

		} catch(SQLException e) {
			request.getRequestDispatcher("/views/500.jsp").forward(request, response);
			System.out.println(e.getMessage());
		}
		System.out.println(8);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 *  Méthode qui renvoie l'indice de la page précédente pour une page donnée.
	 * 
	 * @param currentPage	: Numéro de la page actuelle
	 * @return				: Numéro de la page précédente
	 */
	private int getPreviousPage(int currentPage) {
		int previousPage;
		if(currentPage == 1) {
			previousPage = 1;
		}
		else {
			previousPage = currentPage - 1; 
		}
		return previousPage;
	}
	/**
	 *  Méthode qui renvoie l'indice de la page suivante pour une page donnée.
	 * 
	 * @param currentPage	: Numéro de la page actuelle
	 * @param nbOfPages		: Nombre total de pages dans la pagination
	 * @return				: Numéro de la page suivante
	 */
	private int getNextPage(int currentPage, int nbOfPages) {
		int nextPage;
		if(currentPage == nbOfPages) {
			nextPage = currentPage;
		}
		else {
			nextPage = currentPage + 1; 
		}
		return nextPage;
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
