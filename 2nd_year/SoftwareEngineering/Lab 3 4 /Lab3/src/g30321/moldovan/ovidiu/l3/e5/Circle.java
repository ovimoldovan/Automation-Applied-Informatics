package g30321.moldovan.ovidiu.l3.e5;

public class Circle {
	Point center = new Point();
	int radius;
	
	Circle(Point c, int r){
		this.center = c;
		this.radius = r;
	}
	void getCircle(){
		System.out.println("Circle of center (" + center.getX() +", " +center.getY()  + ") and radius " + radius);
	}
	
}
