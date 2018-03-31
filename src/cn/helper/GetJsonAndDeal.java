package cn.helper;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.bean.PriceBean;
import cn.bean.TicketingBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.jupiter.api.Test;

import static cn.helper.UrlAndReturnJson.returnJson;

public class GetJsonAndDeal {

	// 获得余票信息的json字符串，并进行处理
	// https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=2018-01-22&leftTicketDTO.from_station=NJH&leftTicketDTO.to_station=HZH&purpose_codes=ADULT
	public static List<String> getTicketsInfo(String train_date, String from_station, String to_station, String purpose_codes) throws Exception {
		List<String> ticketsInfo_list = new ArrayList<>();
		List<String> jsonLists = new ArrayList<>();
		String urlStr = "https://kyfw.12306.cn/otn/leftTicket/queryO?"
				+ "leftTicketDTO.train_date="
				+ train_date
				+ "&leftTicketDTO.from_station="
				+ from_station
				+ "&leftTicketDTO.to_station="
				+ to_station
				+ "&purpose_codes="
				+ purpose_codes;
		String ticketsInfo_json = returnJson(urlStr);
		JSONObject jsonObject = JSONObject.fromObject(ticketsInfo_json);
		JSONArray jsonArray_result = jsonObject.getJSONObject("data").getJSONArray("result");
		JSONObject jsonObject_map = jsonObject.getJSONObject("data").getJSONObject("map");
		Pattern p = Pattern.compile("[\\|].*");
		for (Object object : jsonArray_result) {
			Matcher m = p.matcher(object.toString());
			if (m.find()) {
				jsonLists.add(m.group(0));
			}
		}
		for (int i = 0; i < jsonLists.size(); i++) {
			String tempStr = jsonLists.get(i).toString();
			String tempArr[] = tempStr.split("\\|");
			List<String> info = new ArrayList<>();
			for (String str : tempArr) {
				info.add(str);
			}
			List<String> ticketsInfo_list_temp = new ArrayList<>();
			ticketsInfo_list_temp.add(info.get(2));
			ticketsInfo_list_temp.add(info.get(3));
			ticketsInfo_list_temp.add((String) jsonObject_map.get(info.get(6)));
			ticketsInfo_list_temp.add((String) jsonObject_map.get(info.get(7)));//得到车站名字
			ticketsInfo_list_temp.add(info.get(8));
			ticketsInfo_list_temp.add(info.get(9));
			ticketsInfo_list_temp.add(info.get(10));
			ticketsInfo_list_temp.add(info.get(13));
			ticketsInfo_list_temp.add(info.get(16));
			ticketsInfo_list_temp.add(info.get(17));
			ticketsInfo_list_temp.add(info.get(21));
			ticketsInfo_list_temp.add(info.get(23));
			ticketsInfo_list_temp.add(info.get(26));
			ticketsInfo_list_temp.add(info.get(28));
			ticketsInfo_list_temp.add(info.get(29));
			ticketsInfo_list_temp.add(info.get(30));
			ticketsInfo_list_temp.add(info.get(31));
			ticketsInfo_list_temp.add(info.get(32));
			ticketsInfo_list_temp.add(info.get(35));
			ticketsInfo_list.add(ticketsInfo_list_temp.toString().replaceAll("\\s*",""));//去除空格
		}
		return ticketsInfo_list;
	}

	/* get code by name and add map
    * name_station
    * url:https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9030
    *获取json字符串，分析json字符串，进行分割，用正则表达式取出需要的部分存入hashmap
    * */
	public static String getCodeByName(String stationName) throws Exception {
		Map<String,String> map = new HashMap<>();
		//获取json写入字符串
		String urlStr = "https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9030";
		String nameString = returnJson(urlStr);
		//第一次处理json字符串
		String[] nameArr = nameString.split("\\@");//获得json由@分割开
		Pattern p = Pattern.compile("[^\\@].*\\|.*");
		List<String> jsonLists = new ArrayList<String>();
		for (Object object : nameArr) {
			Matcher m = p.matcher(object.toString());
			if (m.find()) {
				jsonLists.add(m.group(0));
			}
		}
		//第二次处理json字符互串
		for (int i = 0; i < jsonLists.size(); i++) {
			String temp = jsonLists.get(i).toString();
			String jsonArr[] = temp.split("\\|");
			List<String> mapLists = new ArrayList<String>();
			for (Object object : jsonArr) {
				mapLists.add(object.toString());
			}
			map.put(mapLists.get(1), mapLists.get(2));
		}
		return map.get(stationName);
	}

	public static JSONObject getPrice(TicketingBean tickets) throws Exception {
		String urlStr="https://kyfw.12306.cn/otn/leftTicket/queryTicketPrice?train_no="+tickets.getTrain_no()
				+"&from_station_no="+tickets.getFrom_station_no()
				+"&to_station_no="+tickets.getTo_station_no()
				+"&seat_types="+tickets.getSeat_types()
				+"&train_date="+tickets.getTrain_date();
		String priceString = returnJson(urlStr);
		JSONObject jsonObject = JSONObject.fromObject(priceString);
		JSONObject jsonObjectPrice = jsonObject.getJSONObject("data");
		return jsonObjectPrice;
	}

	@Test
	public void test() throws Exception {
		/*System.out.println("2018-03-26");
		System.out.println(getCodeByName("北京"));
		System.out.println(getCodeByName("上海"));
		System.out.println("ADULT");
		String urlStr = "https://kyfw.12306.cn/otn/leftTicket/queryO?leftTicketDTO.train_date=2018-03-26&leftTicketDTO.from_station=BJP&leftTicketDTO.to_station=SHH&purpose_codes=ADULT";
		System.out.println(returnJson(urlStr));*/
		System.out.print(getTicketsInfo("2018-03-27",getCodeByName("北京"),getCodeByName("上海"),"ADULT"));
		/*String urlStr="https://kyfw.12306.cn/otn/leftTicket/queryTicketPrice?train_no=240000T1090Z&from_station_no=01&to_station_no=09&seat_types=14163&train_date=2018-03-27";
		String priceString = returnJson(urlStr);
		System.out.println(priceString);
		JSONObject jsonObject = JSONObject.fromObject(priceString);
		JSONObject jsonObjectPrice = jsonObject.getJSONObject("data");
		Map<String,String> priceMap = new HashMap<>();
		priceMap = jsonObjectPrice;
		System.out.println(jsonObjectPrice.toString());
		System.out.println(priceMap.get("A9"));
		PriceBean priceBean = new PriceBean();
		if(priceMap.get("WZ") != null)
			priceBean.setWZ(priceMap.get("WZ"));
		if(priceMap.get("A1") != null)
			priceBean.setA1(priceMap.get("A1"));
		if(priceMap.get("A2") != null)
			priceBean.setA2(priceMap.get("A2"));
		if(priceMap.get("A3") != null)
			priceBean.setA3(priceMap.get("A3"));
		if(priceMap.get("A4") != null)
			priceBean.setA4(priceMap.get("A4"));
		if(priceMap.get("A6") != null)
			priceBean.setA6(priceMap.get("A6"));
		if(priceMap.get("F") != null)
			priceBean.setF(priceMap.get("F"));
		if(priceMap.get("O") != null)
			priceBean.setO(priceMap.get("O"));
		if(priceMap.get("M") != null)
			priceBean.setM(priceMap.get("M"));
		if(priceMap.get("P") != null)
			priceBean.setP(priceMap.get("P"));
		if(priceMap.get("A9") != null)
			priceBean.setA9(priceMap.get("A9"));
		List<PriceBean> listPrice = new ArrayList<>();
		listPrice.add(priceBean);
		System.out.println(listPrice.toString());*/
	}
}
