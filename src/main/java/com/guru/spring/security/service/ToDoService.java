package com.guru.spring.security.service;

import java.util.List;

import com.guru.spring.security.model.Task;

public interface ToDoService {
	
	public void saveToDo(Task theTask);
	
	public void updateToDo(Task theTask);

	public List<Task> getTaskById(Integer userId);

	public Task updateTaskById(Integer id);

	public void deleteTaskById(Integer toDoUserId);

	public List<Task> searchTask(Integer userId, String freeText);

	public List<Task> getTaskHigh(Integer userId);

	public List<Task> getTaskLow(Integer userId);

	public List<Task> getTaskMedium(Integer userId);

}
