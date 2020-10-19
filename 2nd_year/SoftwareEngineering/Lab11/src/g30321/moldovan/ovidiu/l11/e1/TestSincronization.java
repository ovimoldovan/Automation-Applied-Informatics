package g30321.moldovan.ovidiu.l11.e1;

public class TestSincronization {
public static void main(String[] args) {
    Point p = new Point();
    ThreadSet fs1 = new ThreadSet(p);
    ThreadGet fg1 = new ThreadGet(p);

    fs1.start();
    fg1.start();
}
}

class ThreadGet extends Thread {
    Point p;

    public ThreadGet(Point p){
        this.p = p;
    }

    public void run(){
        int i=0;
        int a,b;
        while(++i<15){         
           // synchronized(p){
            a= p.getX();          
            try {
                sleep(50);
            } catch (InterruptedException e) {  
                e.printStackTrace();
            }         
            b = p.getY();
           // }
            System.out.println("I have read: ["+a+","+b+"]");
        }
    }
}//.class


class ThreadSet extends Thread {
    Point p;
    public ThreadSet(Point p){
        this.p = p;
    } 
    public void run(){
        int i =0;
        while(++i<15){
            int a = (int)Math.round(10*Math.random()+10);
            int b = (int)Math.round(10*Math.random()+10);

            //synchronized(p){
            p.setXY(a,b);
            // }

            try {
                sleep(10);
            } catch (InterruptedException e) {

                e.printStackTrace();
            }
            System.out.println("I have written: ["+a+","+b+"]");
        }
    }
}//.class

class Point {
    int x,y;
    public void setXY(int a,int b){
        x = a;y = b;
    }  
    public int getX(){return x;}
    public int getY(){return y;}   
}
