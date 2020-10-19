
public class Main {
	
	

	public static void main(String[] args) {
		Integer monitor = new Integer(1);
		Integer monitor2 = new Integer(1);
		/* Ex1/2
		new Fir(monitor, 2, 4, 4).start();
		new FirDublu(monitor, monitor2, 3, 6, 3).start();
		new Fir(monitor2, 2, 5, 5).start();
	*/
		
		new FirEx3(monitor,monitor2, 2, 4, 4, 6, 4).start();
		new FirEx3(monitor2, monitor, 3, 5, 5, 7, 5).start();
	}

}
