package com.guru.spring.security.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.guru.spring.security.model.Task;

public class ToDoRowMapper implements RowMapper<Task> {

	@Override
	public Task mapRow(ResultSet rs, int i) throws SQLException {
		
		Task theTask = new Task();
		
		theTask.setToDoUserId(rs.getInt("todoId"));
		theTask.setUserId(rs.getInt("userId"));
		theTask.setTitle(rs.getString("title"));
		theTask.setDescription(rs.getString("description"));
		theTask.setPriority(rs.getString("priority"));
	
		return theTask;
	}

}
