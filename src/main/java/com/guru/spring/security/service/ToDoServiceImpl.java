package com.guru.spring.security.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.guru.spring.security.dao.BaseDao;
import com.guru.spring.security.dao.ToDoDao;
import com.guru.spring.security.model.Task;
import com.guru.spring.security.rowmapper.ToDoRowMapper;

@Service
public class ToDoServiceImpl extends BaseDao implements ToDoService {
	
	@Autowired
	private ToDoDao toDoDao;

	@Override
	public void saveToDo(Task theTask) {
		throw new UnsupportedOperationException("Not supported yet.");
		
	}

	@Override
	public void updateToDo(Task theTask) {
		toDoDao.updateToDo(theTask);
		
	}

	@Override
	public List<Task> getTaskById(Integer userId) {
		return toDoDao.findByProperty("userId",userId);
		
	}

	@Override
	public Task updateTaskById(Integer id) {
		
		return toDoDao.updateTaskById(id);
	}

	@Override
	public void deleteTaskById(Integer toDoUserId) {
	 toDoDao.deleteTaskById(toDoUserId);
		
	}

	@Override
	public List<Task> searchTask(Integer userId, String freeText) {
		String sql="select todoId,userId,title,description,priority from todo_user where userId=? and (title like '%"+freeText+"%' or description like '%"+freeText+"%' or priority like '%"+freeText+"%')";
		return getJdbcTemplate().query(sql, new ToDoRowMapper(),userId);
	}

	@Override
	public List<Task> getTaskHigh(Integer userId) {
		String sql="select todoId,userId,title,description,priority from todo_user where userId=? and priority='a'";
		return getJdbcTemplate().query(sql, new ToDoRowMapper(),userId);
	}

	@Override
	public List<Task> getTaskLow(Integer userId) {
		String sql="select todoId,userId,title,description,priority from todo_user where userId=? and priority='c'";
		return getJdbcTemplate().query(sql, new ToDoRowMapper(),userId);
		
	}

	@Override
	public List<Task> getTaskMedium(Integer userId) {
		String sql="select todoId,userId,title,description,priority from todo_user where userId=? and priority='b'";
		return getJdbcTemplate().query(sql, new ToDoRowMapper(),userId);
		
	}
	
	

}
