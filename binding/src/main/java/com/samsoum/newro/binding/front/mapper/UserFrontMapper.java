package com.samsoum.newro.binding.front.mapper;

import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.UserDto;
import com.samsoum.newro.model.User;

@Component
public class UserFrontMapper {
	public User toModel(UserDto user) {
		// TODO : Validation
		
		// Mapping 
		return new User(user.getIdentifiant(), user.getPassword());
	}
	
	public UserDto toDto(User user) {
		// TODO : Validation
		
		// Mapping
		return new UserDto(user.getIdentifiant(), user.getPassword());
	}
}
