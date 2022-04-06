package com.samsoum.newro.binding.front.dto;

import java.util.List;
import java.util.Objects;

public class UserDto {
	private String username;
	private String password;
	private List<String> roles;

	public UserDto(String username, String password, List<String> roles) {
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

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
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
		UserDto other = (UserDto) obj;
		return Objects.equals(username, other.username) && Objects.equals(password, other.password)
				&& Objects.equals(roles, other.roles);
	}

	@Override
	public String toString() {
		return "[" + username + " \\t  " + password + " \\t  " + roles + "]";
	}
}