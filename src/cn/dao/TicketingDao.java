package cn.dao;

import cn.bean.PriceBean;
import cn.bean.TicketingBean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static cn.helper.GetJsonAndDeal.getCodeByName;
import static cn.helper.GetJsonAndDeal.getPrice;
import static cn.helper.QueryTickets.queryTickets;
import org.junit.jupiter.api.Test;

/**
 * @author zhoumin
 * @date 2018/3/14 21:28
 */
public class TicketingDao {

    public static List<TicketingBean> selectTickets(String train_date,String from_station_name,String to_station_name,String purpose_codes) throws Exception {
        String from_station = getCodeByName(from_station_name.replaceAll("\\s*",""));
        String to_station = getCodeByName(to_station_name.replaceAll("\\s*",""));//将名字转换为标准的地名代码
        List<TicketingBean> ticketsList = queryTickets(train_date,from_station,to_station,purpose_codes);
        return ticketsList;
    }

    public static List<PriceBean> selectPrice(TicketingBean tickets) throws Exception {
        Map<String,String> priceMap ;
        PriceBean priceBean = new PriceBean();
        priceMap=getPrice(tickets);
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
        return listPrice;
    }

    @Test
    public void test() throws Exception {
        System.out.println(getCodeByName("上海"));
        System.out.println(queryTickets("2018-03-22",getCodeByName("上海"),getCodeByName("南京"),"ADULT"));
    }

}



