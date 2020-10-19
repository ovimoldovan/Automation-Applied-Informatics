package prim;

import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Lock;

public class Fir2 extends Thread {
	Integer monitor;
	int sleep_min, sleep_max, activity_min, activity_max;
	int activity_min2, activity_max2;
	int sleepTime;
	int p1,p2;
	Semaphore s;
	
	public Fir2(int p1, int p2,int activity_min, int activity_max, int sleepTime, Semaphore s){
		this.activity_min = activity_min;
		this.activity_max = activity_max;
		this.p1 = p1;
		this.p2 = p2;
		this.sleepTime = sleepTime;
		this.s = s;
		}
	
	
	public void run(){
		
		while(true){
		System.out.println(this.getName() + " - STATE 1");
		
		
		try {
			Thread.sleep(sleepTime*1000);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
			System.out.println(this.getName() + "- STATE 2");
			
			try {
				s.acquire(p1);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			
			System.out.println(this.getName() + " - STATE 3");
			int k = (int) Math.round(Math.random()*(activity_max - activity_min) + activity_min);
			for(int i=0; i<k*100000; i++){
				i++;i--;
			}
			s.release(p2);
			
			System.out.println(this.getName() + " - STATE 4");
		}
		}
		
	}