package com.guru.spring.security.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.guru.spring.security.model.Task;
import com.guru.spring.security.rowmapper.ToDoRowMapper;

@Repository
public class ToDoDaoImpl extends BaseDao implements ToDoDao {

	@Override
	public void saveToDo(Task theTask) {
		String sql="insert into todo_user(userId,title,description,priority)"+
	                "values(:userId,:title,:description,:priority)";
		
		Map m = new HashMap();
		m.put("userId", theTask.getUserId());
		m.put("title", theTask.getTitle());
		m.put("description", theTask.getDescription());
		m.put("priority", theTask.getPriority());
		
		KeyHolder kh = new GeneratedKeyHolder();
		SqlParameterSource ps = new MapSqlParameterSource(m);
		super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
		Integer toDoId = (Integer) kh.getKey().intValue();
		theTask.setToDoUserId(toDoId);
	}

	@Override
	public void updateToDo(Task theTask) {
		
		String sql="update todo_user set title=:title,description=:description,priority=:priority where todoId=:todoId";
		
		Map m = new HashMap();
		m.put("todoId", theTask.getToDoUserId());
		m.put("title", theTask.getTitle());
		m.put("description", theTask.getDescription());
		m.put("priority", theTask.getPriority());
		
		super.getNamedParameterJdbcTemplate().update(sql, m);
		
	}

	@Override
	public List<Task> findByProperty(String propName, Object propValue) {
		String sql="select todoId,userId,title,description,priority from todo_user WHERE " + propName + "=? ";
		return getJdbcTemplate().query(sql, new ToDoRowMapper(),propValue);
	}

	@Override
	public Task updateTaskById(Integer id) {
		String sql="select todoId,userId,title,description,priority from todo_user where todoId=?";
		return getJdbcTemplate().queryForObject(sql, new ToDoRowMapper(), id);
	}

	@Override
	public void deleteTaskById(Integer toDoUserId) {
		String sql="delete from todo_user where todoId=?";
		 getJdbcTemplate().update(sql, toDoUserId);
		
	}


}
