import java.awt.event.*;
import javax.swing.*;

public class MyThread extends JFrame implements Runnable {
	JTextField tf1, tf2;
	boolean loop = false;
	JButton but1, but2, but3;
	String threadName = "Firul meu";
	Thread t;

	public MyThread() {
		super();
		t = new Thread(this);
	}

	public void run() {
		int i = 0;
		loop = true;
		while (loop) {
			tf1.setText("iteration = " + i);
			tf2.setText(this.getName() + " pr = " + Thread.currentThread().getPriority());
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
			}
			i++;
		}
		loop = true;
	}

	ActionListener ac1 = new ActionListener() {
		public void actionPerformed(ActionEvent eu) {
			tf2.setText(Thread.currentThread().getName() + "pr = " + Thread.currentThread().getPriority());
			if (t.isAlive())
				loop = false;
		}
	};

	ActionListener ac2 = new ActionListener() {
		public void actionPerformed(ActionEvent eu) {
			tf2.setText(Thread.currentThread().getName());
			if (!t.isAlive() && (!loop))
				t.start();
			if (!t.isAlive() && (loop))
				tf2.setText("Fir mort.");
		}
	};

	ActionListener ac3 = new ActionListener() {
		public void actionPerformed(ActionEvent eu) {
			tf2.setText(Thread.currentThread().getName());
			newThread();
		}
	};

	public Thread create() {
		Thread thread = new Thread(this);
		thread.start();
		return thread;
	}

	public Thread newThread() {
		MyThread ht = new MyThread();
		Thread thread = new Thread(ht);
		return thread;
	}

	public static void main(String[] args) {

	}

}
