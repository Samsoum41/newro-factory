package com.samsoum.newro.binding.front.mapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.UserDto;
import com.samsoum.newro.model.Role;
import com.samsoum.newro.model.User;

@Component
public class UserFrontMapper {
	private PasswordEncoder encoder;
	
	@Autowired
	private UserFrontMapper(PasswordEncoder encoder) {
		this.encoder = encoder;
	}
	
	public User toModel(UserDto user) {
		// TODO : Validation
		
		// Mapping and hashing the password
		List<Role> roles = new ArrayList<Role>();
		for (String role : user.getRoles()) {
			roles.add(new Role(role));
		}
		return new User(user.getIdentifiant(), encoder.encode(user.getNonHashedPassword()), roles);
	}
	
	public UserDto toDto(User user) {
		// TODO : Validation
		
		// Mapping
		List<String> roles = new ArrayList<String>();
		for (Role role : user.getRoles()) {
			roles.add(role.getRole());
		}
		return new UserDto(user.getIdentifiant(), user.getHashedPassword(), roles);
	}
}
