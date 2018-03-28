package cn.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.beanutils.BeanUtils;
import net.sf.json.JSONArray;
import cn.bean.TicketingBean;
import org.junit.jupiter.api.Test;

import static cn.helper.GetJsonAndDeal.getCodeByName;
import static cn.helper.GetJsonAndDeal.getTicketsInfo;
public class QueryTickets {
	
	// 从处理好的list中查找，存入javabean
    public static List<TicketingBean> queryTickets(String train_date,String from_station,String to_station, String purpose_codes) throws Exception {
		List<String> list = getTicketsInfo(train_date, from_station,to_station, purpose_codes);
        Pattern p = Pattern.compile("[^\\[].*[^\\]]");
		Matcher m ;
		TicketingBean bean;
		List<TicketingBean> beanList = new ArrayList<>();
		for(int i =0 ; i<list.size();i++){
			m = p.matcher(list.get(i));
			if(m.find())
				m.group(0);
			JSONArray jsonArray = JSONArray.fromObject(m.group(0).split(","));
			bean = new TicketingBean();
			BeanUtils.setProperty(bean, "train_no",jsonArray.get(0).toString());
			BeanUtils.setProperty(bean, "station_train_code",jsonArray.get(1).toString());
			BeanUtils.setProperty(bean, "from_station_name",jsonArray.get(2).toString());
			BeanUtils.setProperty(bean, "to_station_name",jsonArray.get(3).toString());
			BeanUtils.setProperty(bean, "start_time",jsonArray.get(4).toString());
			BeanUtils.setProperty(bean, "arrive_time",jsonArray.get(5).toString());
			BeanUtils.setProperty(bean, "lishi",jsonArray.get(6).toString());
			BeanUtils.setProperty(bean, "train_date",jsonArray.get(7).toString());
			BeanUtils.setProperty(bean, "from_station_no",jsonArray.get(8).toString());
			BeanUtils.setProperty(bean, "to_station_no",jsonArray.get(9).toString());
			BeanUtils.setProperty(bean, "gjrw",jsonArray.get(10).toString());
			BeanUtils.setProperty(bean, "rw",jsonArray.get(11).toString());
			BeanUtils.setProperty(bean, "wz",jsonArray.get(13).toString());
			BeanUtils.setProperty(bean, "yz",jsonArray.get(12).toString());
			BeanUtils.setProperty(bean, "yw",jsonArray.get(14).toString());
			BeanUtils.setProperty(bean, "ed",jsonArray.get(15).toString());
			BeanUtils.setProperty(bean, "yd",jsonArray.get(16).toString());
			BeanUtils.setProperty(bean, "td",jsonArray.get(17).toString());
			BeanUtils.setProperty(bean, "seat_types",jsonArray.get(18).toString());
			beanList.add(bean);
		}
		return beanList;
	}

	@Test
	public void test() throws Exception {
		System.out.print(queryTickets("2018-03-27",getCodeByName("北京"),getCodeByName("上海"),"ADULT"));
	}
}
