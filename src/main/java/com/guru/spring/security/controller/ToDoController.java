package com.guru.spring.security.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guru.spring.security.dao.ToDoDao;
import com.guru.spring.security.model.Task;
import com.guru.spring.security.service.LogInService;
import com.guru.spring.security.service.ToDoService;

@Controller
public class ToDoController {
	
	
    @Autowired 
    private ToDoService toDoService;
	 
	
	@Autowired
	private LogInService logInService;
	
	
	
	@RequestMapping("/saveTask")
	public String saveToDo(@ModelAttribute("task") Task theTask,HttpSession theSession,Model theModel) {
		
		//theSession.setAttribute("toDoId", theTask.getToDoUserId());
		
		Integer todoId= (Integer) theSession.getAttribute("toDoId");
		if(todoId==null) {
			Integer userId=(Integer) theSession.getAttribute("userId");
			theTask.setUserId(userId);
			logInService.saveToDo(theTask);
			
			return "redirect:/ViewToDoList";
		}
		else {
			theTask.setToDoUserId(todoId);
			toDoService.updateToDo(theTask);
			return "redirect:/ViewToDoList";
		}
		
	}
	
	@RequestMapping("/ViewToDoList")
	public String viewTask(HttpSession theSesssion, Model theModel) {
		Integer userId=(Integer) theSesssion.getAttribute("userId");
		
		theModel.addAttribute("task", toDoService.getTaskById(userId));
		
		return "todo-success";
	}
	
	@RequestMapping("/updateTask")
	public String updateTaskById(Model theModel,HttpSession theSession, @RequestParam("toDoUserId")Integer toDoUserId) {
		
		theSession.setAttribute("toDoId", toDoUserId);
		Task theTask=toDoService.updateTaskById(toDoUserId);
		theModel.addAttribute("task", theTask);
		return "add-task";
	}
	
	@RequestMapping("/deleteTask")
	public String deleteTaskById(@RequestParam("toDoUserId") Integer toDoUserId) {
		
		toDoService.deleteTaskById(toDoUserId);
		
		return "redirect:/ViewToDoList";
	}
	
	@RequestMapping("/search")
	public String searchTask(Model theModel, HttpSession theSession,@RequestParam("freetext") String freeText) {
		
		Integer userId= (Integer) theSession.getAttribute("userId");
		theModel.addAttribute("task", toDoService.searchTask(userId,freeText));
		
		return "todo-success";
	}
	
	@RequestMapping("/high")
	public String searchHigh(Model theModel, HttpSession theSession) {
		
		Integer userId=(Integer) theSession.getAttribute("userId");
		
		theModel.addAttribute("task", toDoService.getTaskHigh(userId));
		return "todo-success";
	}

	@RequestMapping("/medium")
	public String searchMedium(Model theModel, HttpSession theSession) {
		
		Integer userId=(Integer) theSession.getAttribute("userId");
		
		theModel.addAttribute("task", toDoService.getTaskMedium(userId));
		return "todo-success";
	}
	
	@RequestMapping("/low")
	public String searchLow(Model theModel, HttpSession theSession) {
		
		Integer userId=(Integer) theSession.getAttribute("userId");
		
		theModel.addAttribute("task", toDoService.getTaskLow(userId));
		return "todo-success";
	}

}
