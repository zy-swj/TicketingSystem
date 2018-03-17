package cn.helper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HttpsURLConnection;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetTicketJson {
	/*
	 * info.get(3);// 车次信息
	 *  info.get(6); // 出发地 
	 *  info.get(7);// 目的地 
	 *  info.get(8);// 出发时间 
	 *  info.get(9); // 到达时间 
	 *  info.get(10);// 历时 
	 *  info.get(11); // Y
	 * info.get(21); // 高级软卧 
	 * info.get(23); // 软卧 
	 * info.get(26); // 无座
	 * info.get(28); // 硬卧 
	 * info.get(29); // 硬座 
	 * info.get(30); // 二等座
	 * info.get(31);// 一等座
	 *  info.get(32); // 商务，特等座
	 */

	// 获得余票信息
	public static List<String> getTicketInfo_12306(String train_date,String from_station, String to_station, String purpose_codes) {
		List<String> list2 =new ArrayList<String>();
		List<String> jsonLists = new ArrayList<String>();
		try {
			passSSL();// 绕过12306证书
			String jsonFrom12036 = catchJson(train_date, from_station,
					to_station, purpose_codes);
			JSONObject jsonob = JSONObject.fromObject(jsonFrom12036);
			// Pattern p = Pattern.compile("(^[^\\|]).*");
			JSONArray jsonar = jsonob.getJSONObject("data").getJSONArray("result");
			JSONObject jsonmap = jsonob.getJSONObject("data").getJSONObject("map");
			/*System.out.println(jsonmap.get("AOH"));*/
			Pattern p = Pattern.compile("(^[^\\|]).*");
			for (Object object : jsonar) {
				Matcher m = p.matcher(object.toString());
				if (m.find()) {
					jsonLists.add(m.group(0));
				}
			}

			for(int i = 0;i< jsonLists.size();i ++){
		    	String temp = jsonLists.get(i).toString();
				String infoo[] = temp.split("\\|");
				List<String> info= new ArrayList<String>();
		    	for(String str:infoo){
		    		info.add(str);
		    	}
		    	List<String> list1 = new ArrayList<String>();
		    	list1.add(info.get(3));
		    	list1.add((String) jsonmap.get(info.get(6)));
		    	list1.add((String) jsonmap.get(info.get(7)));
		    	list1.add(info.get(8));
		    	list1.add(info.get(9));
		    	list1.add(info.get(10));
		    	list1.add(info.get(21));		    	
		    	list1.add(info.get(23));
		    	list1.add(info.get(26));
				list1.add(info.get(28));
				list1.add(info.get(29));
				list1.add(info.get(30));
				list1.add(info.get(31));
				list1.add(info.get(32));
				
				list2.add(list1.toString());
			}
			}catch (Exception e) {
				System.out.println(list2);
			     System.out.println("系统繁忙！！！");
		}
		return list2;
	}

	// https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=2018-01-22&leftTicketDTO.from_station=NJH&leftTicketDTO.to_station=HZH&purpose_codes=ADULT
	public static String catchJson(String train_date, String from_station,
			String to_station, String purpose_codes) throws Exception {
		// 链接url
		String urlStr = "https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date="
				+ train_date
				+ "&leftTicketDTO.from_station="
				+ from_station
				+ "&leftTicketDTO.to_station="
				+ to_station
				+ "&purpose_codes="
				+ purpose_codes;
		URL url = new URL(urlStr);
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();

		InputStreamReader input = new InputStreamReader(con.getInputStream(),
				"utf-8");
		BufferedReader bfreader = new BufferedReader(input);

		StringBuffer sb = new StringBuffer();
		String line = "";

		while ((line = bfreader.readLine()) != null) {
			sb.append(line);
		}
		return sb.toString();
	}

	// 获得车站名字
	public static Map<String, String> getName() {
		Map<String, String> map = new HashMap<String, String>();
		try {
			passSSL();// 绕过12306证书
			String sname = getNameCode();
			String[] ssname = sname.split("\\@");
			Pattern p = Pattern.compile("[^\\@].*\\|.*");
			List<String> jsonLists = new ArrayList<String>();
			for (Object object : ssname) {
				Matcher m = p.matcher(object.toString());
				if (m.find()) {
					jsonLists.add(m.group(0));
				}
			}
			for (int i = 0; i < jsonLists.size(); i++) {
				String temp = jsonLists.get(i).toString();
				String infoo[] = temp.split("\\|");
				List<String> info;
				info = new ArrayList<String>();
				for (Object object : infoo) {
					info.add(object.toString());
				}
				map.put(info.get(1), info.get(2));

			}
		} catch (Exception e) {
			System.out.println("系统繁忙！！！");
		}
		return map;
	}

	// name_sation
	// url:https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9030
	public static String getNameCode() throws Exception {

		String urlStr = "https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9030";
		URL url = new URL(urlStr);
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();

		InputStreamReader input = new InputStreamReader(con.getInputStream(),
				"utf-8");
		BufferedReader bfreader = new BufferedReader(input);

		StringBuffer sb = new StringBuffer();
		String line = "";

		while ((line = bfreader.readLine()) != null) {
			sb.append(line);

		}
		return sb.toString();

	}

	// 绕过烦人的安全证书
	public static void passSSL() throws Exception {
		javax.net.ssl.TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[1];
		javax.net.ssl.TrustManager passSSL = new BypassSSL();
		trustAllCerts[0] = passSSL;
		javax.net.ssl.SSLContext sc = javax.net.ssl.SSLContext
				.getInstance("SSL");
		sc.init(null, trustAllCerts, null);
		HttpsURLConnection.setDefaultSSLSocketFactory(sc
				.getSocketFactory());
	}

}
