package monitor;

public class MainClass {
	
	static void ceva(){
		System.out.println("ceva");
	}
	public static void main(String[] args) {
		
		ceva();
		
		
		
		
		
		MonitorResursa m = new MonitorResursa(0, 5);
		Provider p = new Provider(m);
		User u = new User(m);
		p.start();
		u.start();
		User u2 = new User(m);
		u2.start();
	}
}

class MonitorResursa {
	private int n, cap;

	public MonitorResursa(int val, int cp) {
		n = val;
		cap = cp;
	}

	public synchronized void take() throws InterruptedException {
		while (n == 0)
			wait();
		n--;
		System.out.println("take n= " + n);
		notify();
	}

	public synchronized void provide() throws InterruptedException {
		while (n == cap)
			wait();
		n++;
		System.out.println("provide n = " + n);
		notify();
	}
}

class Provider extends Thread {
	MonitorResursa mr;

	public Provider(MonitorResursa m) {
		mr = m;
	}

	public void run() {
		while (true) {
			int i = (int) (100 * Math.random());
			try {
				sleep(i);
			} catch (InterruptedException e) {

			}

			try {
				mr.provide();
			} catch (InterruptedException e) {

			}
		}
	}
}

class User extends Thread {
	MonitorResursa mr;

	public User(MonitorResursa m) {
		mr = m;
	}

	public void run() {
		while (true) {
			int i = (int) (100 * Math.random());
			try {
				sleep(i);
			} catch (InterruptedException e) {

			}

			try {
				mr.take();
			} catch (InterruptedException e) {

			}
		}
	}
}
