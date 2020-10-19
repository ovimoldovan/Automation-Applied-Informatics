package g30321.moldovan.ovidiu.l6.e2;

public class Controller {
	String name;
	private Sensor tempSensor = new Sensor();
	
	void checkTemperature(){
		System.out.println(this.tempSensor.getValue());
	}
	
	public static void main(String[] args){
		Controller c = new Controller();
		c.tempSensor.setValue(35);
		c.checkTemperature();
	}
	

}

class Sensor{
	int value;
	String location;
	
	int getValue(){
		return this.value;
	}
	
	void setValue(int value){
		this.value = value;
	}
	
	void displaySensorInfo(){
		System.out.println(value +" " + location);
	}
	
}
