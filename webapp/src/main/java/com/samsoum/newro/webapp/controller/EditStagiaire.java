package com.samsoum.newro.webapp.controller;

import java.util.ArrayList;
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

import com.samsoum.newro.binding.front.dto.PromotionDTO;
import com.samsoum.newro.binding.front.dto.StagiaireDTO;
import com.samsoum.newro.binding.front.dto.StagiaireDTOWithId;
import com.samsoum.newro.binding.front.mapper.PromotionFrontMapper;
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
	private PromotionFrontMapper promotionMapper;
	
	@Autowired
	private EditStagiaire(
			StagiaireService stagiaireService, 
			PromotionService promotionService, 
			StagiaireFrontMapper mapper,
			PromotionFrontMapper promotionMapper
			) {
		this.stagiaireService = stagiaireService;
		this.promotionService = promotionService;
		this.mapper = mapper;
		this.promotionMapper = promotionMapper;
	}
	
	@GetMapping("")
	public String get(@RequestParam int id, Model model) {
		Stagiaire stagiaire = stagiaireService.findById(id).get();
		StagiaireDTOWithId dto = mapper.toDto(stagiaire);
		model.addAttribute("stagiairedto", dto);
		model.addAttribute("id", id);
		System.out.println("ON EST DANS LE GET DU EDIT");
		List<Promotion> promotions = promotionService.getAll();
		List<PromotionDTO> promotionsDto = new ArrayList<PromotionDTO>();
		for (Promotion promo : promotions) {
			promotionsDto.add(promotionMapper.toDto(promo));
		}
		model.addAttribute("stagiaire", dto);
		System.out.println(promotionsDto);
		model.addAttribute("promotions", promotionsDto);
		return "editStagiaire";
	}
	
	@PostMapping("") 
	public ModelAndView post(@ModelAttribute("stagiairedto") StagiaireDTOWithId stagiairedto) {
		System.out.println("ON EST DANS LE POST DU EDIT");
		System.out.println(stagiairedto);
//		validateur.check(nouveauStagiaire);
		Stagiaire stagiaire = mapper.toModel(stagiairedto);
		stagiaireService.update(stagiaire);
		return new ModelAndView("redirect:/dashboard");
	}
}
