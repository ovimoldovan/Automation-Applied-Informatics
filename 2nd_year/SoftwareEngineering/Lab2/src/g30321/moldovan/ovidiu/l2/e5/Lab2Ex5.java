package g30321.moldovan.ovidiu.l2.e5;

import java.util.Scanner;

public class Lab2Ex5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.println("1. +\n2. -\n3. *\n4. /");
		int x = s.nextInt();
		int a,b;
		
		switch(x){
		case 1: 
			a = s.nextInt();
			b = s.nextInt();
			System.out.println(a+b);
			break;
		case 2:
			a = s.nextInt();
			b = s.nextInt();
			System.out.println(a-b);
			break;
		case 3:
			a = s.nextInt();
			b = s.nextInt();
			System.out.println(a*b);
			break;
		case 4:
			a = s.nextInt();
			b = s.nextInt();
			System.out.println(a/b);
			break;
		}
	}

}
