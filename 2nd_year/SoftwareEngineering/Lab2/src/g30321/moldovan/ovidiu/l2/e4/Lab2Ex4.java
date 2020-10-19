package g30321.moldovan.ovidiu.l2.e4;

import java.util.Random;

public class Lab2Ex4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random r = new Random();
		int counter = r.nextInt(10);
		while(counter>0){
			try{
				Thread.sleep(1000);
			}
			catch(InterruptedException e){
				e.printStackTrace();
			}
			System.out.println(counter);
			counter--;
		}
	}

}
