package g30321.moldovan.ovidiu.l5.e5;

public class Person {

	void eats(){
		System.out.println("Eats.");
	}
	
	public static void main(String[] args){
		Employee e = new Employee();
		e.eats();
		e.works();
		Employee e2 = new Employer();
		Employer e3 = (Employer)e2;
		e3.employSomeone();	
		e3.works();
	}
}
