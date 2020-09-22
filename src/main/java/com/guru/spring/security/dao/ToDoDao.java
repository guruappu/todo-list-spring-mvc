package com.guru.spring.security.dao;

import java.util.List;

import com.guru.spring.security.model.Task;

public interface ToDoDao {

    public void saveToDo(Task theTask);
	
	public void updateToDo(Task theTask);

	public List<Task> findByProperty(String propName, Object propValue);

	public Task updateTaskById(Integer id);

	public void deleteTaskById(Integer toDoUserId);
}
