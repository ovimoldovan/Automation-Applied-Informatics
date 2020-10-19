package ex1;

public class Fir implements Runnable{
	int pas;
	Fir(int pas){
		this.pas = pas;
	}
	public int sum;
	
	public void run(){
		Thread t = Thread.currentThread();
		int sum = 0;
		for(int i=0;i<=60;i+=pas){
			sum+=i;
		}
		this.sum = sum;
		System.out.println("Fir " + t.getName() + " cu suma " + sum + " and priority " + t.getPriority());
	}
	
}
