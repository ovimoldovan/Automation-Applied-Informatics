package g30321.moldovan.ovidiu.l7.e3;

public class Command implements Comparable {
	String name;
	Command(String n){
		name = n;}
	void execute() {
		System.out.println("Execute command: " + name);
	
	}
	
	public int compareTo(Object o) {
		Command c = (Command)o;
		if(name.equals(c.name)) {return 0;}
		else return -1;
	}
}
