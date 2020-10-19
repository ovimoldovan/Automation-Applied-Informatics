package g30321.moldovan.ovidiu.l7.e5;

public class Job implements Comparable {
	int p; 
	String name; 
	public Job(String name,int p) {
		this.p = p; this.name = name; 
	} 
	public void execute(){ 
		System.out.println("Execute job:"+name+" - job p="+p); 
	} 
	public int compareTo(Object o) { 
		Job x = (Job)o; if(p>x.p){
			return 1; 
		}
		else if(p==x.p) return 0; 
		else return -1; 
	}
}
