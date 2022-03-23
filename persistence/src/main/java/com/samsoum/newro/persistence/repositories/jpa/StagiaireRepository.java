package com.samsoum.newro.persistence.repositories.jpa;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.persistence.dto.StagiaireEntity;

@Repository
public interface StagiaireRepository extends JpaRepository<StagiaireEntity, Integer> {
	public Optional<StagiaireEntity> findById(int id);
	public Optional<StagiaireEntity> findByFirstName(String firstName);
	@Query("select u from stagiaire u where u.firstName like %:searchedName or u.lastName like %:searchedName")
	public Optional<StagiaireEntity> findByFirstNameContainingOrLastNameContaining(@Param("searchedName") String searchedName);
	
	@Query("select u from stagiaire u where u.firstName like %:searchedName or u.lastName like %:searchedName")
	public Page<StagiaireEntity> findByFirstNameContainingOrLastNameContaining(@Param("searchedName") String searchedName,Pageable page);
	public long count();
	public void deleteById(int i);
}