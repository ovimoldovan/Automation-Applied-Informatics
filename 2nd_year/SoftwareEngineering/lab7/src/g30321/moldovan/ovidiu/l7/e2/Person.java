package g30321.moldovan.ovidiu.l7.e2;

public class Person {
	String firstname; 
	String lastname; 
	Person(String f, String l){ 
		this.firstname = f; 
		this.lastname = l;
	}/*
	
	//By overwriting the equals method we now compare the values, not the memory addresses
	public boolean equals(Object obj) { 
		if(obj instanceof Person){ 
			Person p = (Person)obj; 
			return p.firstname.equalsIgnoreCase(firstname)&&p.lastname.equalsIgnoreCase(lastname); 
			} 
		else 
			return false; 
		}
		*/
	public String toString() { 
		return "Person:"+firstname+":"+lastname; 
		}
}
