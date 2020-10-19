package g30321.moldovan.ovidiu.l7.e4;

class Person implements Comparable{ 
	int age; 
	String name; 
	Person(String n,int a){ 
		age = a; 
		name = n; 
		} 
	public int compareTo(Object o) {
		Person p = (Person)o; 
		if(age>p.age) return 1; 
		if(age==p.age) return 0; 
		return -1; 
		} 
	public String toString(){ 
		return "("+name+":"+age+")"; 
		}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Person) {
			Person p = (Person)obj;
			return name == p.name;
		}
		return false;
	}
	}