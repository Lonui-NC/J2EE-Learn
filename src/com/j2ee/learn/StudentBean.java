package com.j2ee.learn;

import java.io.Serializable;
//ʵ��javabean ����
public class StudentBean implements Serializable {
	private String firstName=null;
	private String lastName=null;
	private int age=0;
	//java bean ����Ҫ���޲ι��췽��
	public StudentBean()
	{
		
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	
	
}



































