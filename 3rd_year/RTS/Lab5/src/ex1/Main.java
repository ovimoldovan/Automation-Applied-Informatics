package ex1;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;



public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Lock l1 = new ReentrantLock();
		Lock l2 = new ReentrantLock();
		
		Fir f1 = new Fir(2,4,4,6,4,l1,l2);
		Fir f2 = new Fir(3,5,5,7,5,l2,l1);
		
		f1.start();
		f2.start();
	}

}
