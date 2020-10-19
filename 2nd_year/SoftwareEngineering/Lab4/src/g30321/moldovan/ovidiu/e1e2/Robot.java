package g30321.moldovan.ovidiu.e1e2;

public class Robot {
	Engine robotEngine;
	//Declaring robot's position
	int currentX = 0;
	int currentY = 0;
	
	//robot's object position
	
	int objectX = 0;
	int objectY = 0;
	
	public Robot(){
		robotEngine = new Engine();
	}
	//move method, exercise 1
	public void moveRobot(int x, int y){
		robotEngine.step(x, y);
		this.currentX = x;
		this.currentY = y;
	}
	
	//move with object, exercise 2
	public void checkObject(int x, int y){
		robotEngine.step(x, y);
		if(this.currentX == this.objectX && this.currentY == this.objectY){
			moveRobotWithObject(x, y);
		}
		else{
			getObject(x,y);
		}	
	}
	
	public void getObject(int x, int y){
		this.currentX = this.objectX;
		this.currentY = this.objectY;
		System.out.println("Got the object");
		moveRobotWithObject(x,y);
	}
	
	public void moveRobotWithObject(int x, int y){
		this.currentX = x;
		this.currentY = y;
		this.objectX = x;
		this.objectY = y;
		System.out.println("The robot moved the object");
	}
	public void getPosition(){
		System.out.println("The robot is at " + this.currentX + " " + this.currentY
				+ "\nIts object is at " + this.objectX + " "+ this.objectY);
		
	}
}




class Engine {
	void step(int x, int y) {
		start();
		checkDirection(x,y);
		execute(x,y);
		stop();
	}
	private void start(){
		System.out.println("Start engine.");            
	}
	private void stop(){
		System.out.println("Stop engine.");
	}
	private void checkDirection(int x, int y){
		if(x<0) System.out.println("Moving to the left.");
		else if(x>0) System.out.println("Moving to the right.");
		if(y>0) System.out.println("Moving up");
		if(y<0) System.out.println("Moving down");
	}
	private void execute(int x, int y){
		System.out.println("Moving "+ Math.abs(x) +" steps on x and " +Math.abs(y)+" steps on y.");

	}
}