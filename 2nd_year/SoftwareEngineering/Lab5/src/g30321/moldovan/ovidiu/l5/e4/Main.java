package g30321.moldovan.ovidiu.l5.e4;

class BaseClass{
	void firstMethod(){
		System.out.println("The first method was called");
		secondMethod();
	}
	
	void secondMethod(){
		System.out.println("The second method was called");
	}
}

class DerivativeClass extends BaseClass{
	void secondMethod(){
		System.out.println("The second method was overwritten");
	}
	void thirdMethod(){
		System.out.println("this is the third method");
	}
}

public class Main {
	



	public static void main(String[] args) {
		//DerivativeClass d = new DerivativeClass();
		//d.firstMethod();
		BaseClass b = (BaseClass) new DerivativeClass(); //upcast
		b.firstMethod(); 
	
		DerivativeClass d2 = (DerivativeClass) b; //downcast
		d2.firstMethod();
		d2.thirdMethod();
	}
	
	

}
