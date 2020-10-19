package Ex1;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Semaphore;


public class Ex1 {
	public static void main(String args[]) {
	CyclicBarrier bariera = new CyclicBarrier(3, new Runnable() {
		public void run() {
			System.out.println("Rutina barierei");
		}
	});
	Semaphore s = new Semaphore(1);
	Semaphore s1 = new Semaphore(1);
	  Fir f1;
	  Fir2 f2;
	  Fir f3;
	  f1 = new Fir(1, s, 2, 4, 4,bariera);
	  f2 = new Fir2(2, s, 3, 6, 3,bariera,s1);
	  f3 = new Fir(3, s1, 2, 5, 5,bariera);
	  f1.start();
	  f2.start();
	  f3.start();
}
}

class Fir extends Thread{
	int nume, amin,amax, k, sleep;
	CyclicBarrier bariera;
	Semaphore s;
	Fir(int n, Semaphore sa, int amin,int amax,int sleep, CyclicBarrier bariera) {
		this.nume = n;
		this.s = sa;
		this.amin=amin;
		this.amax=amax;
		this.sleep=sleep;
		this.bariera = bariera;
	}
	public void run() {
		System.out.println("Fir: "+nume+" este in starea ST1");
		try {
			this.s.acquire();
			if(nume==1)
				System.out.println("Fir " + nume
						+ " a luat un jeton din semafor 1");
			else
				System.out.println("Fir " + nume
						+ " a luat un jeton din semafor 2");
			System.out.println("Fir: "+ nume+" este in ST2");
			int k= (int) Math.round(Math.random()*(amax
					- amin) + amin);
			for (int i = 0; i < k * 100000; i++) {
				i++;
				i--;
			}
			Thread.sleep(sleep*1000);
			this.s.release();
			System.out.println("Fir: " + nume
					+ " a eliberat un jeton din semafor");
			System.out.println("Fir: "+nume+" este in starea ST3");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		activitate();
		try {
			bariera.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (BrokenBarrierException e) {
			e.printStackTrace();
		}
		activitate();
	}
	public void activitate() {
		System.out.println("Fir: "+nume + "> activitate");
		try {
			Thread.sleep(Math.round(Math.random() * 3 + 3) * 1000);
		} catch (InterruptedException e) {
		}
	}
}
class Fir2 extends Fir{
	Semaphore s1;
	Fir2(int n, Semaphore sa, int amin,int amax,int sleep, CyclicBarrier bariera,Semaphore sa1){
		super(n,sa,amin,amax,sleep,bariera);
		this.s1=sa1;
	}
	@Override
	public void run() {
		System.out.println("Fir: "+nume+" este in starea ST1");
		try {
			this.s.acquire();
			System.out.println("Fir " + nume
					+ " a luat un jeton din semafor 1");
			this.s1.acquire();
			System.out.println("Fir " + nume
					+ " a luat un jeton din semafor 2");
			System.out.println("Fir: "+ nume+" este in ST2");
			int k= (int) Math.round(Math.random()*(amax
					- amin) + amin);
			for (int i = 0; i < k * 100000; i++) {
				i++;
				i--;
			}
			Thread.sleep(sleep*1000);
			this.s1.release();
			System.out.println("Fir: " + nume
					+ " a eliberat un jeton din semafor 2");
			this.s.release();
			System.out.println("Fir: " + nume
					+ " a eliberat un jeton din semafor 1");
			System.out.println("Fir: "+nume+"este in starea ST3");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		activitate();
		try {
			bariera.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (BrokenBarrierException e) {
			e.printStackTrace();
		}
		activitate();
	}
	public void activitate() {
		System.out.println("Fir:"+nume + "> activitate");
		try {
			Thread.sleep(Math.round(Math.random() * 3 + 3) * 1000);
		} catch (InterruptedException e) {
		}
	}
}