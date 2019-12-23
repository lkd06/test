package B.Math2;

import java.util.Scanner;
//mun 2581
public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int sosu[] = new int[10001];
		sosu[1]=1;
		for(int i=2;i<=10000;i++) {
			if(sosu[i]==0) {
				for(int j=i+i;j<=10000;j+=i) sosu[j]=1;
			}
		}
		
		int N = sc.nextInt(), M = sc.nextInt();
		int min=-1, sum =0;
		for(;M>=N;M--) {
			if(sosu[M]==0) {
				sum+=M;
				min=M;
			}
		}
		if(min==-1) System.out.println(-1);
		else {
			System.out.println(sum+"\n"+min);
		}
	}

}
