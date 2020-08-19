package test;

import java.util.Map;

import com.google.gson.Gson;

public class Test {
	private static Gson g =new Gson();
	public static void main(String[] args) {
		long sTime = System.currentTimeMillis();
		StringBuffer sb = new StringBuffer();
		for(int i=1;i<=10000;i++) {
			sb.append("글자" + i);
		}
		System.out.println(sb.toString());
		long eTime = System.currentTimeMillis();
		System.out.println("execute time : " + (eTime-sTime));
	}
}



