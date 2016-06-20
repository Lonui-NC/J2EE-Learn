package com.j2ee.learn;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FormParameterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		
		//继续测试
		Enumeration params=req.getParameterNames();
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		out.println("<html>");
		out.println("<head>");
		out.println("<title> FormParameterServlet</title>");
		out.println("</head>");
		out.println("Lists:");
		Cookie test=new Cookie("Test","Hello_Fine_Good");
		test.setComment("This is a test!");
		resp.addCookie(test);
		Cookie[] cookielist=req.getCookies();
		if(cookielist!=null)
		{
			for(int i=0;i<cookielist.length;i++)
			{
				out.println("<p>"+"Cookie Value:"+cookielist[i].getValue()+"</p>");
			}
		}
		else
		{
			out.println("<p>no cookies!</p>");
		}
		out.println("</body>");
		out.println("</html>");
		
	}
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		
		
		doGet(req,resp);
		
		
		
		
		
		
		
		
		
		
//		out.println("<table>");
//		while(params.hasMoreElements())
//		{
//			String nextparam=(String)params.nextElement();
//			String[] paramarray=req.getParameterValues(nextparam);
//			boolean first=true;
//			String value="";
//			for(int i=0;i<paramarray.length;i++)
//			{
//				if(!first)
//				{
//					value=value+",";
//				}
//				else
//				{
//					first=false;
//				}
//				value=value+paramarray[i];
//			}
//			out.println("<tr><td>"+ nextparam +"</td><td><font>"+value+"</font></td></tr>");
//		}
//		out.println("</table>");
//		String submit=req.getParameter("submit");
//		if(submit==null)//第一次
//		{
//			out.println("<p>Has not submit</p>");
//			out.println("<input type='submit' name='submit' value='Submit'>");
//			out.println("</body>");
//			out.println("</html>");
//			out.flush();
//			//resp.sendError(400, "Non States Reached");
//		}
//		else
//		{
//			out.println("<p>Has submit</p>");
//			out.println("</body>");
//			out.println("</html>");
//			out.flush();
////			String test=req.getParameter("Job").toString();
////			out.println("<p>"+test+"</p>");
//		}
		
		
	}
	
	
}
