package Ex1;

class Buffer{
	int b;
	synchronized public void put(int i) {
		this.b = i;
		notify();
		try {
			wait(50);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	synchronized int get(){
		try {
			wait(20);
			notify();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
}

class Firw extends Thread{
	Buffer b;
	Firw(Buffer b){
		this.b = b;
	}
	
	public void run(){
		for(int i=0;i<10;i++){
			b.put(i);
			System.out.println("w" + i);
		}
	}
}

class Firr extends Thread{
	Buffer b;
	Firr(Buffer b){
		this.b = b;
	}
	
	public void run(){
		for(int i=0;i<10;i++){
			//b.get();
			System.out.println("r" + b.get());
		}
	}
}


public class Main {
	public static void main(String[] args){
		Buffer b = new Buffer();
		Firw fw = new Firw(b);
		Firr fr = new Firr(b);
		fw.start();
		fr.start();
	}
}
