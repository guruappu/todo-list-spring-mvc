package com.guru.spring.security.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.guru.spring.security.login.Register;

public class RegisterRowMapper implements RowMapper<Register> {

	@Override
	public Register mapRow(ResultSet rs, int i) throws SQLException {
		
		Register theRegister = new Register();
		theRegister.setId(rs.getInt("id"));
		theRegister.setName(rs.getString("name"));
		theRegister.setUsername(rs.getString("username"));
		theRegister.setEmail(rs.getString("email"));
		
		return theRegister;
	}
	
	

}
