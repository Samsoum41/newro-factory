package com.samsoum.newro.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/editStagiaire")
public class EditStagaire {
	@GetMapping("")
	public String get() {
		return "editStagiaire";
	}
}
