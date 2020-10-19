package deadlock;

import java.util.concurrent.*;

public class MainClass {
	public static void main(String[] args) {
		System.out.println("Fir " + Thread.currentThread().getName() + " is started.");
		//Semaphore s1 = new Semaphore("Semaphore1", 1);
		//Semaphore s2 = new Semaphore("Semaphore2", 1);
		//Fir f1 = new Fir(s1, s2, "Fir1", 1111);
		//Fir f2 = new Fir(s2, s1, "Fir2", 2222);
		//f1.start();
		//f2.start();
		//try {
		//	f1.join();
		//	f2.join();
	//	} catch (InterruptedException e) {

		//}
	}
}

class Fir extends Thread {
	boolean stp = true;
	Semaphore s1, s2;
	int pause;

	public Fir(Semaphore sem1, Semaphore sem2, String nm, int ps) {
		s1 = sem1;
		s2 = sem2;
		setName(nm);
		pause = ps;
	}

	public void run() {
		while (stp) {
			try {
				s1.acquire();
				//System.out.println("Fir " + this.getName() + " has " + s1.getName());
			} catch (InterruptedException e) {
				//System.out.println("Fir " + this.getName() + " is interrupted " + s1.getName());
			}

			try {
				s2.acquire();
				//System.out.println("Fir " + this.getName() + " has " + s2.getName());
			} catch (InterruptedException e) {
				//System.out.println("Fir " + this.getName() + " is interrupted " + s2.getName());
			}
			s1.release();
			s2.release();
		}
	}
}