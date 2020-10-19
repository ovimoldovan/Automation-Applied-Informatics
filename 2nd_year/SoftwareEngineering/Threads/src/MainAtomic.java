
public class MainAtomic {
	public static void main(String[] args) {
		ResursaAtomica res = new ResursaAtomica(1, 2);
		res.update(3, 4);
		System.out.println(res);
	}
}

class ResursaAtomica {
	private int a, b;

	public ResursaAtomica(int i, int j) {
		a = i;
		b = j;
	}

	public synchronized void update(int da, int db) {
		a = a + da;
		b = b + db;
	}

	public synchronized void get(int[] t) {
		t[0] = a;
		t[1] = b;
	}
	
	public String toString() {
		return a + "," + b;
	}
}