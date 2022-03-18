package com.samsoum.newro.util;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BasicControlleur {

	@GetMapping("/sample")
	public String show() {
		return "/WEB-INF/views/dashboard.jsp";
	}
}
