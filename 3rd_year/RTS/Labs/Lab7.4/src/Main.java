import java.util.concurrent.Semaphore;

public class Main {
	public static void main(String[] args) {
		
		Semaphore s = new Semaphore(2);
		
		new ExecutionThread(s, 3, 6, 5).start();
		new ExecutionThread(s, 4, 7, 3).start();
		new ExecutionThread(s, 5, 7, 6).start();
	}
}