package com.samsoum.newro.model;

import java.util.Objects;

public class User {
	private String identifiant;
	private String password;

	public User(String identifiant, String password) {
		super();
		this.identifiant = identifiant;
		this.password = password;
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

	@Override
	public int hashCode() {
		return Objects.hash(identifiant, password);
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
		return Objects.equals(identifiant, other.identifiant) && Objects.equals(password, other.password);
	}

}
