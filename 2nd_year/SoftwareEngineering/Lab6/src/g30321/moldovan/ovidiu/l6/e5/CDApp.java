package g30321.moldovan.ovidiu.l6.e5;

public class CDApp {
	
	

	public static void main(String[] args) {
		CDCatalog cdc = new CDCatalog();
		
		CD cd1 = new CD("Dragostea din tei","O-Zone");
		CD cd2 = new CD("Sub pielea mea","Carla's Dreams");
		CD cd3 = new CD("Numb","Linkin park");
		
		cdc.addCD(cd1);
		cdc.addCD(cd2);
		cdc.addCD(cd3);
		
		//Checking that everything was added correctly
		cdc.showList();
		
		cdc.removeCD(cd1);
		
		System.out.println(cd1.getTitle() + " by " + cd1.getArtist() + " was removed. New list:");
		
		cdc.showList();
		
		System.out.println("Number of songs:" + cdc.getSize());
		
		//Search if a song exists (it will be the same for searchByArtist or searchByTitle
		if(cdc.searchByArtist("Carla's Dreams") != null)
			System.out.println("Playing: " + cdc.searchByArtist("Carla's Dreams").getArtist() + cdc.searchByArtist("Carla's Dreams").getTitle());
		else System.out.println("Didn't find any song by " + "Carla's Dreams");
		
		if(cdc.searchByArtist("O-Zone") != null)
			System.out.println("Playing: " + cdc.searchByArtist("O-Zone").getArtist() + cdc.searchByArtist("O-Zone").getTitle());
		else System.out.println("Didn't find any song by " + "O-Zone");
		
		// Removing all
		
		cdc.removeAllCDs();
		
		cdc.showList();
		
	}

}
