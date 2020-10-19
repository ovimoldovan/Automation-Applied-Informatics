import java.util.concurrent.Semaphore;

class Fir extends Thread {
	int nume, intarziere, k, permise;
	int nr;
	Semaphore s;
	Fir(int n, Semaphore sa, int intarziere, int k, int permise, int nr) {
		this.nume = n;
		this.s = sa;
		this.intarziere = intarziere;
		this.k = k;
		this.permise = permise;
		this.nr = nr;
	}
	public void run() {
		while (true) {
			try {
				Thread.sleep(this.intarziere * 500);
				System.out.println("Firul "+nume+" are "+s.availablePermits()+" permisiuni.");
				this.s.acquire(this.permise); // regiune critica
				System.out.println("Fir " + nume
						+ " a luat un jeton din semafor");
				for (int i = 0; i < k * 100000; i++) {
					i++;
					i--;
				}
				this.s.release(this.nr); // sfarsit regiune critica
				System.out.println("Fir " + nume
						+ " a eliberat un jeton din semafor");
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}