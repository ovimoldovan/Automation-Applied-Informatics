package g30321.moldovan.ovidiu.l6.e10;

import java.util.ArrayList;

public class Order {
	private String status;
	
	private Customer customer;
	
	private ArrayList<Item> items = new ArrayList<Item>();
	
	private ArrayList<Payment> payments = new ArrayList<Payment>();
	
	
	//Creating constructor so that an order has to have a customer, an item and a payment method
	
	Order(Customer c, Item i, Payment p){
		this.customer = c;
		this.items.add(i);
		this.payments.add(p);
		
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}
}
