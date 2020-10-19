package exemplu1;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class Fir extends Thread {
	int nume;
	Lock l;

	Fir(int n, Lock la) {
		this.nume = n;
		this.l = la;
	}

	public void run() {
		this.l.lock();
		System.out.println("Fir " + nume + " a pus zavorul");
		regiuneCritica();
		this.l.unlock();
		System.out.println("Fir " + nume + " a eliberat zavorul");
	}

	public void regiuneCritica() {
		System.out.println("SE EXECUTA REGIUNEA CRITICA!");
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {			
			e.printStackTrace();
		}
	}
}

public class Main {
	public static void main(String args[]) {
		Lock l = new ReentrantLock();
		Fir f1, f2;
		f1 = new Fir(1, l);
		f2 = new Fir(2, l);
		f1.start();
		f2.start();
	}
}