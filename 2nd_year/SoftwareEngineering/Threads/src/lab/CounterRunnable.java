package lab;

public class CounterRunnable implements Runnable {
	public static void main(String[] args) {
		CounterRunnable c1 = new CounterRunnable();
		CounterRunnable c2 = new CounterRunnable();
		CounterRunnable c3 = new CounterRunnable();
		Thread t1 = new Thread(c1, "Counter 1");
		Thread t2 = new Thread(c2, "Counter 2");
		Thread t3 = new Thread(c3, "Counter 3");
		t1.start();
		t2.start();
		t3.start();

	}

	public void run() {
		Thread t = Thread.currentThread();
		for (int i = 0; i < 20; i++) {
			System.out.println(t.getName() + " i= " + i);
			try {
				Thread.sleep((int) Math.random() * 1000);
			} catch (InterruptedException e) {

			}
		}
		System.out.println(t.getName() + " is finalised.");
	}
}
