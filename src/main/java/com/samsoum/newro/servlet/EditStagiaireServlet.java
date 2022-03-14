package com.samsoum.newro.servlet;

import java.io.IOException;
import java.util.List;

import com.samsoum.newro.dto.StagiaireDTOWithId;
import com.samsoum.newro.mapper.MapperException;
import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.util.Context;
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
	private StagiaireService stagiaireService;
	private PromotionService promotionService;
	private StagiaireValidateur validateur;
	private StagiaireMapper mapper;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStagiaireServlet() {
        super();
        // TODO Auto-generated constructor stub
		stagiaireService = Context.getInstance().getBean(StagiaireService.class);
		promotionService = Context.getInstance().getBean(PromotionService.class);
		validateur = Context.getInstance().getBean(StagiaireValidateur.class);
		mapper = Context.getInstance().getBean(StagiaireMapper.class);

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stringId = request.getParameter("id");
		int id = Integer.parseInt(stringId);
		request.setAttribute("id", id);
		List<Promotion> allPromotions = promotionService.getAll();
		Stagiaire stagiaireAModifier = stagiaireService.getOne(id).get(); 
		request.setAttribute("stagiaire", stagiaireAModifier);
		request.setAttribute("promotions", allPromotions);
		request.getRequestDispatcher("/views/editStagiaire.jsp").forward(request, response);
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
			validateur.check(nouveauStagiaire);
			Stagiaire stagiaire = mapper.fromDTO(nouveauStagiaire);
			stagiaireService.update(stagiaire);
		} catch (InputException e) {
			e.printStackTrace();
		} catch (MapperException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
