package com.samsoum.newro.model;

import java.util.List;
import java.util.Objects;

public class User {
	private String username;
	private String password;
	private List<Role> roles;

	public User(String username, String password, List<Role> roles) {
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

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
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
		User other = (User) obj;
		return Objects.equals(username, other.username) && Objects.equals(password, other.password)
				&& Objects.equals(roles, other.roles);
	}

	@Override
	public String toString() {
		return "[" + username + " \\t  " + password + " \\t  " + roles + "]";
	}
}
