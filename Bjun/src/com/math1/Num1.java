package com.math1;

import java.util.Scanner;

public class Num1 {

	public static void main(String []args) {
		int A,B,C;
		Scanner sc = new Scanner(System.in);
		A = sc.nextInt();
		B = sc.nextInt();
		C = sc.nextInt();
		int x = C-B;
		if(x<=0) {
			System.out.println("-1");
			return;
		}
		System.out.println(A/x+1);
		
	}
	
}
