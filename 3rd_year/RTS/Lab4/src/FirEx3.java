
public class FirEx3 extends FirDublu{
	
	int a1;
	int a2;
	public FirEx3(Integer monitor, Integer monitor2, int activity_min, int activity_max,int sleepValue, int a1, int a2) {
		super(monitor, monitor2, activity_min, activity_max,sleepValue);
		// TODO Auto-generated constructor stub
		this.a1 = a1;
		this.a2 = a2;
	}
	
	@Override
	public void run(){
		System.out.println(this.getName() + " - STATE 1");
		

		int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
		for(int i=0; i<k*100000; i++){
			i++;i--;
		}
		


		
		synchronized(monitor){
			synchronized(monitor2){
				System.out.println(this.getName() + "- STATE 2");
			int k2 = (int) Math.round(Math.random()*(a1 - a2) + a2);
			for(int i=0; i<k2*100000; i++){
				i++;i--;
			}
			
			System.out.println(this.getName() + "- STATE 3");
			try {
				Thread.sleep(sleepValue * 1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(this.getName() + " - STATE 4");	
			}
		}

	}

	
	

}
