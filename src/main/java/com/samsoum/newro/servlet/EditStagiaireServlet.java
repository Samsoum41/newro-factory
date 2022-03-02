package com.samsoum.newro.servlet;

import java.io.IOException;
import java.util.List;

import com.samsoum.newro.dto.StagiaireDTOWithId;
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
 * Servlet implementation class EditStagiaireServlet
 */
@WebServlet("/editStagiaire")
public class EditStagiaireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStagiaireServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stringId = request.getParameter("id");
		int id = Integer.parseInt(stringId);
		request.setAttribute("id", id);
		try {
			List<Promotion> allPromotions = PromotionService.getInstance().getAll();
			request.setAttribute("promotions", allPromotions);
			System.out.println("On passsse");
			request.getRequestDispatcher("/views/editStagiaire.jsp").forward(request, response);
		} catch (ServiceException e) {
			request.getRequestDispatcher("/views/500.jsp").forward(request, response);
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stringId = request.getParameter("id");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String arrival = request.getParameter("arrival");
		String formation_over = request.getParameter("formation_over");
		String promotionId = request.getParameter("promotionId");
		
		int id = Integer.parseInt(stringId);
		StagiaireDTOWithId nouveauStagiaire = new StagiaireDTOWithId(id, first_name, last_name, arrival, formation_over, promotionId);
		// Validation du DTO
		try {
			StagiaireValidateur.getInstance().check(nouveauStagiaire);
			Stagiaire stagiaire = StagiaireMapper.getInstance().fromDTO(nouveauStagiaire);
			StagiaireService.getInstance().update(stagiaire);
		} catch (InputException e) {
			e.printStackTrace();
		} catch (MapperException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
