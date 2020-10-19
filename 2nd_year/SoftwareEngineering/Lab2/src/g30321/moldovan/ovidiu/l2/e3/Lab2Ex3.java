package g30321.moldovan.ovidiu.l2.e3;

import java.util.Random;

public class Lab2Ex3 {
	public static void main(String[] args){
		int aux;
		
		Random r = new Random();
		int[] a = new int[10];
		for (int i=0;i<a.length;i++){
		            a[i] = r.nextInt(100);
		 }
		
		for(int i = 0; i <= a.length-1; i++)
			for(int j = i+1; j< a.length; j++){
				if(a[i]>a[j]){
				aux = a[i];
				a[i] = a[j];
				a[j] = aux;
				}
			}
		
		for(int i=0;i<a.length;i++){ 
			System.out.print("a["+i+"]="+a[i]+" ");
		}
		
	}
}
