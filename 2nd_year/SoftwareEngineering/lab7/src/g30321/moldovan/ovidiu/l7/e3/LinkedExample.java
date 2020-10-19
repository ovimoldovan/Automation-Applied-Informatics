package g30321.moldovan.ovidiu.l7.e3;

import java.util.LinkedList;
import java.util.PriorityQueue;

public class LinkedExample {
	public static void main(String[] args) { 
		/*LinkedList lk = new LinkedList(); */
		PriorityQueue lk = new PriorityQueue();
		lk.offer(new Command("comanda 1")); 
		lk.offer(new Command("comanda 2")); 
		lk.offer(new Command("comanda 3")); 
		Command c = (Command)lk.remove(); 
		c.execute(); 
		c = (Command)lk.remove(); 
		c.execute();
		c = (Command)lk.remove(); 
		c.execute();
	}
}
