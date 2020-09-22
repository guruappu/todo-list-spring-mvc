package com.guru.spring.security.dao;

import java.sql.SQLException;

import com.guru.spring.security.login.Register;
import com.guru.spring.security.model.Task;

public interface LogInDao {
	
	public void saveUser(Register theRegister);

}
