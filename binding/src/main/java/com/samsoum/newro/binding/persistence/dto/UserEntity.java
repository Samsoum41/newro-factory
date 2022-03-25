package com.samsoum.newro.binding.persistence.dto;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name="user")
public class UserEntity {
	@Id
	private String identifiant;
	private String password;
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(	name = "user_roles", 
    			joinColumns = @JoinColumn(name = "user_id"), 
    			inverseJoinColumns = @JoinColumn(name = "role_id")
    )	
	List<RoleEntity> roles;

	public UserEntity() {
		
	}
	
	public UserEntity(String identifiant, String password, List<RoleEntity> roles) {
		super();
		this.identifiant = identifiant;
		this.password = password;
		this.roles = roles;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}

	@Override
	public int hashCode() {
		return Objects.hash(identifiant, password, roles);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserEntity other = (UserEntity) obj;
		return Objects.equals(identifiant, other.identifiant) && Objects.equals(password, other.password)
				&& Objects.equals(roles, other.roles);
	}
}
