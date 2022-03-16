package com.samsoum.newro.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.service.ServiceException;
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
		PageStagiaire pageStagiaire = service.get(StagiaireField.FIRST_NAME, StagiaireField.FIRST_NAME, "", 1, 10);
		System.out.println(pageStagiaire.getContenu());
		model.addAttribute("page_stagiaires", pageStagiaire);
		model.addAttribute("rows", 10);
		model.addAttribute("page", 1);
		model.addAttribute("order", StagiaireField.FIRST_NAME);
		try {
			model.addAttribute("numOfPages", pageStagiaire.getNumberOfPages());
			model.addAttribute("nextPage", PageStagiaire.next(pageStagiaire));
			model.addAttribute("page", pageStagiaire.getNumero());
			model.addAttribute("previousPage", PageStagiaire.previous(pageStagiaire));
			model.addAttribute("navigationPages", getNavigationPages(pageStagiaire.getNumero(), pageStagiaire.getNumberOfPages()));
		} catch (PaginationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "dashboard";
	}

	@GetMapping(value = "", params = {"order", "rows", "page"})
	public String get(
			@RequestParam String order, 
			@RequestParam int rows, 
			@RequestParam int page,
			Model model) {
		System.out.println(rows);
		PageStagiaire pageStagiaire = service.get(convertToEnum(order), StagiaireField.FIRST_NAME, "", page, rows);
		model.addAttribute("page_stagiaires", pageStagiaire);
		model.addAttribute("rows", rows);
		model.addAttribute("order", order);
		try {
			model.addAttribute("numOfPages", pageStagiaire.getNumberOfPages());
			model.addAttribute("nextPage", PageStagiaire.next(pageStagiaire));
			model.addAttribute("page", pageStagiaire.getNumero());
			model.addAttribute("previousPage", PageStagiaire.previous(pageStagiaire));
			model.addAttribute("navigationPages", getNavigationPages(pageStagiaire.getNumero(), pageStagiaire.getNumberOfPages()));
		} catch (PaginationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "dashboard";
	}

	private StagiaireField convertToEnum(String order) {
		StagiaireField result;
		switch (order) {
		case "firstName":
			result = StagiaireField.FIRST_NAME;
			break;
		case "lastName":
			result = StagiaireField.LAST_NAME;
			break;
		case "arrival":
			result = StagiaireField.ARRIVAL;
			break;
		case "formationOver":
			result = StagiaireField.ARRIVAL;
			break;
		case "promotion":
			result = StagiaireField.PROMOTION_ID;
			break;
		default:
			result = StagiaireField.FORMATION_OVER;
			break;
		}
		return result;
	}
	private ArrayList<Integer> getNavigationPages(int currentPage, int nbOfPages) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		if (currentPage == nbOfPages) {
			result.add(currentPage - 2);
			result.add(currentPage - 1);
			result.add(currentPage);
		} else if (currentPage == nbOfPages - 1) {
			result.add(currentPage - 1);
			result.add(currentPage);
			result.add(currentPage + 1);
		} else {
			result.add(currentPage);
			result.add(currentPage + 1);
			result.add(currentPage + 2);
		}
		return result;
	}
}
