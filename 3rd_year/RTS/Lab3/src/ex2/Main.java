package ex2;

import java.util.ArrayList;

class Buffer {
	ArrayList<Double> content = new ArrayList<Double>();

	synchronized void put(double d) {
		content.add(new Double(d));
		notify();
	}

	synchronized double get() {
		double d = -1;
		try {
			if (content.size() == 0)
				wait();
			d = (content.get(0)).doubleValue();
			content.remove(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
}

public class Main {
	public static void main(String[] args) {
		Buffer b = new Buffer();
		Producer pro = new Producer(b);
		Consumer c = new Consumer(b);
		Consumer c2 = new Consumer(b);
		pro.start();
		c.start();
		c2.start();
	}
}

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

	public void run() {
		while (true) {
			bf.put(Math.random());
			System.out.println("Producer " + thread.getName() + " gave a task.");
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
// --------------------------------------------------------------------

class Consumer extends Thread {
	private Buffer bf;

	Consumer(Buffer bf) {
		this.bf = bf;
	}

	public void run() {
		while (true) {
			System.out.println("Consumer " + this.getName() + " received >> " + bf.get());
		}
	}
}
