package g30321.moldovan.ovidiu.l3.e3;

public class Flower{
    int petal;
    static int number = 0;
    Flower(){
    	System.out.println("Flower has been created!");
    	number++;
    }
public static void main(String[] args) { 
	Flower[] garden = new Flower[5];
	for(int i =0;i<5;i++){
         Flower f = new Flower();
         garden[i] = f;
		} 
	System.out.println(Flower.number);
	}
}