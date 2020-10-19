import java.util.concurrent.Semaphore;

public class ExecutionThread extends Thread {
	Semaphore s;
	int activity_min, activity_max, sleep;
	
	public ExecutionThread(Semaphore s, int activity_min, int activity_max, int sleep) {
		this.s = s;
		this.activity_min = activity_min;
		this.activity_max = activity_max;
		this.sleep = sleep;
	}
	public void run() {
		while(true) {
			System.out.println(this.getName() + " - STATE 1");
			try {
				s.acquire();
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			System.out.println(this.getName() + " - STATE 2");
			int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
			for (int i = 0; i < k * 100000; i++) {
				i++; i--;
			}
			s.release();

			System.out.println(this.getName() + " - STATE 3");
			try {
				Thread.sleep(sleep * 1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(this.getName() + " - STATE 4");
		}
	}
}