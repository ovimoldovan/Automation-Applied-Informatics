package g30321.moldovan.ovidiu.l3.e4;

public class Coffee {
	int water;
	int  caffeine;
	int temp;
	Coffee(int water, int caffeine, int temp){
	this.water = water;this.caffeine= caffeine; this.temp = temp;
	}
	void drinkCofee(){
	System.out.println("Drink cofee [water="+water+":coffee="+ caffeine+":temp=" + temp+"]");
	 }
}

