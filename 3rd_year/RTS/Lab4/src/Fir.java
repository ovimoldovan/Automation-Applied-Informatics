
public class Fir extends Thread {
	Integer monitor;
	int sleep_min, sleep_max, activity_min, activity_max;
	int sleepValue;
	
	public Fir(Integer monitor, int activity_min, int activity_max, int sleepValue){
		this.monitor = monitor;
		this.activity_min = activity_min;
		this.activity_max = activity_max;
		this.sleepValue = sleepValue;
		}
	
	
	public void run(){
		System.out.println(this.getName() + " - STATE 1");
		
	
		
		//System.out.println(this.getName() + " - STATE 2");
		
		synchronized(monitor){
			System.out.println(this.getName() + "- STATE 2");
			
			int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
			for(int i=0; i<k*100000; i++){
				i++;i--;
			}
			try{
				Thread.sleep(sleepValue * 1000);
				
			}
			catch(InterruptedException e){
				e.printStackTrace();
			}
	
			
		}
		System.out.println(this.getName() + " - STATE 3");	
	}
}
