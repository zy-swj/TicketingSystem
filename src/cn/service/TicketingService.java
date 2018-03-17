package cn.service;

import cn.bean.TicketingBean;

import java.util.List;

/**
 * @author zhoumin
 * @date 2018/3/14 16:33
 */
public interface TicketingService {
    List<TicketingBean> selectTickets(String train_date,String from_station_name,String to_station_name,String purpose_codes);

}
