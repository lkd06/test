package com.math1;

import java.util.Scanner;

public class Num2839 {
	static public void main(String []args) {
		int min_count=-1;
		int N;
		Scanner sc = new Scanner(System.in);
		N = sc.nextInt();
		for(int i=0;i<=N/5;i++) {
			int n = N-5*i;
			if(n%3==0) {
				int count = i+n/3;
				if(min_count==-1 || min_count>count) min_count=count;
			}
		}
		System.out.println(min_count);
	}
}
