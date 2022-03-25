package com.samsoum.newro.binding.persistence.mapper;

import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.persistence.dto.UserEntity;
import com.samsoum.newro.model.User;

@Component
public class UserPersistenceMapper {
	public User toModel(UserEntity user) {
		return new User(user.getIdentifiant(), user.getPassword());
	}
	public UserEntity toEntity(User user) {
		return new UserEntity(user.getIdentifiant(), user.getPassword());
	}
}
