package g30321.moldovan.ovidiu.l6.e10;

import java.util.ArrayList;

public class Customer {
	private String name;
	
	private String password;
	
	private ArrayList<Order> orders = new ArrayList<Order>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Order> getOrders() {
		return orders;
	}

	public void addOrders(Order o){
		this.orders.add(o);
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
