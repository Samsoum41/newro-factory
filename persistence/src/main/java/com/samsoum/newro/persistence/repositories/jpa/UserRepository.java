package com.samsoum.newro.persistence.repositories.jpa;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.binding.persistence.dto.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {
	Optional<UserEntity> findByUsername(String identifiant);

	long count();

	void deleteById(int i);
}
