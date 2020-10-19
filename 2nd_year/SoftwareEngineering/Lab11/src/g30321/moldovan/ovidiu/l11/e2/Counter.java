package g30321.moldovan.ovidiu.l11.e2;

public class Counter extends Thread {
	
	int start,finish,wait,counter;
	
	Counter(String name, int start, int finish, int wait){
		super(name);
		this.start=start;
		this.finish=finish;
		this.wait=wait;
	}
	
	static int ok = 0;
	
	synchronized public void run(){
		try {
			for(int i =start; i < finish; i++)
			{
				counter++;
				Thread.sleep(wait);
					System.out.println(this.getName() + " " + i);
				}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) throws InterruptedException{
		Counter c1 = new Counter("c1", 0, 101, 100);
		Counter c2 = new Counter("c2", 101, 201, 200);
		
		
		c1.start();
		
		
		c1.join();
		
		
		c2.start();
	}
	
	
	
}
