package g30321.moldovan.ovidiu.l7.e1;

import java.util.ArrayList;

class Bird {
public void move(){
	System.out.println("The bird is moving.");
	}
}

class Penguin extends Bird{
    public void move(){
    	System.out.println("The PENGUIN is swiming.");
    }
}

class Goose extends Bird{
    public void move(){
    	System.out.println("The GOOSE is flying.");
    }
}

class Chicken extends Bird{
	public void move(){
		System.out.println("The CHICKEN is moving.");
	}
}

public class BirdController{
	/*
    Bird[] birds = new Bird[3];
    
                birds[0] = createBird();
                birds[1] = createBird();
                birds[2] = createBird();
                
                */
	
	ArrayList<Bird> birds = new ArrayList<Bird>();
	BirdController(){
	
	
	birds.add(createBird());
	birds.add(createBird());
	birds.add(createBird());
    }
    public void relocateBirds(){
                for(int i=0;i<birds.size();i++)
                            birds.get(i).move();
    }
    private Bird createBird(){
                int i = (int)(Math.random()*10);
                if(i<3) return new Penguin();
                else if(i<6) return new Chicken();
                	else return new Goose();
                }
    
    public static void main(String [] args){
        BirdController bc = new BirdController();
        bc.relocateBirds();
    }
}