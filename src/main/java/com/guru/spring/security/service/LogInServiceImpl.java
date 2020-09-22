package com.guru.spring.security.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.guru.spring.security.dao.BaseDao;
import com.guru.spring.security.dao.LogInDao;
import com.guru.spring.security.dao.ToDoDao;
import com.guru.spring.security.login.Register;
import com.guru.spring.security.model.Task;
import com.guru.spring.security.rowmapper.RegisterRowMapper;

@Service
public class LogInServiceImpl extends BaseDao implements LogInService {
	
	@Autowired
	private LogInDao logInDao;
	
	@Autowired
	private ToDoDao toDoDao;

	@Override
	public void saveUser(Register theRegister) {
		 logInDao.saveUser(theRegister);

	}

	@Override
	public Register isValidUser(String username, String password) throws SQLException {
		
		String sql ="select id,name,username,email from user_new where username=:user and password=:pass";
		Map m = new HashMap();
		m.put("user", username);
		m.put("pass", password);
		
		try {
		Register theRegsiter= getNamedParameterJdbcTemplate().queryForObject(sql, m, new RegisterRowMapper());
		return theRegsiter;
	}
		catch(EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public void saveToDo(Task theTask) {
		toDoDao.saveToDo(theTask);
		
	}

}
