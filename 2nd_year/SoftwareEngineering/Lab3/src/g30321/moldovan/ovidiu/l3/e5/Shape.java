package g30321.moldovan.ovidiu.l3.e5;

public class Shape {

	public static void main(String[] args) {
		// Creating a circle
		Point c1 = new Point(1,1);
		int r1 = 3;
		Circle circle1 = new Circle(c1, r1);
		circle1.getCircle();
		
		// Creating a rectangle
		
		Point p1 = new Point(1,1);
		Point p2 = new Point(4,4);
		Rectangle rectangle1 = new Rectangle(p1, p2);
		System.out.println("Rectangle[width = " + rectangle1.getWidth() + ", length = " + rectangle1.getLength());
		
	}

}
