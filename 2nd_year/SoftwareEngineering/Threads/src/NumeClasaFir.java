
public class NumeClasaFir extends Thread {
	boolean loop = true;
	Thread firNou;
	
	public NumeClasaFir() {
		
	}
	
	public void start() {
		if (firNou == null) {
			firNou = new Thread(this);
			firNou.start();
		}
	}
	
/*	public void stop() {
		if (this!= null)
			this.stop();
		//loop = false;
	}*/
	
	public void run() {
		while(loop) {
			
		}
	}

	public static void main(String[] args) {

	}

}
