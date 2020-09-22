package com.guru.spring.security.service;

import java.sql.SQLException;

import com.guru.spring.security.login.Register;
import com.guru.spring.security.model.Task;

public interface LogInService {
	
    public void saveUser(Register theRegister);
	
	public Register isValidUser(String username,String password) throws SQLException;
	
	public void saveToDo(Task theTask);
	

}
