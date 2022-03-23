//package com.samsoum.newro.webapp.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.samsoum.newro.dto.StagiaireDTOWithId;
//import com.samsoum.newro.mapper.MapperException;
//import com.samsoum.newro.mapper.StagiaireMapper;
//import com.samsoum.newro.model.Promotion;
//import com.samsoum.newro.model.Stagiaire;
//import com.samsoum.newro.service.PromotionService;
//import com.samsoum.newro.service.StagiaireService;
//import com.samsoum.newro.validator.StagiaireValidateur;
//import com.samsoum.newro.validator.exception.InputException;
//
//@RequestMapping("/editStagiaire")
//@Controller
//public class EditStagiaire {
//	private StagiaireService stagiaireService;
//	private PromotionService promotionService;
//	private StagiaireValidateur validateur;
//	private StagiaireMapper mapper;
//	
//	@Autowired
//	private EditStagiaire(
//			StagiaireService stagiaireService, 
//			PromotionService promotionService, 
//			StagiaireValidateur validateur,
//			StagiaireMapper mapper) {
//		this.stagiaireService = stagiaireService;
//		this.promotionService = promotionService;
//		this.validateur = validateur;
//		this.mapper = mapper;
//	}
//	
//	@GetMapping("")
//	public String get(@RequestParam int id, Model model) {
//		model.addAttribute("id", id);
//		List<Promotion> allPromotions = promotionService.getAll();
//		Stagiaire stagiaireAModifier = stagiaireService.getOne(id).get(); 
//		model.addAttribute("stagiaire", stagiaireAModifier);
//		model.addAttribute("promotions", allPromotions);
//		return "editStagiaire";
//	}
//	
//	@PostMapping("")
//	public ModelAndView post(@ModelAttribute StagiaireDTOWithId nouveauStagiaire) {
//		System.out.println(nouveauStagiaire);
//		try {
//			validateur.check(nouveauStagiaire);
//			Stagiaire stagiaire = mapper.fromDTO(nouveauStagiaire);
//			stagiaireService.update(stagiaire);
//		} catch (InputException e) {
//			e.printStackTrace();
//		} catch (MapperException e) {
//			e.printStackTrace();
//		}
//		return new ModelAndView("redirect:/dashboard");
//	}
//}
