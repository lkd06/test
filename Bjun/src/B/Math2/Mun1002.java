package B.Math2;

import java.util.Scanner;

public class Mun1002 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int T = sc.nextInt();
		int x1,x2,y1,y2,r1,r2,r;
		double dis;
		while(T>0) {
			x1 = sc.nextInt();
			y1 = sc.nextInt();
			r1 = sc.nextInt();
			
			x2 = sc.nextInt();
			y2 = sc.nextInt();
			r2 = sc.nextInt();
	
			r = r1+r2;
			dis = Math.sqrt(Math.pow(x1-x2, 2) + Math.pow(y1-y2, 2));
			if(dis == r) System.out.println(1);
			else if(dis>r) System.out.println(0);
			else if(x1==x2 && y1 == y2) {
				if(r2==r1) System.out.println(-1);
				else System.out.println(0);
			}else {
				if(dis>r1 && dis>r2) System.out.println(2);
				else {
					if(r1>r2) {
						if(dis+r2>r1) System.out.println(2);
						else if(dis+r2==r1) System.out.println(1);
						else System.out.println(0);
					}else {
						if(dis+r1>r2) System.out.println(2);
						else if(dis+r1==r2) System.out.println(1);
						else System.out.println(0);
					}
				}
			}
			
			T--;
		}
	}

}
