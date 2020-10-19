package g30321.moldovan.ovidiu.l6.e10;

public class Main {
	public static void main(String[] args){
		
		//Shop's settings
		
		Item i1 = new Item();
		i1.setName("Arduino board");
		i1.price = 10;
		Item i2 = new Item();
		i2.setName("Distance sensor");
		i2.price = 5;
		
		//Customer's settings
		
		Customer c1 = new Customer();
		c1.setName("Ovidiu Moldovan");
		c1.setPassword("parola");
		Credit card = new Credit(c1);
		card.setCardNumber("visa1277");
		card.setAmount(100);
		
		
		//Placing an order
		//authorisation example, the user is asked to introduce its credentials again
		if(card.authorize("Ovidiu Moldovan", "parola")){
		Order o1 = new Order(c1, i1, card);
		c1.addOrders(o1);
		card.setAmount(card.getAmount()-i1.price);
		System.out.println("Transaction succesfull");
		}
		else System.out.println("Unauthorised transaction");
		
		//example of Unauthorised transaction
		if(card.authorize("Ovidiu Moldovan", "another password")){
			Order o1 = new Order(c1, i1, card);
			c1.addOrders(o1);
			card.setAmount(card.getAmount()-i1.price);
			System.out.println("Transaction succesfull");
			}
			else System.out.println("Unauthorised transaction");
	}
}
