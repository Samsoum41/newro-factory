package com.samsoum.newro.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.ui.PageStagiaire;
import com.samsoum.newro.ui.PaginationException;

@RequestMapping("/dashboard")
@Controller
public class Dashboard {
	private StagiaireService service;

	private Dashboard(StagiaireService service) {
		this.service = service;
	}

	@GetMapping("")
	public String getDefault(Model model) {
		int page = 1;
		Page<Stagiaire> pageStagiaire = service.get(StagiaireField.FIRST_NAME, "", page - 1, 10);
		model.addAttribute("rows", 10);
		model.addAttribute("page", 1);
		model.addAttribute("order", StagiaireField.FIRST_NAME.getValue());
		List<Integer> navigationPages = getNavigationPages(page, pageStagiaire.getTotalPages());
		model.addAttribute("page_stagiaires", pageStagiaire);
		model.addAttribute("nb_stagiaires", pageStagiaire.getTotalElements());
		model.addAttribute("numOfPages", pageStagiaire.getTotalPages());
		model.addAttribute("nextPage", Math.min(page + 1, pageStagiaire.getTotalPages()));
		model.addAttribute("page", page);
		model.addAttribute("previousPage", Math.max(page - 1, 1));
		model.addAttribute("navigationPages", navigationPages);
		return "dashboard";
	}

	@GetMapping(value = "", params = {"order", "rows", "page", "search"}) 
	public String get(
			@RequestParam String order, 
			@RequestParam int rows, 
			@RequestParam int page,
			@RequestParam String search,
			Model model) {
		Page<Stagiaire> pageStagiaire = service.get(StagiaireField.valueFromSnakeCase(order), search, page - 1, 10);

		PageStagiaire pageStagiaire = service.get(StagiaireField.valueFromSnakeCase(order), StagiaireField.FIRST_NAME, "", page, rows);
		model.addAttribute("page_stagiaires", pageStagiaire);
		model.addAttribute("rows", rows);
		model.addAttribute("order", order);
		List<Integer> navigationPages = getNavigationPages(page, pageStagiaire.getTotalPages());
		model.addAttribute("page_stagiaires", pageStagiaire);
		model.addAttribute("nb_stagiaires", pageStagiaire.getTotalElements());
		model.addAttribute("numOfPages", pageStagiaire.getTotalPages());
		model.addAttribute("nextPage", Math.min(page + 1, pageStagiaire.getTotalPages()));
		model.addAttribute("page", page);
		model.addAttribute("previousPage", Math.max(page - 1, 1));
		model.addAttribute("navigationPages", navigationPages);
		return "dashboard";
	}

	private List<Integer> getNavigationPages(int page, int nbPages) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		if (page == nbPages) {
			result.add(page - 2);
			result.add(page - 1);
			result.add(page);
		} else if (page == nbPages - 1) {
			result.add(page - 1);
			result.add(page);
			result.add(page + 1);
		} else {
			result.add(page);
			result.add(page + 1);
			result.add(page + 2);
		}
		return result;
	}
}
