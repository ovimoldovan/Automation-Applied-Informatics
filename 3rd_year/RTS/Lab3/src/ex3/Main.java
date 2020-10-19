package ex3;

class JoinTestThread extends Thread {
	Thread t;
	String n;

	JoinTestThread(String n, Thread t) {
		this.setName(n);
		this.n = n;
		this.t = t;
	}

	public void run() {
		System.out.println("Firul " + n + " a intrat in metoda run()");
		try {
			if (t != null){
				t.join();
				System.out.println("s-a facut join");
			}
			System.out.println("Firul " + n + " executa operatie.");
			Thread.sleep(3000);
			System.out.println("Firul " + n + " a terminat operatia.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

public class Main {
	public static void main(String[] args) {
		JoinTestThread w1 = new JoinTestThread("Fir 1", null);
		JoinTestThread w2 = new JoinTestThread("Fir 2", w1);
		w1.start();
		w2.start();
	}
}