package g30321.moldovan.ovidiu.l3.e4;

public class CoffeTest {
public static void main(String[] args) {
                        CoffeMaker maker1 = new CoffeMaker();
                        Coffee[] pachet = new Coffee[10];
                        for (int i = 0; i < pachet.length; i++) {
                                                  pachet[i] = maker1.getCofee();
                                                  }
                        for (int i = 0; i < pachet.length; i++) {
                                                          pachet[i].drinkCofee();
}
}
}
class CoffeMaker{
	CaffeineTank ctank = new CaffeineTank(); 
	WaterTank wtank = new WaterTank(); 
	CoffeeBoil cboil = new CoffeeBoil();
	CoffeMaker(){
		System.out.println("New cofee maker created.");
		}
		Coffee getCofee(){
		            int w = wtank.getIngredient();
		            int c = ctank.getIngredient();
		            int t = cboil.getTemp();
		            return new Coffee(w,c,t);
		}
}
