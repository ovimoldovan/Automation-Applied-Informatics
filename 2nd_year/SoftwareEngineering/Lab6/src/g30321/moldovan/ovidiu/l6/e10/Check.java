package g30321.moldovan.ovidiu.l6.e10;

public class Check extends Payment implements Authorisation{
	private String bankId;
	
	Customer checkHolder = new Customer();

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	
	public boolean authorize(String usr, String pwd){
		if(this.checkHolder.getPassword() == pwd && this.checkHolder.getName() == usr) return true;
		else return false;
	}
}
