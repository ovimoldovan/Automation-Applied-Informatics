package g30321.moldovan.ovidiu.l3.e5;

public class Rectangle {
	Point p1 = new Point();
	Point p2 = new Point();
	int width, length;
	
	Rectangle(Point p1, Point p2){
		this.p1 = p1;
		this.p2 = p2;
	}
	
	int getWidth(){
		this.width = (p1.getY() - p2.getY());
		return Math.abs(this.width);
	}
	
	int getLength(){
		this.length = (p1.getX() - p2.getY());
		return Math.abs(this.length);
	}
	
}
