package com.samsoum.newro.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.samsoum.newro.binding.front.dto.UserDto;

@Controller
public class AutenticationController {

	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("userdto", new UserDto("", "", null));
		return "login";
	}

	
	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("userdto", new UserDto("", "", null));
		return "signup";
	}
	
	@PostMapping("/signup")
	public ModelAndView registerUserAccount(@ModelAttribute("userdto") UserDto userDto, HttpServletRequest request,
			Errors errors) {

		return new ModelAndView("redirect:/");
		// rest of the implementation
	}}
