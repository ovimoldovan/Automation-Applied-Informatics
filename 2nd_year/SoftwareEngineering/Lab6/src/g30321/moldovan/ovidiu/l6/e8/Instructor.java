package g30321.moldovan.ovidiu.l6.e8;

public class Instructor extends Person{
	
	Course c;
	
	public String instructorID;
	
	/*
	 static int courseKey = 0;
	 public Course c = new Course(Integer.toString(courseKey++));
	void setCourseName(String name){
		this.c.name=name;
	}
	
	*/
	Instructor(String name, String address, String instructorID){
		super(name, address);
		this.instructorID = instructorID;
	}
	
	
	
	

}
