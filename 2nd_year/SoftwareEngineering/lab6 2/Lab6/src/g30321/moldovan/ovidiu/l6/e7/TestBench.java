package g30321.moldovan.ovidiu.l6.e7;

public class TestBench {
	
	//ElectronicDevice[] e = new ElectronicDevice[2];
	
	MP3Player a = new MP3Player();
	DVDPlayer v = new DVDPlayer();
	
	public void testAudio(PlayAudio a){
		System.out.println(a.deviceType);
	}
	
	public void testVideo(PlayVideo v){
		System.out.println(v.deviceType);
	}
	
	public void testStart(ElectronicDevice e){
		e.start();
	}

	void testStop(ElectronicDevice e){
		e.stop();
	}
	
	public static void main(String[] args) {
		TestBench t = new TestBench();
		t.testStart(t.a);
		t.testStop(t.a);
		t.testAudio(t.a);
		t.testVideo(t.v);
	}

}
