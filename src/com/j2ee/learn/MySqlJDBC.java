package com.j2ee.learn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class MySqlJDBC {
	
	//之所以不行是因为必须要在服务器上才能做测试！！！！
	public void init(){
		try{
			Context ctx=new InitialContext();
			DataSource dsource = (DataSource)ctx.lookup("java:comp/env/jdbc/test");
			if(dsource!=null)
			{
				Connection conn=dsource.getConnection();
				System.out.println("Init here!");
				if(conn!=null)
				{
					Statement stmt=conn.createStatement();
					ResultSet rst=stmt.executeQuery("select * from test");
					if(rst.next())
					{
						System.out.println("user:"+rst.getString("name"));
					}
					conn.close();
				}
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	public static void main(String args[]){
		try{
			MySqlJDBC ms=new MySqlJDBC();
			ms.init();
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Success loading Mysql Driver");
		}
		catch(Exception e){
			System.out.println("Error loading Mysql Driver!");
			e.printStackTrace();
		}
		try{
			Connection connect =DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test","root","password");
			System.out.println("Success!");
			Statement stmt=connect.createStatement();
			ResultSet rs=stmt.executeQuery("select * from user");
			while(rs.next())
			{
				System.out.println("user:"+rs.getString("name"));
			}
			int num=10;
			PreparedStatement Statement=connect.prepareStatement("insert into user values(?,?)");
			
//			for(int i=0;i<num;i++)
//			{
//				Statement.setString(1, "Hello"+i);
//				Statement.setString(2,"test"+i);
//				Statement.executeUpdate();
//				
//			}
		}
		catch(Exception e){
			System.out.println("Error!");
			e.printStackTrace();
		}
		
		
	}
}
