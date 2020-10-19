package g30321.moldovan.ovidiu.l6.e8;

import java.util.ArrayList;

public class Student extends Person{
	
	public long studentID;
	
	ArrayList<Course> courses = new ArrayList<Course>();
	
	
	Student(String name, String address, long studentID) {
		super(name, address);
		this.studentID = studentID;
	}
	
	void addCourse(Course c){
		courses.add(c);
	}
	/*
	 * I forgot about this method and added it to the School class too, but it does the same thing
	void showCourses(){
		System.out.println(this.name + " attends to: ");
		for(int i = 0; i< courses.size(); i++){
			System.out.println(" - " + courses.get(i).name);
		}
	}
	*/

}
