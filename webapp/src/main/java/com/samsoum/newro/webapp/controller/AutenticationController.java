package com.samsoum.newro.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.samsoum.newro.binding.front.dto.UserDto;

@Controller
public class AutenticationController {

	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/perform_login")
	public ModelAndView registerUserAccount(@ModelAttribute("user") UserDto userDto, HttpServletRequest request,
			Errors errors) {

		return new ModelAndView("redirect:/");
		// rest of the implementation
	}
}
