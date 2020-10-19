package g30321.moldovan.ovidiu.l6.e1;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Random;

public class Lane {

	String position;
	
	int maximumCapacity = 40;
	
	LinkedList<Car> cars = new LinkedList<Car>();
	
	//Random number of cars
	
	Random rand = new Random();
	int nr = rand.nextInt(100);

	void checkMaxCap(){
		if(nr>maximumCapacity){
			System.out.println("ERROR: MAXIMUM CAPACITY EXCEEDED");
			nr = maximumCapacity;
		}
	}
	
	Lane(String x){
		this.position = x;
		checkMaxCap();
		for(int i=0;i<nr;i++){
			cars.add(new Car());
		}
		
	}
	

	
}
