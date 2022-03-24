package com.samsoum.newro.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.samsoum.newro.binding.front.dto.StagiaireDTOWithoutId;
import com.samsoum.newro.binding.front.mapper.StagiaireFrontMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.StagiaireService;

@RequestMapping("/addStagiaire")
@Controller
public class AddStagiaire {
	private StagiaireService stagiaireService;
	private PromotionService promotionService;
	private StagiaireFrontMapper mapper;
	
	@Autowired
	private AddStagiaire(
			StagiaireService stagiaireService, 
			PromotionService promotionService, 
			StagiaireFrontMapper mapper) {
		this.stagiaireService = stagiaireService;
		this.promotionService = promotionService;
		this.mapper = mapper;
	}
	
	@GetMapping("")
	public String get(Model model) {
		List<Promotion> allPromotions = promotionService.getAll();
		model.addAttribute("promotions", allPromotions);
		return "addStagiaire";
	}
	
	@PostMapping("")
	public ModelAndView post(@ModelAttribute StagiaireDTOWithoutId nouveauStagiaire, Model model) {
		Stagiaire stagiaire = mapper.toModel(nouveauStagiaire);
		stagiaireService.save(stagiaire); 
		return new ModelAndView("redirect:/dashboard");
	}
}
