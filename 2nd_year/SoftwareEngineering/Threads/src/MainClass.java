import javax.swing.*;

class HidenThread extends JFrame implements Runnable {
	JTextField tf;
	boolean loop = true;

	public HidenThread() {
		super();
		this.setSize(250, 150);
		tf = new JTextField(20);
		tf.setBounds(20, 20, 120, 20);
		this.add(tf);
		setVisible(true);
	}

	public void run() {
		int i = 0;
		while (loop) {
			tf.setText("iteration= " + i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {

			}
			i++;

		}
	}
}

public class MainClass {
	public static void main(String[] args) {
		HidenThread ht = new HidenThread();
		Thread thread = new Thread(ht);
		thread.start();
	}
}