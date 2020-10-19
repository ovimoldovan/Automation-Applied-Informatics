package lab;

import javax.swing.*;
import java.awt.*;

//changed to JTextField
public class MainFrame extends JFrame {

	public MainFrame() {
		setTitle("Thread priority test");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLayout(new GridLayout(5, 1));
		setSize(300, 300);
		setVisible(true);
	}

	public void addNewThreadComponent(CounterX x) {
		JPanel p = new JPanel();
		p.setLayout(new FlowLayout());
		p.add(new JLabel(x.getName()));
		p.add(x.getProgressBar());
		add(p);
	}

	public static void main(String[] args) {
		MainFrame mf = new MainFrame();
		CounterX c1 = new CounterX(1000, 1);
		mf.addNewThreadComponent(c1);

		CounterX c2 = new CounterX(1000, 5);
		mf.addNewThreadComponent(c2);

		CounterX c3 = new CounterX(1000, 10);
		mf.addNewThreadComponent(c3);

		c1.start();
		c2.start();
		c3.start();

	}
}

class CounterX extends Thread {
	int size;
	JTextField pBar;

	CounterX(int s, int priority) {
		this.size = s;
		pBar = new JTextField(20);
		// pBar.setStringPainted(true);
		this.setPriority(priority);
	}

	JComponent getProgressBar() {
		return pBar;
	}

	public void run() {
		for (int i = 0; i <= size; i++) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			pBar.setText(String.valueOf(i));
		}
	}

}
