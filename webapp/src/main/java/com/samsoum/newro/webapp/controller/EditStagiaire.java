package com.samsoum.newro.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.samsoum.newro.binding.front.dto.StagiaireDTOWithId;
import com.samsoum.newro.binding.front.mapper.StagiaireFrontMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.StagiaireService;

@RequestMapping("/editStagiaire")
@Controller
public class EditStagiaire {
	private StagiaireService stagiaireService;
	private PromotionService promotionService;
	private StagiaireFrontMapper mapper;
	
	@Autowired
	private EditStagiaire(
			StagiaireService stagiaireService, 
			PromotionService promotionService, 
			StagiaireFrontMapper mapper) {
		this.stagiaireService = stagiaireService;
		this.promotionService = promotionService;
		this.mapper = mapper;
	}
	
	@GetMapping("")
	public String get(@RequestParam int id, Model model) {
		model.addAttribute("id", id);
		List<Promotion> allPromotions = promotionService.getAll();
		Stagiaire stagiaireAModifier = stagiaireService.findById(id).get(); 
		model.addAttribute("stagiaire", stagiaireAModifier);
		model.addAttribute("promotions", allPromotions);
		return "editStagiaire";
	}
	
	@PostMapping("")
	public ModelAndView post(@ModelAttribute StagiaireDTOWithId nouveauStagiaire) {
		System.out.println(nouveauStagiaire);
//		validateur.check(nouveauStagiaire);
		Stagiaire stagiaire = mapper.toModel(nouveauStagiaire);
		stagiaireService.update(stagiaire);
		return new ModelAndView("redirect:/dashboard");
	}
}
