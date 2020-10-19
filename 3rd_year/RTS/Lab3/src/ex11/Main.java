package ex11;



public class Main {	
	private static boolean stopThreads = false;
	
	public static void main(String[] args){
		FileService service = new FileService("src/ex11/messages.txt");
		RThread reader = new RThread(service);
		WThread writer = new WThread(service);
		
		reader.start();
		writer.start();
	}
	
	public static boolean isStopThreads(){
		return stopThreads;
	}
}