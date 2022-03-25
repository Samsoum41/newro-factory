package com.samsoum.newro.webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.samsoum.newro.binding.front.dto.UserDto;

@Controller
public class AutenticationController {
	
	@GetMapping("/registration")
	public String showRegistrationForm(WebRequest request, Model model) {
	    UserDto userDto = new UserDto();
	    model.addAttribute("user", userDto);
	    return "registration";
	}
	@PostMapping("/registration")
	public ModelAndView registerUserAccount(
	  @ModelAttribute("user") @Valid UserDto userDto,
	  HttpServletRequest request,
	  Errors errors) {
	    
	    try {
	        User registered = userService.registerNewUserAccount(userDto);
	    } catch (UserAlreadyExistException uaeEx) {
	        return mav;
	    }

	    // rest of the implementation
	}
}
