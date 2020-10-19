package g30321.moldovan.ovidiu.e3;

public class Person {
	int age;
	String name;
	String gender;
	String phoneNumber;
	
	Person(int age, String name, String gender){
		this.age = age;
		this.name = name;
		this.gender = gender;
	}
	
	void addPhoneNumber(String phoneNumber){
		this.phoneNumber = phoneNumber;
	}
	
	void displayPerson(){
		System.out.println(name +" "+ age +" "+ gender);
	}
	void displayPersonPhone(){
		System.out.println(phoneNumber);
	}
	
	public static void main(String[] args){
		
		//Creating a person and testing its functionality
		Person p1 = new Person(20, "John Doe", "male");
		p1.displayPerson();
		
		//Creating a student
		Student s1 = new Student(20, "Maria Smith", "female", "UTCN", 1);
		s1.displayPerson();
		s1.passYear();
		s1.displayPerson();
		
		//Creating a professor
		
		Professor p = new Professor(45, "Ion Popescu", "male", "Databases");
		p.addPhoneNumber("0722");
		p.displayPersonPhone();
		p.displayPerson();
		p.displayDiscipline();
		p.changeDiscipline("Web Programming");
		p.displayDiscipline();
	}
	
}

class Student extends Person {

	String faculty;
	int yearOfStudy;

	Student(int age, String name, String gender, String faculty) {
		super(age, name, gender);
		this.faculty = faculty;
	}
	
	Student(int age, String name, String gender, String faculty, int yearOfStudy) {
		super(age, name, gender);
		this.faculty = faculty;
		this.yearOfStudy = yearOfStudy;
	}
	
	void displayPerson(){
		System.out.println(name +" "+ age +" "+ gender +" " + faculty + " year: " + yearOfStudy);
	}
	void passYear(){
		if(this.yearOfStudy != 0){
			yearOfStudy++;
		}
	}
		
}

class Professor extends Person {
	String discipline;
	
	Professor(int age, String name, String gender, String discipline) {
		super(age, name, gender);
		this.discipline = discipline;
	}
	
	void changeDiscipline(String discipline){
		this.discipline = discipline;
	}
	
	void displayDiscipline(){
		System.out.println(discipline);
	}
	
}
