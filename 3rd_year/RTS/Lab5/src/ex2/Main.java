package ex2;

import java.util.concurrent.Semaphore;

class Fir extends Thread {
	int nume, intarziere, k, permise;
	Semaphore s;

	Fir(int n, Semaphore sa, int intarziere, int k, int permise) {
		this.nume = n;
		this.s = sa;
		this.intarziere = intarziere;
		this.k = k;
		this.permise = permise;
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(this.intarziere * 500);
				this.s.acquire(this.permise); // regiune critica
				System.out.println("Fir " + nume
						+ " a luat un jeton din semafor");
				for (int i = 0; i < k * 100000; i++) {
					i++;
					i--;
				}
				this.s.release(); // sfarsit regiune critica
				System.out.println("Fir " + nume
						+ " a eliberat un jeton din semafor");
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

public class Main {
    public static void main(String args[]) {
        Semaphore s = new Semaphore(1);
	  Fir2 f1, f2;
	  f1 = new Fir2(1,2,2,2,5,s);
	  f2 = new Fir2(2,1,4,3,6,s);
	  
	  f1.start();
	  f2.start();
    }
}
