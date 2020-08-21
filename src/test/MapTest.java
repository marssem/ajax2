package test;

import java.util.Hashtable;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MapTest {
	public static void main(String[] agrs) {
		
		Map<String,String> map = new ConcurrentHashMap<>();
		map.put("이름", "동동");
		map.put("나이", "6");
		System.out.println(map);
	}
}
