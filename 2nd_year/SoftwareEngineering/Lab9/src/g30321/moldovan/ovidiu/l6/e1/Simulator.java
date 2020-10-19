package g30321.moldovan.ovidiu.l6.e1;

public class Simulator extends Controller {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		Controller c = new Controller();
		
		System.out.println(c.north.cars.size());
		System.out.println(c.south.cars.size());
		System.out.println(c.east.cars.size());
		System.out.println(c.west.cars.size());
		
		c.cycle();
	}

}
