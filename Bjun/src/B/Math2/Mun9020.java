package B.Math2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Mun9020 {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		int num[] = new int[10001];
		for(int i=2;i<10001;i++) {
			if(num[i]==0) {
				for(int j=i+i;j<10001;j+=i) num[j]=1;
			}
		}
		int T = Integer.parseInt(br.readLine());
		int n;
		int minN=0,maxN=0;
		while(T>0) {
			n = Integer.parseInt(br.readLine());
			for(int i=2;i<=n/2;i++) {
				if(num[i]==0 && num[n-i]==0) {
					minN=i;maxN=n-i;
				}
			}
			bw.write(minN+" "+maxN+"\n");
			bw.flush();
			T--;
		}
	}

}
