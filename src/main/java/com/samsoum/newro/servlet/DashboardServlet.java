package com.samsoum.newro.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.ui.PageStagiaire;
import com.samsoum.newro.ui.PaginationException;

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
		String rowsParameter = request.getParameter("rows");
		String pageIndexParameter = request.getParameter("page");
		try {
			int nbRows = convertRows(rowsParameter);
			PageStagiaire page = getPageFromParameter(pageIndexParameter, nbRows);
			int nb_stagiaires = StagiaireService.getInstance().getNumberOfStagiaires();
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
		doGet(request, response);
	}
	
	private PageStagiaire getPageFromParameter(String pageIndexParameter, int nbRows) throws ServiceException {
		PageStagiaire page;
		if (pageIndexParameter==null) {
			page = StagiaireService.getInstance().getPaginated(PageStagiaire.STARTING_PAGE, nbRows);
		}
		else {
			int askedPage = Integer.parseInt(pageIndexParameter);
			page = StagiaireService.getInstance().getPaginated(askedPage, nbRows);
		}
		return page;
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
