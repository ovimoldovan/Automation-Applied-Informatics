package g30321.moldovan.ovidiu.l7.e2;

import java.util.ArrayList;
import java.util.List;

public class RemoveExample {
	static void displayAll(List l){ 
		System.out.println("Display all persons."); 
		for (Object p : l) { 
			System.out.println(p); 
		}
	}
	public static void main(String[] args) { 
		List c = new ArrayList(); 
		Person p1 = new Person("aaa","bbb"); 
		Person p2 = new Person("ccc","ddd"); 
		Person p3 = new Person("xxx","yyy"); 
		Person p4 = new Person("zzz","qqq");
		c.add(p1);
		c.add(p2);
		c.add(p3);
		c.add(p4); 
		displayAll(c); 
		c.remove(p2); 
		displayAll(c); 
		Person p5 = new Person("aaa","bbb"); 
		c.remove(p5); 
		displayAll(c);
		c.remove(0); 
		displayAll(c); 
		}
	}

