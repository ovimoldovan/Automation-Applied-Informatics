package lab;

public class Counter extends Thread {
	Counter(String name) {
		super(name);
	}

	public void run() {
		for (int i = 0; i < 20; i++) {
			System.out.println(getName() + " i = " + i);
			try {
				int time = (int) (Math.random() * 1000);
				Thread.sleep(time);
				System.out.println(time);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println(getName() + " job finalised.");
	}

	public static void main(String[] args) {
		Counter c1 = new Counter("Counter 1");
		Counter c2 = new Counter("Counter 2");
		Counter c3 = new Counter("Counter 3");
		c1.start();
		c2.start();
		c3.start();
	}
}
