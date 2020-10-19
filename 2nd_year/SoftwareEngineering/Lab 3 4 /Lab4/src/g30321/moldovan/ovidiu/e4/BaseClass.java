package g30321.moldovan.ovidiu.e4;

public class BaseClass {
	int att1;
	int att2;
	BaseClass(int att1){
		this.att1 = att1;
	}
	
	void display(){
		System.out.println("att1: " + att1 + " att2: " + att2);
	}
	
	

	public static void main(String[] args){
	BaseClass c1 = new BaseClass(2);
	DerivedClass c2 = new DerivedClass(1,2);
	
	c1.display();
	c2.display();
	}
}

class DerivedClass extends BaseClass{

	DerivedClass(int att1) {
		super(att1);
	}
	DerivedClass(int att1, int att2) {
		super(att1);
		this.att2 = att2;
	}
	
	
}
