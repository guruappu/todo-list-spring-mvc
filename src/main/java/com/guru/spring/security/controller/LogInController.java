package com.guru.spring.security.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.guru.spring.security.login.Login;
import com.guru.spring.security.login.RegCommand;
import com.guru.spring.security.login.Register;
import com.guru.spring.security.model.Task;
import com.guru.spring.security.service.LogInService;

@Controller
public class LogInController {
	
	
	  @Autowired
	  private LogInService logInService;
	  
	
	@RequestMapping("/")
	public String showLogin(Model theModel) {
		
		Login theLogin = new Login();
		
		theModel.addAttribute("login", theLogin);
		return "login-page";
	}

	
	@RequestMapping("/userRegister")
	public String registerPage(Model theModel) {
		
		RegCommand theRegCmd = new RegCommand();
		theModel.addAttribute("regCmd", theRegCmd);
		
		return "register-page";
		
	}
	
	@RequestMapping("/saveUser")
	public String saveUser(@ModelAttribute("regCmd") RegCommand theRegCmd,Model theModel) {
		
		Register theRegister = theRegCmd.getTheRegister();
		
		logInService.saveUser(theRegister);
		return "redirect:/";
		
		
	}
	
	@RequestMapping("/logInValidate")
	public String validateUser(HttpSession theSession,
			                         @ModelAttribute("login")Login theLogin, Model theMap) throws SQLException {
		
		
		Register loggedRegister = logInService.isValidUser(theLogin.getUsername(), theLogin.getPassword());
		if(loggedRegister == null) {
			theMap.addAttribute("message", "Invalid Credentials, try again with valid credentials");
			return "redirect:/";
		}
		
		else {
			addUserInSession(loggedRegister, theSession);
			return "welcome-page";
		}
	}
	
	@RequestMapping("/addTask")
	public String addTask(Model theModel) {
		Task theTask = new Task();
		theModel.addAttribute("task", theTask);
		
		return "add-task";
	}
	
	
	private void addUserInSession(Register theRegister,HttpSession theSession) {
		theSession.setAttribute("user", theRegister);
		theSession.setAttribute("userId", theRegister.getId());
		
	}
	
	@RequestMapping("/logOut")
	public String logOut(HttpSession theSession) {
		return "redirect:/";
	}
	
	@RequestMapping("/userInfo")
	public String userInfo() {
		return "user-info";
	}
}
