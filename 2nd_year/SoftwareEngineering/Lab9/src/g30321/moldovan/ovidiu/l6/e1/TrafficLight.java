package g30321.moldovan.ovidiu.l6.e1;

public class TrafficLight extends Thread {
	
	String color;
	

	
	Lane lane;
	
	TrafficLight(Lane lane){
		this.lane = lane;
	}
	
	void setGreen(){
		this.color = "Green";
		showColor();
	}
	
	void setRed() throws InterruptedException{
		/* 
		this.color = "Yellow";
		showColor();
		Thread.sleep(1000);
		*/

		this.color = "Red";
		showColor();
	}
	
	void showColor(){
		System.out.println(lane.position + " is now " + color);
	}
	
	

}
