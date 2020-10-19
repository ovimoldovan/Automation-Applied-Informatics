package g30321.moldovan.ovidiu.l6.e6;

public abstract class Vehicle {
	public abstract void start();
	
	public static void main(String[] args){
		Vehicle[] v = new Vehicle[2];
		v[0] = new Car();
		v[0].start();
		v[1] = new Truck();
		v[1].start();
	}
}
