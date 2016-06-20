package com.j2ee.learn;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		doPost(req, resp);
	}

	public void init() throws ServletException{
		System.out.println("Init here!");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		System.out.println("收到消息。。。时间是："+new Date());
		System.out.println("Hello World!!!!!!");
		PrintWriter out=resp.getWriter();
		//printwriter 对象实现对应方法，输出，返回信息
		resp.setContentType("text/html");
		out.println("<html>");
		out.println("<head>");
		out.println("<Title> Simple Servlet </Title>");
		out.println("<body>");
		out.println("<center>");
		out.println("<font color=black size='5'>");
		out.println("<strong> I know Servlet </strong>");
		out.println("</font>");
		out.println("</center>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
		out.flush();
	}
	
	public void destroy()
	{
		
	}
	
}
