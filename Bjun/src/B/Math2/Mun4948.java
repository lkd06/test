package B.Math2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Mun4948 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int num[] = new int[123456*2+1];
		num[1]=1;
		for(int i=2;i<123456*2+1;i++) {
			if(num[i]==0) {
				for(int j=i+i;j<123456*2+1;j+=i) num[j]=1;
			}
		}
		int n,count;
		while(true) {
			count=0;
			n = Integer.parseInt(br.readLine());
			if(n==0) break;
			for(int i=n+1;i<=2*n && i<123456*2+1;i++) {
				if(num[i]==0) count++;
			}
			bw.write(count+"\n");
			bw.flush();
		}
		bw.close();
	}

}
