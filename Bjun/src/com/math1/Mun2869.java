package com.math1;

import java.util.Scanner;

public class Mun2869 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int A = sc.nextInt();
		int B = sc.nextInt();
		int V = sc.nextInt();
		int count=1;
		if(V>A) { 
			B=A-B;
			count += (int) Math.ceil((V-A)/B);
		}
		System.out.println(count);
	}

}
