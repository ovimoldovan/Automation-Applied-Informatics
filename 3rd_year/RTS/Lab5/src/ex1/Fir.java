package ex1;

import java.util.concurrent.locks.Lock;

public class Fir extends Thread {
	Integer monitor;
	int sleep_min, sleep_max, activity_min, activity_max;
	int activity_min2, activity_max2;
	int sleepTime;
	
	Lock l1,l2;
	
	public Fir(int activity_min, int activity_max, int activity_min2, int activity_max2, int sleepTime, Lock l1, Lock l2){
		this.activity_min = activity_min;
		this.activity_max = activity_max;
		this.activity_min2 = activity_min2;
		this.activity_max2 = activity_max2;
		this.sleepTime = sleepTime;
		this.l1 = l1;
		this.l2 = l2;
		}
	
	
	public void run(){
		
		while(true){
		System.out.println(this.getName() + " - STATE 1");
		int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
		for(int i=0; i<k*100000; i++){
			i++;i--;
		}
		l1.lock();
			System.out.println(this.getName() + "- STATE 2");
			
			k = (int) Math.round(Math.random()*(activity_max2 - activity_min2) + activity_min2);
			for(int i=0; i<k*100000; i++){
				i++;i--;
			}
			
			if(l2.tryLock()){
			
			System.out.println(this.getName() + " - STATE 3");
			try {
				Thread.sleep(sleepTime*1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			l1.unlock();
			l2.unlock();
			
			System.out.println(this.getName() + " - STATE 4");
		}
			else{
				l1.unlock();
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				l1.lock();
				l2.lock();
				
			}
		}
		
	}
}
