package com.samsoum.newro.binding.persistence.mapper;

import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.persistence.dto.RoleEntity;
import com.samsoum.newro.model.Role;

@Component
public class RolePersistenceMapper {
	public Role toModel(RoleEntity role) {
		return new Role(role.getRole());
	}

	public RoleEntity toEntity(Role role) {
		return new RoleEntity(role.getRole());
	}
}
