package g30321.moldovan.ovidiu.l6.e8;

import java.util.ArrayList;

public class School {
	
	public String name;
	public String address;
	public static long studentID = 0;
	
	ArrayList<Student> students = new ArrayList<Student>();
	ArrayList<Department> departments = new ArrayList<Department>();
	
	public void addStudent(Student s){
		students.add(s);
	}
	
	public void removeStudent(String name){
		for(int i = 0; i < students.size(); i++){
			if(this.students.get(i).name == name) students.remove(i);
		}
	}
	
	public Student getStudent(String name){
		for(int i = 0; i < students.size(); i++){
			if(students.get(i).name == name) return students.get(i);
		}
		return null;
	}
	
	public void addDepartment(Department d){
		departments.add(d);
	}
	
	
	public void removeDepartment(String name){
		for(int i = 0; i < departments.size(); i++){
			if(this.departments.get(i).name == name) departments.remove(i);
		}
	}
	
	public Department getDepartment(String name){
		for(int i = 0; i < departments.size(); i++){
			if(departments.get(i).name == name) return departments.get(i);
		}
		return null;
	}
	
	//show the courses a student has
	public void showStudentCourses(String name){
		if(getStudent(name)!=null){
			Student s = getStudent(name);
			System.out.print(name + " has the following courses: " );
				for(int i = 0; i < s.courses.size(); i++){
					System.out.println(s.courses.get(i).name + " ");
				}
		}
		else System.out.println("Student doesn't exist");
	}
	
	//show all the courses in a department
	
	public void showDepartmentCourses(String name){
		if(getDepartment(name)!=null){
			Department d = getDepartment(name);
			System.out.print(name + " has the following courses: " );
				for(int i = 0; i < d.c.size(); i++){
					System.out.println(d.c.get(i).name + " with " +d.i.get(i).name );
				}
		}
		else System.out.println("Department doesn't exist");
	}
	

	public static void main(String[] args) {
		
		
		
		Student s1 = new Student("Ovidiu Moldovan", "Izlazului Street", studentID++);
		Student s2 = new Student("John Doe", "Nowhere Street", studentID++);
		Student s3 = new Student("Johanna Smith", "Another Street", studentID++);
		
		
		
		Department a1 = new Department("Automation");
		Department a2 = new Department("Computer Science");
		
		Instructor i1 = new Instructor("Anthony DeProgramming", "Adr1", "p1");
		Instructor i2 = new Instructor("Mircea Ivan", "Adr2", "p2");
		
		Course c1 = new Course("Computer Programming", "CP");
		Course c2 = new Course("Special Mathematics", "SM");
		Course c3 = new Course("Differential Calculus", "DC");
		
		a1.addInstructorWithCourse(i1, c1);
		a1.addInstructorWithCourse(i2, c2);
		a1.addInstructorWithCourse(i2, c3);
		a2.addInstructorWithCourse(i2, c3);
		
		s1.addCourse(c1); s1.addCourse(c2);
		
		School s = new School();
		
		s.addStudent(s1); s.addStudent(s2); s.addStudent(s3);
		s.addDepartment(a1); s.addDepartment(a2);
		
		//Show the courses Ovidiu Moldovan has
		
		s.showStudentCourses("Ovidiu Moldovan");
		
		//testing some other methods
		
		s.showDepartmentCourses("Automation");
		s.showDepartmentCourses("Computer Science");
		s.removeDepartment("Computer Science");
		s.showDepartmentCourses("Computer Science");
		
		

	}

}
