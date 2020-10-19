import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Semaphore;

public class ExecutionThread2 extends Thread {
	Semaphore s1;
	Semaphore s2;
	CyclicBarrier cb;
	int s, activity_min, activity_max;
	public ExecutionThread2(Semaphore s1, Semaphore s2, CyclicBarrier cb, int activity_min, int activity_max, int s) {
		this.s1 = s1;
		this.s2 = s2;
		this.s = s;
		this.cb = cb;
		this.activity_min = activity_min;
		this.activity_max = activity_max;
	}
	public void run() {
		while(true) {
			System.out.println(this.getName() + " - STATE 1");
				try {
					s1.acquire();
				} catch (InterruptedException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				try {
					s2.acquire();
				} catch (InterruptedException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
			
			System.out.println(this.getName() + " - STATE 2");
			int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
			for (int i = 0; i < k * 100000; i++) {
				i++; i--;
			}
			try {
				sleep(s*100);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			s1.release();
			s2.release();

			System.out.println(this.getName() + " - STATE 3");
			try {
				cb.await();
			} catch (InterruptedException | BrokenBarrierException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}