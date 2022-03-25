package com.samsoum.newro.util;

import com.samsoum.newro.service.RoleService;

public class Cli {
	private RoleService roleService;
	
	private Cli() {
		this.roleService = Context.getInstance().getBean(RoleService.class);
	}
	public static void main(String[] args) {
		Cli cli = new Cli();
	}
}
