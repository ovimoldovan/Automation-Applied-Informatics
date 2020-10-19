package g30321.moldovan.ovidiu.l6.e8;

import java.util.ArrayList;

public class Course {
	public String name;
	public String courseID;
	
	Instructor i;
	
	ArrayList<Student> students = new ArrayList<Student>();
	
	Course(String courseID){
		this.courseID=courseID;
	};
	
	Course(String name, String courseID){
		this.name = name;
		this.courseID = courseID;
	}
	
	void addStudents(Student s){
		this.students.add(s);
	}
	
	void showStudents(){
		System.out.println("Students that attend " + this.name + ": ");
		for(int i = 0; i<students.size(); i++){
			System.out.print( this.students.get(i).name +", ");
		}
	}
}
