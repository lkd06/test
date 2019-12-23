package com.math1;

import java.util.Scanner;

public class Num2292 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int num=1;
		int count=1;
		while(N>7) {
			N-=6*count;
			count++;
		}
		if(N!=1) count++;
		System.out.println(count);
	}

}
