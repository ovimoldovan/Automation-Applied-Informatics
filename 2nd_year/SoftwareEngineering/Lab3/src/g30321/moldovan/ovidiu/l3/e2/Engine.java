package g30321.moldovan.ovidiu.l3.e2;

import g30321.moldovan.ovidiu.l3.e2.Engine;

public class Engine {

	String fuellType;
	long capacity;
	boolean active;
	boolean broken;
	Engine(int capacity,boolean active){
	            this.capacity = capacity;
	            this.active = active;
	}
	Engine(int capacity,boolean active,String fuellType, boolean broken){
		this(capacity,active);
		this.fuellType = fuellType;
		this.broken = broken;
	} 
	Engine(){
		this(2000,false,"diesel",false); 
	}
	void print(){
		System.out.println("Engine: capacity="+this.capacity+" fuell= "+fuellType+" active="+active + "broken=" + broken);
	}
	
	public static void main(String[] args) {
		Engine tdi = new Engine();
		Engine i16 = new Engine(1600,false,"petrol", true);
		Engine d30 = new Engine(3000,true,"diesel", false); 
		tdi.print();i16.print();d30.print();
	}
}