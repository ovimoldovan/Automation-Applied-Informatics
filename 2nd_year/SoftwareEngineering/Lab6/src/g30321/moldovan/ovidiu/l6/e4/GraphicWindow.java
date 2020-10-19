package g30321.moldovan.ovidiu.l6.e4;

public class GraphicWindow {
	private Shape[] shape = new Shape[15];
	
	//I am accessing the shapes based on a unique id
	
	static int shapeKey = 0;
	
	public void addPoint(){
		this.shape[shapeKey] = new Point();
		this.shape[shapeKey].draw();
		shapeKey++;
	}
	
	public void addCircle(){
		this.shape[shapeKey] = new Circle();
		this.shape[shapeKey].draw();
		shapeKey++;
	}
	
	public static void main(String[] args){
		GraphicWindow gw = new GraphicWindow();
		gw.addPoint();
		gw.addCircle();
	}
	
}
