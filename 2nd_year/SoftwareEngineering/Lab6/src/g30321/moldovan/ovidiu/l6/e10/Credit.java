package g30321.moldovan.ovidiu.l6.e10;

public class Credit extends Payment implements Authorisation{
	private String cardNumber;
	
	Customer cardHolder = new Customer();
	
	Credit(Customer c){
		this.cardHolder = c;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	
	public boolean authorize(String usr, String pwd){
		if(this.cardHolder.getPassword() == pwd && this.cardHolder.getName() == usr) return true;
		else return false;
	}
}
