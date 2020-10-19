package g30321.moldovan.ovidiu.l6.e5;

import java.util.ArrayList;

public class CDCatalog {
	ArrayList<CD> cds= new ArrayList<CD>();
	int cdNumber = 0;
	
	void addCD(CD cd){
		cds.add(cd);
	}
	
	void removeCD(CD cd){
		cds.remove(cd);
	}
	
	CD searchByTitle(String title){
		CD aux;
		for(int i = 0; i < cds.size();i++){
			if(this.cds.get(i).getTitle() == title){
				aux = cds.get(i);
				return aux;
			}
		}
		return null;
	}
	
	CD searchByArtist(String name){
		CD aux;
		for(int i = 0; i < cds.size();i++){
			if(this.cds.get(i).artist.getName() == name){
				aux = cds.get(i);
				return aux;
			}
		}
		return null;
	}
	
	void removeAllCDs(){
		cds.clear();
	}
	
	CD getByIndex(int index){
		if(cds.get(index) != null){
			return cds.get(index);
		}
		else return null;
	}
	
	int getSize(){
		return cds.size();
	}
	
	//I've added a method to print the list
	void showList(){
		for(int i = 0; i < this.cds.size();i++){
			System.out.println(i+". "+this.cds.get(i).getArtist() + " - " + this.cds.get(i).getTitle());
		}
		if(this.cds.size() == 0) System.out.println("There are no CDs");
	}
	
}
