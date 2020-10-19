package g30321.moldovan.ovidiu.l7.e4;

import java.util.TreeSet;

public class TestSort {
	
	public static void main(String[] args) { 
		TreeSet t = new TreeSet(); 
		Person p1 = new Person("jon",4); 
		Person p2 = new Person("alin",10); 
		Person p3 = new Person("dan",8);
		Person p4 = new Person("florin",7); 
		Person p5 = new Person("florin",7); 
		t.add(p1);t.add(p2);t.add(p3);t.add(p4); 
		System.out.println(t); 
		System.out.println("firs:"+t.first()); 
		System.out.println("last:"+t.last());
	System.out.println("subset:"+t.subSet(new Person("x",5),new Person("y",9))); 
	System.out.println("headset:"+t.headSet(p3)); 
	System.out.println("EQUALS: " + p4.equals(p5));
	System.out.println("EQUALS: " + p4.equals(p3));
	}
}
