package cn.helper;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.beanutils.BeanUtils;

import net.sf.json.JSONArray;

import cn.bean.TicketingBean;

public class QueryTickets {
	
	//query  从12306 查票
    public List<TicketingBean> query(String train_date,String from_station,String to_station, String purpose_codes){
		List<String> list = GetTicketJson.getTicketInfo_12306(train_date, from_station,to_station, purpose_codes); 
        Pattern p = Pattern.compile("[^\\[].*[^\\]]");
        Matcher m = null;
        TicketingBean bean = null;
        List<TicketingBean> beanlist = new ArrayList<TicketingBean>();
        for(int i =0 ; i<list.size();i++){
            m = p.matcher(list.get(i));
            if(m.find())
        	    m.group(0);
            JSONArray arr = JSONArray.fromObject(m.group(0).split(","));
            bean = new TicketingBean();
            try {
				BeanUtils.setProperty(bean, "station_train_code",arr.get(0).toString());
				BeanUtils.setProperty(bean, "from_station_name",arr.get(1).toString());
				BeanUtils.setProperty(bean, "to_station_name",arr.get(2).toString());
				BeanUtils.setProperty(bean, "start_time",arr.get(3).toString());
				BeanUtils.setProperty(bean, "arrive_time",arr.get(4).toString());
				BeanUtils.setProperty(bean, "lishi",arr.get(5).toString());
				BeanUtils.setProperty(bean, "gjrw",arr.get(6).toString());
				BeanUtils.setProperty(bean, "rw",arr.get(7).toString());
				BeanUtils.setProperty(bean, "wz",arr.get(8).toString());
				BeanUtils.setProperty(bean, "yw",arr.get(9).toString());
				BeanUtils.setProperty(bean, "yz",arr.get(10).toString());
				BeanUtils.setProperty(bean, "ed",arr.get(11).toString());
				BeanUtils.setProperty(bean, "yd",arr.get(12).toString());
				BeanUtils.setProperty(bean, "td",arr.get(13).toString());
				beanlist.add(bean); 
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            /*bean.setStation_train_code(arr.get(0).toString());
            bean.setFrom_station_name(arr.get(1).toString());//始发站名字
            bean.setTo_station_name(arr.get(2).toString());//到达站名字
            bean.setStart_time(arr.get(3).toString());//出发时间
            bean.setStart_time(arr.get(4).toString());//到达时间
            bean.setLishi(arr.get(5).toString());//历时
            bean.setGjrw(arr.get(6).toString());//高级软卧
            bean.setRw(arr.get(7).toString());
            bean.setWz(arr.get(8).toString());
            bean.setYw(arr.get(9).toString());
            bean.setYz(arr.get(10).toString());
            bean.setEd(arr.get(11).toString());
            bean.setYd(arr.get(12).toString());
            bean.setTd(arr.get(13).toString());*/   
        }
        
    	return beanlist;
    }
}
