package g30321.moldovan.ovidiu.e5;

public class Main {
	


	public static void main(String[] args) {
		
		C2 c2 = new C2();
		
	}
}

class C1 {
	C1(){
		System.out.println("C1 constructor is called");
	}
}

class C2 extends C1{
	C2(){
		System.out.println("C2 constructor is called");
	}
}
