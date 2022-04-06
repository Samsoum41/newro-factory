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
	private String username;
	private String password;
	
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(	name = "user_roles", 
    			joinColumns = @JoinColumn(name = "user_id"), 
    			inverseJoinColumns = @JoinColumn(name = "role_id")
    )	
	List<RoleEntity> roles;

	public UserEntity() {
		
	}
	
	public UserEntity(String username, String password, List<RoleEntity> roles) {
		super();
		this.username = username;
		this.password = password;
		this.roles = roles;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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
		return Objects.hash(username, password, roles);
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
		return Objects.equals(username, other.username) && Objects.equals(password, other.password)
				&& Objects.equals(roles, other.roles);
	}
}
