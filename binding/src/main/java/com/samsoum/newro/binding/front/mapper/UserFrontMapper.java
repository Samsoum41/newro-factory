package com.samsoum.newro.binding.front.mapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.UserDto;
import com.samsoum.newro.model.Role;
import com.samsoum.newro.model.User;

@Component
public class UserFrontMapper {
	public User toModel(UserDto user) {
		// TODO : Validation
		
		// Mapping 
		List<Role> roles = new ArrayList<Role>();
		for (String role : user.getRoles()) {
			roles.add(new Role(role));
		}
		return new User(user.getIdentifiant(), user.getPassword(), roles);
	}
	
	public UserDto toDto(User user) {
		// TODO : Validation
		
		// Mapping
		List<String> roles = new ArrayList<String>();
		for (Role role : user.getRoles()) {
			roles.add(role.getRole());
		}
		return new UserDto(user.getIdentifiant(), user.getPassword(), roles);
	}
}
