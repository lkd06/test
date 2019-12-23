package com.math1;

import java.util.Scanner;
//아오 어려워
public class Mun1011 {
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		long x ,y;
		
		while(n>0) {
			x = sc.nextLong();
			y = sc.nextLong();
			y-=x;
			int count=0,i=1;
			long dis=1;
			if(y!=1) {
				while(true) {
					count++;
					dis+=i;
					if(y<=dis) break;
					
					count++;
					i++;
					dis+=i;
					if(y<=dis) break;
				}
			}
			System.out.println(++count);
			n--;
		}
		
	}

}
