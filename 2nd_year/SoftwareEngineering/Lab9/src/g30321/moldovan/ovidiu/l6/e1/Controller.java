package g30321.moldovan.ovidiu.l6.e1;

public class Controller extends CrossRoad{

	TrafficLight tNorth = new TrafficLight(north);
	TrafficLight tSouth = new TrafficLight(south);
	TrafficLight tWest = new TrafficLight(west);
	TrafficLight tEast = new TrafficLight(east);
	
	//Will make the cars go from NORTH and SOUTH simultaneously, then from EAST and WEST
	
	int seconds = 0;
	int changedSeconds = 5;
	
	
	boolean northAndSouth = false;
	boolean westAndEast = false;
	
	boolean isNorth = false;
	boolean isWest = false;
	
	boolean checkFiveSecondsNorth(){
		
		if(!isNorth){
			if(changedSeconds>=5)
				return true;
		}
			
		
		return false;
	}
	
boolean checkFiveSecondsWest(){
		
		if(!isWest){
			if(changedSeconds>=5)
				return true;
		}
			
		
		return false;
	}


void goCar(){
	if(isNorth == true){
	if(!tNorth.lane.cars.isEmpty()){
		tNorth.lane.cars.removeFirst();
		System.out.println("A car passes from the north lane");
	}
	if(!tSouth.lane.cars.isEmpty()){
		tSouth.lane.cars.removeFirst();
		System.out.println("A car passes from the south lane");
	}
	}
	if(isWest==true){
		if(!tEast.lane.cars.isEmpty()){
			tEast.lane.cars.removeFirst();
			System.out.println("A car passes from the east lane");
		}
		if(!tWest.lane.cars.isEmpty()){
			tWest.lane.cars.removeFirst();
			System.out.println("A car passes from the west lane");
		}
	}
}
	
	void goNorthAndSouth() throws InterruptedException{
		tNorth.setGreen();
		tSouth.setGreen();
		tWest.setRed();
		tEast.setRed();
		northAndSouth = true;
		isNorth = true;
		isWest = false;
	}
	void goEastAndWest() throws InterruptedException{
		tNorth.setRed();
		tSouth.setRed();
		tWest.setGreen();
		tEast.setGreen();
		westAndEast = true;
		isWest = true;
		isNorth = false;
	}
	
	void cycle() throws InterruptedException{
		while(seconds<100){
			changedSeconds++;
			
			//Run normally for the first 80 seconds
			if(seconds<80){
				if(tNorth.lane.cars.size() + tSouth.lane.cars.size() >= tEast.lane.cars.size() + tWest.lane.cars.size()){
					if(checkFiveSecondsNorth()){
						goNorthAndSouth(); changedSeconds = 0;
					}
				}
				else{
					if(checkFiveSecondsWest()){
						goEastAndWest(); changedSeconds = 0;
					}
				}
			}
			
			//After 80 seconds, check if every traffic light was on at last once
			else{
				if(northAndSouth==false){
					goNorthAndSouth();
				}
				else if(westAndEast==false){
					goEastAndWest();
				}
				else{
					if(tNorth.lane.cars.size() + tSouth.lane.cars.size() >= tEast.lane.cars.size() + tWest.lane.cars.size()){
						goNorthAndSouth();
					}
					else{
						goEastAndWest();
					}
				}
			}
			goCar();
			seconds++;
			Thread.sleep(1000);
		}
	}

}
