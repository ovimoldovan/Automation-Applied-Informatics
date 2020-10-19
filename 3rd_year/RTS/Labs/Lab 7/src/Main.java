import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Semaphore;

public class Main {
	public static void main(String[] args) {
		Semaphore s1 = new Semaphore(1);
		Semaphore s2 = new Semaphore(2);
		CyclicBarrier cb = new CyclicBarrier(3, new Runnable() {public void run() { System.out.println("Bariera"); }});
		
		new ExecutionThread(s1, cb, 2, 4, 4).start();
		new ExecutionThread2(s1, s2, cb, 3, 6, 3).start();
		new ExecutionThread(s2, cb, 2, 4, 4).start();
	}
}