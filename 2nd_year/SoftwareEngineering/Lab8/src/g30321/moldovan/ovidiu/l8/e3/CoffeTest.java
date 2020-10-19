package g30321.moldovan.ovidiu.l8.e3;

public class CoffeTest {
    public static void main(String[] args) throws SizeException {
          CofeeMaker mk = new CofeeMaker();
          CofeeDrinker d = new CofeeDrinker();
          for(int i = 0;i<15;i++){
                Cofee c = mk.makeCofee();
                try {
                      d.drinkCofee(c);
                } catch (TemperatureException e) {
                      System.out.println("Exception:"+e.getMessage()+" temp="+e.getTemp());
                } catch (ConcentrationException e) {
                      System.out.println("Exception:"+e.getMessage()+" conc="+e.getConc());
                }
                finally{
                      System.out.println("Throw the cofee cup.\n");
                }
          }    
    }

}//.class

class CofeeMaker  {
    Cofee makeCofee() throws SizeException{
    	
          System.out.println("Make a coffe");
          int t = (int)(Math.random()*100);
          int c = (int)(Math.random()*100);
          int s = (int)(Math.random()*100); //random number for stopping
          if(s > 50) throw new SizeException(s, "Too many coffees");
          Cofee cofee = new Cofee(t,c);
         
          return cofee;
         
    	
    }

}//.class

class Cofee{
    private int temp;
    private int conc;

    Cofee(int t,int c){temp = t;conc = c;}
    int getTemp(){return temp;}
    int getConc(){return conc;}
    public String toString(){return "[cofee temperature="+temp+":concentration="+conc+"]";}
}//.class

class CofeeDrinker{
    void drinkCofee(Cofee c) throws TemperatureException, ConcentrationException{
          if(c.getTemp()>60)
                throw new TemperatureException(c.getTemp(),"Cofee is to hot!");
          if(c.getConc()>50)
                throw new ConcentrationException(c.getConc(),"Cofee concentration to high!");         
          System.out.println("Drink cofee:"+c);
    }

}//.class

class TemperatureException extends Exception{
    int t;
    public TemperatureException(int t,String msg) {
          super(msg);
          this.t = t;
    }

    int getTemp(){
          return t;
    }
}//.class

class ConcentrationException extends Exception{
    int c;
    public ConcentrationException(int c,String msg) {
          super(msg);
          this.c = c;
    }

    int getConc(){
          return c;
    }
}//.class

class SizeException extends Exception{
	int s;
	public SizeException(int s, String msg){
		super(msg);
		this.s = s;
	}
	int getSize(){
		return s;
	}
}
