package com.samsoum.newro.servlet;

import java.io.IOException;
import java.util.List;

import com.samsoum.newro.dto.StagiaireDTO;
import com.samsoum.newro.mapper.MapperException;
import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.validator.StagiaireValidateur;
import com.samsoum.newro.validator.exception.InputException;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(4);
		try {
			List<Promotion> allPromotions = PromotionService.getInstance().getAll();
			request.setAttribute("promotions", allPromotions);
			request.getRequestDispatcher("/views/addStagiaire.jsp").forward(request, response);
		} catch (ServiceException e) {
			request.getRequestDispatcher("/views/500.jsp").forward(request, response);
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(5);

		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String arrival = request.getParameter("arrival");
		String formation_over = request.getParameter("formation_over");
		String promotionId = request.getParameter("promotionId");
		System.out.println(promotionId);

		StagiaireDTO nouveauStagiaire = new StagiaireDTO(first_name, last_name, arrival, formation_over, promotionId);
		// Validation du DTO
		try {
			StagiaireValidateur.getInstance().check(nouveauStagiaire);
			System.out.println(2);
			Stagiaire stagiaire = StagiaireMapper.getInstance().fromDTO(nouveauStagiaire);
			System.out.println(3);
			StagiaireService.getInstance().add(stagiaire);
			System.out.println(4);
		} catch (InputException e) {
			e.printStackTrace();
		} catch (MapperException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
