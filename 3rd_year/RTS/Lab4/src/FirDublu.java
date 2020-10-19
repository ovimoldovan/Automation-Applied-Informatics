
public class FirDublu extends Fir{
	Integer monitor2;
	int sleepValue;

	public FirDublu(Integer monitor, Integer monitor2, int activity_min, int activity_max, int sleepValue) {
		super(monitor, activity_min, activity_max, sleepValue);
		// TODO Auto-generated constructor stub
		this.monitor2 = monitor2;
	}
	
	@Override
	public void run(){
		System.out.println(this.getName() + " - STATE 1");
		
		//System.out.println(this.getName() + " - STATE 2");
		
		synchronized(monitor){
			synchronized(monitor2){
			System.out.println(this.getName() + "- STATE 2");
			int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
			for(int i=0; i<k*100000; i++){
				i++;i--;
			}
			try {
				Thread.sleep(sleepValue * 1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		}
		System.out.println(this.getName() + " - STATE 3");	
	}

}
