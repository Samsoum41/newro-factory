package com.samsoum.newro.servlet;

import java.io.IOException;
import java.sql.SQLException;
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
	public final static int DEFAULT_ROWS_PER_PAGE = 10;
	public final static int STARTING_PAGE = 1;
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
		int rows = request.getParameter("rows")==null ? DEFAULT_ROWS_PER_PAGE : Integer.parseInt(request.getParameter("rows"));
		int page = request.getParameter("page")==null ? STARTING_PAGE : Integer.parseInt(request.getParameter("page"));
		StagiaireService.getInstance().setRowsPerPage(rows);
		currentPage = page;
		// Preparing next and previous pages
		int previousPage, nextPage;
		try {
			List<Stagiaire> stagiaires = StagiaireService.getInstance().getPaginated(page);
			int numOfPages = StagiaireService.getInstance().getNumberOfPages();
			request.setAttribute("stagiaires", stagiaires);
			request.setAttribute("numOfPages", numOfPages);
			request.setAttribute("page", currentPage);
			if(currentPage == 1) {
				previousPage = 1;
				nextPage= 2;
			}
			// For the last page :
			else if (currentPage == numOfPages){
				previousPage= currentPage -1;
				nextPage=currentPage;
			}
			else {
				previousPage = currentPage-1;
				nextPage = currentPage + 1;
			}
			request.setAttribute("nextPage", nextPage);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("previousPage", previousPage);
			request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);

		} catch(SQLException e) {
			request.getRequestDispatcher("/views/500.jsp").forward(request, response);
			System.out.println(e.getMessage());
		}
		System.out.println(7);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
