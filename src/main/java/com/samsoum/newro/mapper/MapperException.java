package com.samsoum.newro.mapper;

import java.sql.SQLException;

public class MapperException extends SQLException {
	public MapperException() {
		
	}
	public MapperException(String message) {
		super(message);
	}
}
