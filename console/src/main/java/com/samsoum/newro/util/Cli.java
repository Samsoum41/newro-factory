package com.samsoum.newro.util;

import java.util.Arrays;

import com.samsoum.newro.binding.persistence.dto.UserEntity;
import com.samsoum.newro.service.RoleService;

public class Cli {
	private RoleService roleService;
	
	private Cli() {
		this.roleService = Context.getInstance().getBean(RoleService.class);
	}
	public static void main(String[] args) {
		Cli cli = new Cli();
		UserEntity hamzouille = new UserEntity("hamzouille", "123", Arrays.asList("USER"));
		cli.roleService.save(role);
		System.out.println("Role USER créé");
	}
}
