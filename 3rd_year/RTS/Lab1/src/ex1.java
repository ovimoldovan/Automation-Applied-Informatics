class ComplexNr {
		int re; int im;
		ComplexNr(int re, int im){
			this.re = re;
			this.im = im;
		}
	}
public class ex1 {
	static void add(ComplexNr a, ComplexNr b){
		int sum1 = a.im + b.im;
		int sum2 = a.re + b.re;
		System.out.println(sum2 + " + i * " + sum1);
	}
	public static void main(String[] args){
		ComplexNr a = new ComplexNr(2,5);
		ComplexNr b = new ComplexNr(4,-1);
		add(a,b);
	}
}
