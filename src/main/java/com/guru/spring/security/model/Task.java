package com.guru.spring.security.model;

public class Task {
	
	private Integer toDoUserId;
	private Integer userId;
	private String title;
	private String description;
	private String priority;
	
	public Task() {
		
	}

	public Integer getToDoUserId() {
		return toDoUserId;
	}

	public void setToDoUserId(Integer toDoUserId) {
		this.toDoUserId = toDoUserId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	@Override
	public String toString() {
		return "Task [toDoUserId=" + toDoUserId + ", userId=" + userId + ", title=" + title + ", description="
				+ description + ", priority=" + priority + "]";
	}

	
	
}
