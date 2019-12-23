package B.Math2;

import java.util.Scanner;

public class Mun1085 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int x=sc.nextInt(),y=sc.nextInt();
		int w=sc.nextInt(),h=sc.nextInt();
		x = Math.min(x, w-x);
		y = Math.min(y, h-y);
		System.out.println(Math.min(x, y));
	}

}
