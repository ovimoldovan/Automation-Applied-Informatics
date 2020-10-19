package g30321.moldovan.ovidiu.l6.e3;

public class Phone {
	
	Button[] buttons = new Button[15];
	
	Phone(){
		for(int i = 0; i<=14;i++){
			buttons[i] = new Button();
		}
	}
	
	
	class Button{
		int info = 0;
	}
	
	
	public static void main(String[] args){
		Phone phone = new Phone();
		System.out.println(phone.buttons.length);
	}
}
