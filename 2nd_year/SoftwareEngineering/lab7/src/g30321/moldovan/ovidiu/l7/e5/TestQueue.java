package g30321.moldovan.ovidiu.l7.e5;

import java.util.ArrayList;
import java.util.PriorityQueue;

public class TestQueue {
	
	static ArrayList<String> jobs = new ArrayList<String>();
	
	
	
	public static void main(String[] args) { 
		/*Job j1 = new Job("chek trains on input rail segments",3); 
		Job j2 = new Job("chek trains on ouput rail segments",2); 
		Job j3 = new Job("chek trains on rail station segments",1); 
		
		que.offer(j1); 
		que.offer(j2); 
		que.offer(j3); 
		*/
		jobs.add("professor");
		jobs.add("singer");
		jobs.add("actor");
		jobs.add("it guy");
		PriorityQueue que = new PriorityQueue(); 
		int i = (int)(Math.random()*10);
		System.out.println(i);
		while(que.size()<=20) {
			if(i<4) {
				que.offer(new Job(jobs.get(i), i));
				i = (int)(Math.random()*10);
			}
			i = (int)(Math.random()*10);
		}
		
		while(que.size()!=0){ 
			Job j = (Job)que.poll(); 
			j.execute(); 
		}

	}
}
