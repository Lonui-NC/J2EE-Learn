<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- 定义上传文件的jsp文件-->
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
	File file;
	int maxFileSize=5000*1024;
	int maxMemSize=5000*1024;
	ServletContext context=pageContext.getServletContext();
	//FilePath 为最终的path
	String filePath=context.getInitParameter("file-upload");
	
	//验证上传内容类型
	String contentType=request.getContentType();
	if(contentType.indexOf("multipart/form-data") >=0)
	{
		//一个用于存本地，一个用于上传
		DiskFileItemFactory factory=new DiskFileItemFactory();
		//设置存储文件的最大值
		factory.setSizeThreshold(maxMemSize);
		//本地存储的数据大于maxMemSize
		factory.setRepository(new File("D:\\J2EE Workspace\\Test\\temp"));
		
		//创建一个文件上传处理程序
		ServletFileUpload upload=new ServletFileUpload(factory);
		//设置最大上传的文件大小
		upload.setSizeMax(maxFileSize);
		try
		{
			//解析获取的文件
			List fileItems=upload.parseRequest(request);
			//处理上传文件
			Iterator i=fileItems.iterator();
			out.println("<html>");
	        out.println("<head>");
	        out.println("<title>JSP File upload</title>");  
	        out.println("</head>");
	        out.println("<body>");
	        
	        while(i.hasNext())
	        {
	        	FileItem fi=(FileItem)i.next();
	        	if(!fi.isFormField())
	        	{
	        		//获取上传文件的参数
	        		String fieldName=fi.getFieldName();
	        		String fileName=fi.getName();
	        		boolean isInMemory=fi.isInMemory();
	        		long sizeInBytes=fi.getSize();
	        		//写入文件
	        		System.out.println("error:"+fileName);
	        		System.out.println("error:"+fieldName);
	        		System.out.println("error:"+fileName.lastIndexOf("\\"));
	        		if(fileName.lastIndexOf("\\")>=0)
	        		{
	        			file=new File(filePath,
	        					fileName.substring(fileName.lastIndexOf("\\")));
	        			
	        		}
	        		else
	        		{
	        			System.out.println("here");
	        			file=new File(filePath,
	        					fileName.substring(fileName.lastIndexOf("\\")+1));
	        		}
	        		fi.write(file);
	        		out.println("Uploaded Filename: " + filePath + 
	        	            fileName + "<br>");
	        	}
	        }
	        out.println("</body>");
	        out.println("</html>");
		}catch(Exception ex){
			 System.out.println(ex);
		}
		
	}
	else
	{
		  out.println("<html>");
	      out.println("<head>");
	      out.println("<title>Servlet upload</title>");  
	      out.println("</head>");
	      out.println("<body>");
	      out.println("<p>No file uploaded</p>"); 
	      out.println("</body>");
	      out.println("</html>");
	}
%>




















