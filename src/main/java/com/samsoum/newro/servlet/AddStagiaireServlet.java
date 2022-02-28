package com.samsoum.newro.servlet;

import java.io.IOException;
import java.util.List;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.ui.PaginationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStagiaireServlet
 */
@WebServlet("/addStagiaire")
public class AddStagiaireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStagiaireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Promotion> allPromotions = PromotionService.getInstance().getAll();
			request.setAttribute("promotions", allPromotions);
			request.getRequestDispatcher("/views/addStagiaire.jsp").forward(request, response);
		}
		catch(ServiceException e) {
			request.getRequestDispatcher("/views/500.jsp").forward(request, response);
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
