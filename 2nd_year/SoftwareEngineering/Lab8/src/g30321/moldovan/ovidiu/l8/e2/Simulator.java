package g30321.moldovan.ovidiu.l8.e2;

import java.util.ArrayList;

public class Simulator {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		// build station Cluj-Napoca 
		Controller c1 =  new Controller ( "Cluj-Napoca" ) ;
		
		Controller c3 = new Controller("Dej");


		Segment s1 = new Segment(1);
		Segment s2 = new Segment(2);
		Segment s3 = new Segment(3);

		c1. addControlledSegment ( s1 ) ; 
		c1. addControlledSegment ( s2 ) ; 
		c1. addControlledSegment ( s3 ) ;

		// build station Bucharest 
		Controller c2 =  new Controller ( "Bucharest" ) ;

		Segment s4 = new Segment(4);
		Segment s5 = new Segment(5);
		Segment s6 = new Segment(6);



		c2. addControlledSegment ( s4 ) ; 
		c2. addControlledSegment ( s5 ) ; 
		c2. addControlledSegment ( s6 ) ;
		
		c3. addControlledSegment(s4);

		//connect the 2 controllers

		c1.setNeighbourController(c2);
		c2.setNeighbourController(c1);
		
		c1.setNeighbourController(c3);

		//testing

		Train t1 = new Train("Bucuresti", "IC-001");
		s1.arriveTrain(t1);

		Train t2 = new Train("Cluj-Napoca","R-002");
		s5.arriveTrain(t2);


		c1.displayStationState();
		c2.displayStationState();
		c3.displayStationState();

		System.out.println("\nStart train control\n");

                //execute 3 times controller steps
		for(int i = 0;i<3;i++){
			System.out.println("### Step "+i+" ###");
			c1.controlStep();
			c2.controlStep();
			c3.controlStep();

			System.out.println();



			c1.displayStationState();
			c2.displayStationState();
			c3.displayStationState();
		}		
	}

}

class Controller{

	String stationName;
	//Controller neighbourController;
	ArrayList<Controller> neighbourControllers = new ArrayList<Controller>();

	//storing station train track segments
	ArrayList<Segment> list = new ArrayList<Segment>(); 

	public Controller(String station) {
		stationName = station;
	}

	void setNeighbourController(Controller v){
		neighbourControllers.add(v);
	}

	void addControlledSegment(Segment s){
		list.add(s);
	}

	/**
         * Check controlled segments and return the id of the first free segment or -1 in case there is no free segment in this station
         * 
	 * @return
	 */

	int getFreeSegmentId(){
		for(Segment s:list){
			if(s.hasTrain()==false)
				return s.id;
		}
		return -1;
	}

	void controlStep(){
		int pos = 0; boolean ok = false;

			//check which train must be sent

			for(Segment segment:list){
				if(segment.hasTrain()){
					Train t = segment.getTrain();

					//if(t.getDestination().equals(neighbourControllers.contains(stationName))){
					
					for(int i = 0; i< neighbourControllers.size();i++){
						if(t.getDestination().equals(neighbourControllers.get(i))) {
							pos = i;
							ok = true;
							break;
						}
					}
					if(ok == true){
						//check if there is a free segment
						
						int id = neighbourControllers.get(pos).getFreeSegmentId();
						if(id==-1){
							System.out.println("Train +"+t.name+"in station "+stationName+" can not be sent to "+neighbourControllers.get(pos).stationName+". No segment available!");
							return;
						}

						//send train
						System.out.println("Train "+t.name+" Left from station "+stationName +" towards station "+neighbourControllers.get(pos).stationName);
						segment.departTRain();
						neighbourControllers.get(pos).arriveTrain(t,id);
					}
				}
			}//.for
		}//.



	public void arriveTrain(Train t, int idSegment){
		for(Segment segment:list){
			//search id segment and add train on it
			if(segment.id == idSegment)
				if(segment.hasTrain()==true){
					System.out.println("CRASH! Train "+t.name+" colided with "+segment.getTrain().name+" on segment "+segment.id+" in station "+stationName);
					return;
				}else{
					System.out.println("Train "+t.name+" arrived on segment "+segment.id+" in station "+stationName);
					segment.arriveTrain(t);

					return;
				}			
		}

		//this should not happen
		System.out.println("Train "+t.name+" cannot be received "+stationName+". Check controller logic algorithm!");
	}

	public void displayStationState(){
		System.out.println("=== STATION "+stationName+" ===");
		for(Segment s:list){
			if(s.hasTrain())
				System.out.println("|----------ID="+s.id+"__Train="+s.getTrain().name+" to "+s.getTrain().destination+"__----------|");
			else
				System.out.println("|----------ID="+s.id+"__Train=______ twords ________----------|");

		}
	}
}


class Segment{
	int id;
	Train train;

	Segment(int id){
		this.id = id;
	}



	boolean hasTrain(){
		return train!=null;
	}

	Train departTRain(){
		Train tmp = train;
		this.train = null;
		return tmp;
	}




	void arriveTrain(Train t){
		train = t;
	}

	Train getTrain(){
		return train;
	}
}

class Train{
	String destination;
	String name;
	public Train ( String destination, String name )  { 
		super ( ) ; 
		this . destination  = destination ; 
		this . name  = name ; 
	}

	String getDestination(){
		return destination;
	}
}

