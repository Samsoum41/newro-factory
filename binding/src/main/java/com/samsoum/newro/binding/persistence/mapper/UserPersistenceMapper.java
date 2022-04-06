package com.samsoum.newro.binding.persistence.mapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.persistence.dto.RoleEntity;
import com.samsoum.newro.binding.persistence.dto.UserEntity;
import com.samsoum.newro.model.Role;
import com.samsoum.newro.model.User;

@Component
public class UserPersistenceMapper {
	private RolePersistenceMapper mapper;
	
	@Autowired
	public UserPersistenceMapper(RolePersistenceMapper mapper) {
		this.mapper = mapper;
	}
	
	public User toModel(UserEntity user) {
		List<Role> roles = new ArrayList<Role>();
		for (RoleEntity role : user.getRoles()) {
			roles.add(mapper.toModel(role));
		}
		return new User(user.getUsername(), user.getPassword(), roles);
	}
	public UserEntity toEntity(User user) {
		List<RoleEntity> roles = new ArrayList<RoleEntity>();
		for (Role role : user.getRoles()) {
			roles.add(mapper.toEntity(role));
		}
		return new UserEntity(user.getUsername(), user.getPassword(), roles);
	}
}
