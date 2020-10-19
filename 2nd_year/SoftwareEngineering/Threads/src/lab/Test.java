package lab;

import java.util.ArrayList;

public class Test {
	public static void main(String[] args) {
		Buffer b = new Buffer();
		Producer pro = new Producer(b);
		Consumer c1 = new Consumer(b);
		Consumer c2 = new Consumer(b);
		pro.start();
		c1.start();
		c2.start();
	}
}

/**
 * Aceasta este o clasa de tip fir de executie. In cadrul unei bucle infinite
 * sunt generate numere de tip double si sunt adaugate in cadrul unui obiect de
 * tip Buffer apeland metoda put. Aduagare elementelor se face la intervale de 1
 * secunda.
 *
 */
class Producer implements Runnable {
	private Buffer bf;
	private Thread thread;

	Producer(Buffer bf) {
		this.bf = bf;
	}

	public void start() {
		if (thread == null) {
			thread = new Thread(this);
			thread.start();
		}
	}

	@Override
	public void run() {
		while (true) {
			bf.put(Math.random());
			System.out.println("Am scris.");
			try {
				Thread.sleep(1000);
			} catch (Exception e) {

			}
		}
	}
}

/**
 * Aceasta este o clasa de tip fir de executie. Intr-o bucla infinita sunt
 * citite elemente din cadrul unui obiect de tip Buffer.
 */

class Consumer extends Thread {
	private Buffer bf;

	Consumer(Buffer bf) {
		this.bf = bf;
	}

	public void run() {
		while (true) {
			System.out.println("Am citit: " + this + " >> " + bf.get());
		}
	}

}

class Buffer {
	ArrayList content = new ArrayList();

	/**
	 * Prin intermediul acestei metode sunt adaugate elemente in containerul
	 * content. Se observa ca aceasta metoda este sincronizata. Metoda fa fi
	 * apelata de firele de executie de tip Producer.
	 *
	 * Dupa adaugarea unui element in container se apeleaza metoda notify()
	 * aceasta asigura trezirea unui fir de executie ce a fost blocat prin
	 * apelul functiei wait().
	 * 
	 * @param d
	 */
	synchronized void put(double d) {
		content.add(new Double(d));
		notify();
	}

	/**
	 * Aceasta metoda este folosita pentru a extrage elemente din cadrul
	 * containerului content. Se observa ca aceasta metoda este sincronizata.
	 * Daca containerul este gol se apeleaza metoda wait(). Aceasta va bloca
	 * firul de executie apelant pana in momentul in care un fir de executie
	 * producator va adauga in container un element si va apela metoda notify()
	 * (vezi metoda put(...))
	 *
	 * @return
	 */
	synchronized double get() {
		double d = -1;
		try {
			if (content.size() == 0)
				wait();
			d = (((Double) content.get(0))).doubleValue();
			content.remove(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
}