package g30321.moldovan.ovidiu.l6.e5;

public class CD {
	private String title;
	Artist artist = new Artist();
	
	// I have added a constructor in order to create CDs and add them to the catalog
	CD(String title, String artistName){
		this.title = title;
		artist.setName(artistName);
	}
	
	public String getArtist(){
		return artist.getName();
	}
	
	public String getTitle(){
		return this.title;
	}
}

class Artist{
	private String name;
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return this.name;
	}
}
