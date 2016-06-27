package com.j2ee.learn;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HelloTag extends SimpleTagSupport {

	//可以在JSP标签中值自定义标签类必须实现setter方法，
	//JavaBean 中的setter方法如下所示
	private String message;
	
	
	
	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		StringWriter sw=new StringWriter();
		super.doTag();
		JspWriter out=getJspContext().getOut();
		//也可以读取标签里的内容
		if(message!=null)
		{
			out.println(message);
		}
		else
		{
			getJspBody().invoke(sw);
			getJspContext().getOut().println(sw.toString());
		}
		//out.println("Hello Tag!");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
