package g30321.moldovan.ovidiu.l6.e7;

public class MP3Player extends ElectronicDevice implements PlayAudio {

	public String deviceType = PlayAudio.deviceType;
	public void start(){
		System.out.println(this.deviceType + " started");
	}
	public void stop(){
		System.out.println(this.deviceType + " stopped");
	}
}
