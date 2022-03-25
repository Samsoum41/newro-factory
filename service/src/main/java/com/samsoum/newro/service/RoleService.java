package com.samsoum.newro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samsoum.newro.binding.persistence.dto.RoleEntity;
import com.samsoum.newro.binding.persistence.mapper.RolePersistenceMapper;
import com.samsoum.newro.model.Role;
import com.samsoum.newro.persistence.repositories.jpa.RoleRepository;

@Service
public class RoleService {
	private RoleRepository dao;
	private RolePersistenceMapper roleMapper;

	@Autowired
	private RoleService(RoleRepository dao, RolePersistenceMapper roleMapper) {
		this.dao = dao;
		this.roleMapper = roleMapper;
	}
	
	public void save(Role role) {
		RoleEntity entity = roleMapper.toEntity(role);
		dao.save(entity);
	}
}
