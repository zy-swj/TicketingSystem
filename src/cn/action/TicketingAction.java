package cn.action;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import cn.bean.PriceBean;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.bean.TicketingBean;

import static cn.dao.TicketingDao.selectPrice;
import static cn.dao.TicketingDao.selectTickets;
import static cn.helper.UrlAndReturnJson.returnJson;

/**
 * @author zhoumin
 */
@Controller("ticketingAction")
@RequestMapping("/tickets")
public class TicketingAction {
   /* 查票*/
    @RequestMapping("/queryTickets")
    public String queryTickets(HttpSession session,String train_date,String from_station_name,String to_station_name,String purpose_codes,String endorse) throws Exception {
        List<TicketingBean> listBean  = selectTickets(train_date, from_station_name, to_station_name, purpose_codes);
        session.setAttribute("_LIST_", listBean);
        if( "endorse".equals(endorse))
            return "/pages/common/endorseShow.jsp";
        else
            return "/pages/common/showTickets.jsp";
    }

    @RequestMapping("/buyTickets")
    public String buyTickets(HttpSession session,TicketingBean tickets) throws Exception {
        Map<String,String> map = new HashMap<>();
        List<PriceBean> listBean = selectPrice(tickets);
        PriceBean priceBean = listBean.get(0);
        if(priceBean.getA1() != null)
            map.put("硬座",priceBean.getA1());
        if(priceBean.getA2() != null)
            map.put("软座",priceBean.getA2());
        if(priceBean.getA3() != null)
            map.put("硬卧",priceBean.getA3());
        if(priceBean.getA4() != null)
            map.put("软卧",priceBean.getA4());
        if(priceBean.getA6() != null)
            map.put("高级软卧",priceBean.getA6());
        if(priceBean.getA9() != null)
            map.put("特等座",priceBean.getA9());
        if(priceBean.getF() != null)
            map.put("动卧",priceBean.getF());
        if(priceBean.getO() != null)
            map.put("二等座",priceBean.getO());
        if(priceBean.getM() != null)
            map.put("一等座",priceBean.getM());
        if(priceBean.getP() != null)
            map.put("商务座",priceBean.getP());
        if(priceBean.getWZ() != null)
            map.put("无座",priceBean.getWZ());
        session.setAttribute("_PRICE_",map);
        session.setAttribute("_TRAIN_",tickets);
        return "/pages/common/buyTickets.jsp";
    }

    @RequestMapping("/endorseTickets")
    public String endorseTickets(HttpSession session,TicketingBean tickets) throws Exception {
        Map<String,String> map = new HashMap<>();
        List<PriceBean> listBean = selectPrice(tickets);
        PriceBean priceBean = listBean.get(0);
        if(priceBean.getA1() != null)
            map.put("硬座",priceBean.getA1().replaceAll("\\s*",""));
        if(priceBean.getA2() != null)
            map.put("软座",priceBean.getA2());
        if(priceBean.getA3() != null)
            map.put("硬卧",priceBean.getA3());
        if(priceBean.getA4() != null)
            map.put("软卧",priceBean.getA4());
        if(priceBean.getA6() != null)
            map.put("高级软卧",priceBean.getA6());
        if(priceBean.getA9() != null)
            map.put("特等座",priceBean.getA9());
        if(priceBean.getF() != null)
            map.put("动卧",priceBean.getF());
        if(priceBean.getO() != null)
            map.put("二等座",priceBean.getO());
        if(priceBean.getM() != null)
            map.put("一等座",priceBean.getM());
        if(priceBean.getP() != null)
            map.put("商务座",priceBean.getP());
        if(priceBean.getWZ() != null)
            map.put("无座",priceBean.getWZ());
        session.setAttribute("_PRICE_",map);
        session.setAttribute("_TRAIN_",tickets);
        return "/pages/common/endorseTickets.jsp";
    }


}
