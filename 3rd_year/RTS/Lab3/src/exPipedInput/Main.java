package exPipedInput;

import java.io.PipedOutputStream;
import java.io.*;
public class Main{
	public static void main(String args[])	{
		FirCititor fc = new FirCititor();
		FirScriitor fs = new FirScriitor();
		try{
			fc.conect(fs.getPipe());
			fc.start();fs.start();			
		}catch(Exception e){e.printStackTrace();}
	}
}
class FirScriitor extends Thread{
	private PipedOutputStream po;
	FirScriitor(){
		po = new PipedOutputStream();
	}
	public void run(){
		try{
			while (true){
				int d = (int)(10*Math.random());
				System.out.println("Fir scriitor trimite : "+d);
				po.write(d);
				sleep(400);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	PipedOutputStream getPipe(){return po;}
}

class FirCititor extends Thread{
	private PipedInputStream pi;
	FirCititor(){
		pi = new PipedInputStream();
	}
	public void run(){
		try{
			while (true){
				if (pi.available()>0)
				{System.out.println("Fir cititor a primit : "+pi.read());}
			}
		}catch(Exception e){}
	}
	void conect(PipedOutputStream os)throws Exception{
		pi.connect(os);
	}
}
