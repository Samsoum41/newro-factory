package com.samsoum.newro.binding.front.dto;

public class UserDto {
    private String identifiant;
    private String password;
    
    
	public UserDto(String identifiant, String password) {
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
}