package com.j2ee.learn;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HelloTag extends SimpleTagSupport {

	//������JSP��ǩ��ֵ�Զ����ǩ�����ʵ��setter������
	//JavaBean �е�setter����������ʾ
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
		//Ҳ���Զ�ȡ��ǩ�������
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
