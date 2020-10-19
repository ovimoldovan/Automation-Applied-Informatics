package Ex2;


import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Semaphore;

public class Ex2 {
public static void main(String args[]) {
	CountDownLatch countDownLatch = new CountDownLatch(1);
	Semaphore s1=new Semaphore(0);
	Semaphore s2=new Semaphore(0);
	Firr f1;
	Fir1 f2;
	Fir1 f3;
	f1=new Firr(1,s1,s2,2,3,7, countDownLatch);
	f2=new Fir1(2,s1,3,5,5,countDownLatch);
	f3=new Fir1(3,s2,4,6,5,countDownLatch);
	f1.start();
	f2.start();
	f3.start();
}
}

class Firr extends Thread{
	int nume, amin,amax, k, sleep;
	CountDownLatch countDownLatch;
	Semaphore s1;
	Semaphore s2;
	Firr(int n, Semaphore sa,Semaphore sa1, int amin,int amax,int sleep, CountDownLatch countDownLatch) {
		this.nume = n;
		this.s1 = sa;
		this.s2 = sa1;
		this.amin=amin;
		this.amax=amax;
		this.sleep=sleep;
		this.countDownLatch = countDownLatch;
	}
	
	public void run() {
		System.out.println("Fir "+ nume+" Start");
		try {
			Thread.sleep(sleep*1000);
		}catch (InterruptedException e) {
		}
		System.out.println("Fir "+nume+" este in ST1");
		int k= (int) Math.round(Math.random()*(amax
				- amin) + amin);
		for (int i = 0; i < k * 100000; i++) {
			i++;
			i--;
		}
		this.s1.release();
		System.out.println("Fir " + nume
				+ " a eliberat un jeton din semafor 1");
		this.s2.release();
		System.out.println("Fir " + nume
				+ " a eliberat un jeton din semafor 2");
		System.out.println("Fir "+nume+" este in ST2");
		activitate1();
		System.out.println(countDownLatch.getCount());
		countDownLatch.countDown();
		try {
			System.out.println(countDownLatch.getCount());
			countDownLatch.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		activitate2();
		System.out.println("Gata");
	}
	public void activitate1() {
		System.out.println("Fir "+nume + "> activitate 1");
		try {
			Thread.sleep(Math.round(Math.random() * 3 + 3) * 1000);
		} catch (InterruptedException e) {
		}
	}
	public void activitate2() {
		System.out.println("Fir "+nume+ "> activitate 2");
		try {
			Thread.sleep(Math.round(Math.random() * 3 + 3) * 1000);
		} catch (InterruptedException e) {
		}
	}

}
class Fir1 extends Thread{
	int nume, amin,amax, k, sleep;
	CountDownLatch countDownLatch;
	Semaphore s;
	Fir1(int n, Semaphore sa, int amin,int amax,int sleep, CountDownLatch countDownLatch) {
		this.nume = n;
		this.s = sa;
		this.amin=amin;
		this.amax=amax;
		this.sleep=sleep;
		this.countDownLatch = countDownLatch;
	}
	public void run() {
		try {
		this.s.acquire();
		Thread.sleep(1000);
		if(nume==2)
		  System.out.println("Fir "+nume+" a luat un jeton din semaforul 1");
		else
		 System.out.println("Fir "+nume+" a luat un jeton din semaforul 2");
		
		System.out.println("Fir "+nume+" Start");
		Thread.sleep(sleep*1000);
		System.out.println("Fir "+nume+" este in ST1");
		int k= (int) Math.round(Math.random()*(amax
				- amin) + amin);
		for (int i = 0; i < k * 100000; i++) {
			i++;
			i--;
		}
		System.out.println("Fir "+nume+" este in ST2");
		}catch (InterruptedException e) {
			e.printStackTrace();
		}
		activitate1();
		countDownLatch.countDown();
		try {
			countDownLatch.await();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		activitate2();
		System.out.println("gata");
	}
	public void activitate1() {
		System.out.println("Fir"+ nume + "> activitate 1");
		try {
			Thread.sleep(Math.round(Math.random() * 3 + 3) * 1000);
		} catch (InterruptedException e) {
		}
	}
	public void activitate2() {
		System.out.println("Fir "+nume + "> activitate 2");
		try {
			Thread.sleep(Math.round(Math.random() * 3 + 3) * 1000);
		} catch (InterruptedException e) {
		}
	}
}
