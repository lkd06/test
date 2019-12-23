package B.Math2;

import java.util.Arrays;
import java.util.Scanner;

public class Mun4153 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		long num[]=new long[3];
		while(true) {
			num[0]=sc.nextLong();
			num[1]=sc.nextLong();
			num[2]=sc.nextLong();
			Arrays.sort(num);
			if(num[2]==0) break;
			if(num[2]*num[2] == num[0]*num[0] + num[1]*num[1])
				System.out.println("right");
			else System.out.println("wrong");
		}
	}

}
