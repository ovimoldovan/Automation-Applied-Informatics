package g30321.moldovan.ovidiu.l6.e7;

public class DVDPlayer extends ElectronicDevice implements PlayAudio, PlayVideo{
	String deviceType = PlayVideo.deviceType;
	public void start(){
		System.out.println(deviceType + " started");
	}
	public void stop(){
		System.out.println(this.deviceType + " stopped");
	}
}
