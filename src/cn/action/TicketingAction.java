package cn.action;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.helper.GetTicketJson;
import cn.helper.QueryTickets;
import cn.service.TicketingService;
import cn.service.serviceImpl.TicketingServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.junit.jupiter.api.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.bean.TicketingBean;

/**
 * @author zhoumin
 */
@Controller("ticketingAction")

@RequestMapping("/tickets")
public class TicketingAction {

    private TicketingService ticketingService = new TicketingServiceImpl();

   /* 查票*/
    @RequestMapping("/queryTickets")
    public String queryTickets(HttpSession session,String train_date,String from_station_name,String to_station_name,String purpose_codes){
        List<TicketingBean> listbean;
        listbean = ticketingService.selectTickets(train_date, from_station_name, to_station_name, purpose_codes);
        session.setAttribute("_LIST_", listbean);
        return "/pages/common/showTickets.jsp";
    }
    /*改签*/
    @RequestMapping("/updateTickets")
    public String updateTickets(){

        return "";
    }












    @Test
    public void test(){
        String train_date = "2018-02-03";
        String from_station =GetTicketJson.getName().get("成都");
        String to_station =GetTicketJson.getName().get("广州");
        String purpose_codes = "ADULT";
        List<TicketingBean> listbean = new ArrayList<TicketingBean>();
        QueryTickets qt = new QueryTickets();
        listbean = qt.query(train_date, from_station, to_station, purpose_codes);
        System.out.println(listbean);
    }

    @Test
    public void test2(){
        TicketingBean bean1 =  null;;
        List<TicketingBean> list = new ArrayList<TicketingBean>();
        for(int i = 0 ; i <3 ;i ++){
            bean1 = new TicketingBean();
            try {
                BeanUtils.setProperty(bean1, "station_train_code", i);
                BeanUtils.setProperty(bean1, "from_station_name", i);
                list.add(bean1);
            } catch (IllegalAccessException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        System.out.println(list);


    }
}
