package com.guru.spring.security.testdb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Driver;

/**
 * Servlet implementation class TestDb
 */
@WebServlet("/TestDb")
public class TestDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestDb() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/office_management?useSSL=false";
		String user="springstudent";
		String pass="springstudent";
		
		PrintWriter pw = response.getWriter();
		
		pw.println("Connecting to database....");
		
		Class.forName(driver);
		
		Connection con = DriverManager.getConnection(url, user, pass);
		
		pw.print("Connection successfull.......");
		
		pw.close();
		
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
