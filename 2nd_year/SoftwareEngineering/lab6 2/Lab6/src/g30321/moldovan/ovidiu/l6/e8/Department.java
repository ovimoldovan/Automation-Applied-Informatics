package g30321.moldovan.ovidiu.l6.e8;

import java.util.ArrayList;

public class Department {
	public String name;
	
	Department(String name){
		this.name = name;
	}
	
	ArrayList<Instructor> i = new ArrayList<Instructor>();
	ArrayList<Course> c = new ArrayList<Course>();
	
	public void addInstructor(Instructor i){
		this.i.add(i);
		
	}
	
	public void removeInstructor(Instructor i){
		this.i.remove(i);
	}
	
	public Instructor getInstructor(String name){
		for(int i = 0; i < this.i.size(); i++){
			if(this.i.get(i).name == name) return this.i.get(i);
		}
		return null;
	}
	
	public void addInstructorWithCourse(Instructor i, Course c){
		i.c = c;
		c.i = i;
		this.i.add(i);
		this.c.add(c);
	}
	
	
}
