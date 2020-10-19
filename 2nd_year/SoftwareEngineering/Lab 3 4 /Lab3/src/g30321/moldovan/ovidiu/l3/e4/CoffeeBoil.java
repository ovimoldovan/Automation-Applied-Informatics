package g30321.moldovan.ovidiu.l3.e4;

public class CoffeeBoil {
	CoffeeBoil(){
    	System.out.println("The coffee was boiled.");
    }
int getTemp(){
	int number = 0;
	while(number<60){
		number =  (int)(Math.random()*100);
	}
	 return number;
	}
}
