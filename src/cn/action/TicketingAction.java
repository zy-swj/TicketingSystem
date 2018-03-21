package cn.action;


import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.bean.TicketingBean;
import static cn.dao.TicketingDao.selectTickets;

/**
 * @author zhoumin
 */
@Controller("ticketingAction")
@RequestMapping("/tickets")
public class TicketingAction {
   /* 查票*/
    @RequestMapping("/queryTickets")
    public String queryTickets(HttpSession session,String train_date,String from_station_name,String to_station_name,String purpose_codes) throws Exception {
        List<TicketingBean> listBean  = selectTickets(train_date, from_station_name, to_station_name, purpose_codes);
        session.setAttribute("_LIST_", listBean);
        return "/pages/common/showTickets.jsp";
    }

    /*改签*/
    @RequestMapping("/updateTickets")
    public String updateTickets(){

        return "";
    }

}
