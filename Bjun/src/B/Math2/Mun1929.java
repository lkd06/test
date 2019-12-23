package B.Math2;

import java.util.Scanner;

public class Mun1929 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int M = sc.nextInt(), N = sc.nextInt();
		int num[] = new int[1000001];
		num[1]=1;
		for(int i=2;i<1000001;i++) {
			if(num[i]==0) {
				for(int j=i+i;j<1000001;j+=i) num[j]=1;
			}
		}
		for(;M<=N;M++) {
			if(num[M]==0) System.out.println(M);
		}
	}

}
