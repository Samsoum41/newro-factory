package com.samsoum.newro.util;

import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.binding.front.dto.UserDto;
import com.samsoum.newro.service.RoleService;
import com.samsoum.newro.service.UserService;

public class Cli {
	private UserService userService;
	private RoleService roleService;

	
	private Cli() {
		this.userService = Context.getInstance().getBean(UserService.class);
		this.roleService = Context.getInstance().getBean(RoleService.class);

	}
	public static void main(String[] args) {
		Cli cli = new Cli();
		List<String> roles = new ArrayList<String>();
		roles.add("USER");
		UserDto userDto = new UserDto("hamzouille", "lafrite", roles);
		cli.userService.register(userDto);
		
	}
}
