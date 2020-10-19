package g30321.moldovan.ovidiu.l6.e1;

public class Sensor {
	
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
	
	public static void main(String[] args) {
		Sensor s = new Sensor();
		s.setValue(3);
		System.out.println(s.getValue());
		s.displaySensorInfo();
	}

}
