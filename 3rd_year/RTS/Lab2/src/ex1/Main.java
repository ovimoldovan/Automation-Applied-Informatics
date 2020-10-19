package ex1;

public class Main {
	public static void main(String[] args){
		Fir f1 = new Fir(2);
		Fir f2 = new Fir(4);
		Fir f3 = new Fir(6);
		Thread t1 = new Thread(f1);
		Thread t2 = new Thread(f2);
		Thread t3 = new Thread(f3);
		
		t1.start();
		t2.start();
		t3.start();
		
		try{
			t1.join();
			t2.join();
			t3.join();
		}
		catch(Exception e){
			
		}
		int sum = f1.sum + f2.sum + f3.sum;
		System.out.println(sum);
	}
}
