
public class Synch {
	public synchronized void monWait() {
		try {
			wait(1000);
		} catch (InterruptedException e) {
			System.out.println("Eroare: Firul e intrerupt.");
		}
	}

	public synchronized void monNotify() {
		notify();
	}

	public static void main(String[] args) {
		Synch s = new Synch();
		System.out.println("Waiting.");
		s.monWait();
		System.out.println("Notifying.");
		s.monNotify();

	}
}
