package g30321.moldovan.ovidiu.l3.e1;

public class Vehicle {
	
	String brand;
	String model;
	int manufactureYear;
	
	Vehicle(){
		this.brand = "Mitubishi";
		this.model = "Lancer";
		this.manufactureYear=2011;
	}
	Vehicle(String brand, String model, int year){
		this.brand = brand;
		this.model = model;
		this.manufactureYear = year;
	}
	
	void setYear(int x){
		this.manufactureYear = x;
	}
	
	void setModel(String brand, String model){
		this.brand = brand;
		this.model = model;
	}
	
	void getDetails(){
		System.out.print(this.brand +" " + this.model+" "  + this.manufactureYear + "\n");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Vehicle myCar = new Vehicle();
		Vehicle myOtherCar = new Vehicle();
		Vehicle myDreamCar = new Vehicle("Tesla", "Model S", 2020);
		
		myCar.setModel("Hyundai", "i30");
		myCar.setYear(2011);
		myCar.getDetails();
		
		myOtherCar.brand = "Skoda";
		myOtherCar.model = "Octavia";
		myOtherCar.manufactureYear = 2012;
		myOtherCar.getDetails();
		
		myDreamCar.getDetails();
	}

}
