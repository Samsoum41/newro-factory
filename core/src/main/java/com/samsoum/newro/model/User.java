package com.samsoum.newro.model;

import java.util.List;
import java.util.Objects;

public class User {
	private String identifiant;
	private String hashedPassword;
	private List<Role> roles;

	public User(String identifiant, String hashedPassword, List<Role> roles) {
		super();
		this.identifiant = identifiant;
		this.hashedPassword = hashedPassword;
		this.roles = roles;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getHashedPassword() {
		return hashedPassword;
	}

	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword = hashedPassword;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@Override
	public int hashCode() {
		return Objects.hash(identifiant, hashedPassword, roles);
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
		return Objects.equals(identifiant, other.identifiant) && Objects.equals(hashedPassword, other.hashedPassword)
				&& Objects.equals(roles, other.roles);
	}

	@Override
	public String toString() {
		return "[" + identifiant + " \\t  " + hashedPassword + " \\t  " + roles + "]";
	}
}
