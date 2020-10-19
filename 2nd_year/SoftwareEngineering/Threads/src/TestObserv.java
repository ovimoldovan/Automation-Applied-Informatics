import java.util.*;

public class TestObserv {
	public static void main(String[] args) {
		Observat obs1 = new Observat("obs1");
		Observat obs2 = new Observat("obs2");
		Observator ob1 = new Observator();
		Observator ob2 = new Observator();
		obs1.addObserver(ob1);
		obs2.addObserver(ob1);
		Actualizare act = new Actualizare(obs1, "ACT");
		Aleator alt = new Aleator(obs2, "ALT");
		act.start();
		alt.start();
		while (true) {
			obs1.incr("MAIN");
			obs2.incr("MAIN");
			try {
				Thread.sleep(5555);
			} catch (InterruptedException e) {

			}
		}
	}

}

class Observat extends Observable {
	private int nr = 0;
	private String nume;
	public String modificator;

	Observat(String s) {
		nume = new String(s);
	}

	public void incr(String s) {
		setChanged();
		modificator = s;
		nr++;
		notifyObservers(modificator);
		clearChanged();
	}

	public void set(int i, String s) {
		setChanged();
		modificator = new String(s);
		nr = i;
		notifyObservers(modificator);
		clearChanged();
	}

	public int get() {
		return nr;
	}

	public String toString() {
		return nume;
	}
}

class Observator implements Observer {
	public synchronized void update(Observable o, Object arg) {
		Observat ob = (Observat) o;
		System.out.println("A fost modificat " + o + " la " + ob.get() + " de " + arg);
		System.out.println("Activat de firul " + Thread.currentThread().getName());
	}
}

class Actualizare extends Thread {
	Observat ob;
	String nume;

	Actualizare(Observat o, String s) {
		ob = o;
		nume = new String(s);
	}

	public void run() {
		while (true) {
			ob.incr(nume);
			try {
				sleep(3333);
			} catch (InterruptedException e) {

			}
		}
	}
}

class Aleator extends Thread {
	Observat ob;
	String nume;

	Aleator(Observat o, String s) {
		ob = o;
		nume = new String(s);
	}

	public void run() {
		while (true) {
			int i = (int) (100 * Math.random());
			ob.set(i, nume);
			try {
				sleep(4444);
			} catch (InterruptedException e) {

			}
		}
	}
}