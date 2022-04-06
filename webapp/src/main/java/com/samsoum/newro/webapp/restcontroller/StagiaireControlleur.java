package com.samsoum.newro.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.samsoum.newro.binding.front.dto.StagiaireDTOWithId;
import com.samsoum.newro.binding.front.mapper.StagiaireFrontMapper;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.StagiaireService;

@RestController
@RequestMapping(path = "/api/stagiaire")
public class StagiaireControlleur {

	private StagiaireService stagiaireService;
	private StagiaireFrontMapper frontMapper;
	
	@Autowired
	private StagiaireControlleur(StagiaireService stagiaireService, StagiaireFrontMapper frontMapper) {
		this.stagiaireService = stagiaireService;
		this.frontMapper = frontMapper;
	}
	
	@GetMapping("/{id}")
	public StagiaireDTOWithId getById(@PathVariable int id) {
		Stagiaire stagiaire = stagiaireService.findById(id).get();
		return frontMapper.toDto(stagiaire);
	}
}
