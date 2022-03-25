package com.samsoum.newro.model;

import java.util.List;
import java.util.Objects;

public class User {
	private String identifiant;
	private String password;
	private List<Role> roles;

	public User(String identifiant, String password, List<Role> roles) {
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

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
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
		User other = (User) obj;
		return Objects.equals(identifiant, other.identifiant) && Objects.equals(password, other.password)
				&& Objects.equals(roles, other.roles);
	}

	@Override
	public String toString() {
		return "[" + identifiant + " \\t  " + password + " \\t  " + roles + "]";
	}
}
