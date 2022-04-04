package com.samsoum.newro.binding.front.dto;

import java.util.List;
import java.util.Objects;

public class UserDto {
	private String identifiant;
	private String nonHashedPassword;
	private List<String> roles;

	public UserDto(String identifiant, String nonHashedPassword, List<String> roles) {
		super();
		this.identifiant = identifiant;
		this.nonHashedPassword = nonHashedPassword;
		this.roles = roles;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getNonHashedPassword() {
		return nonHashedPassword;
	}

	public void setNonHashedPassword(String nonHashedPassword) {
		this.nonHashedPassword = nonHashedPassword;
	}

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	@Override
	public int hashCode() {
		return Objects.hash(identifiant, nonHashedPassword, roles);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserDto other = (UserDto) obj;
		return Objects.equals(identifiant, other.identifiant) && Objects.equals(nonHashedPassword, other.nonHashedPassword)
				&& Objects.equals(roles, other.roles);
	}

	@Override
	public String toString() {
		return "[" + identifiant + " \\t  " + nonHashedPassword + " \\t  " + roles + "]";
	}
}