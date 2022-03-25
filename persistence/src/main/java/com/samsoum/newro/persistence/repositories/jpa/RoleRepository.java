package com.samsoum.newro.persistence.repositories.jpa;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.binding.persistence.dto.RoleEntity;

@Repository
public interface RoleRepository extends JpaRepository<RoleEntity, Integer> {
	Optional<RoleEntity> findByRole(String role);
}
