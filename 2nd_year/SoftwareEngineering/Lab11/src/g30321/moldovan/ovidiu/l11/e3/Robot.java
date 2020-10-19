package g30321.moldovan.ovidiu.l11.e3;

import java.util.Random;

public class Robot  extends Thread{

	int id;
	int posX, posY;
	
	Robot(int id, int X, int Y){
		this.id = id;
		this.posX = X;
		this.posY = Y;
	}
	
	void move(){
		Random rand = new Random();
		int move = rand.nextInt(4);
		
		switch(move){
		case 0: posY += 1; break;
		case 1: posY -= 1; break;
		case 2: posX += 1; break;
		case 3: posX -= 1; break;
		}
		
		if(posX>300){
			posX = 300;
			System.out.println(this.id + " has reached the X border");
		}
		if(posX<0) {
			posX = 0;
			System.out.println(this.id + " has reached the X border");
		}
		
		if(posY>300){
			posY = 300;
			System.out.println(this.id + " has reached the Y border");
		}
		
		if(posY<0){
			posY = 0;
			System.out.println(this.id + " has reached the Y border");
		}
		
		//System.out.println(move);
	}
	
	public void run(){
		try{
			while(true){
				move();
				System.out.println(this.id + "[" + posX + "]" + " [ " + posY + "]");
				Thread.sleep(100);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args){
		Robot r1 = new Robot(1, 0, 0);
		Robot r2 = new Robot(2,299, 10);
		Robot r3 = new Robot(3, 10, 10);
		Robot r4 = new Robot(4, 10, 299);
		r1.start();
		r2.start();
		r3.start();
		r4.start();
	}
}
