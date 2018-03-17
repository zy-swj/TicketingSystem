package cn.service.serviceImpl;

import cn.bean.TicketingBean;
import cn.dao.TicketingDao;
import cn.service.TicketingService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhoumin
 * @date 2018/3/14 16:36
 */
public class TicketingServiceImpl implements TicketingService{
    private TicketingDao ticketingDao = new TicketingDao();
    @Override
    public List<TicketingBean> selectTickets(String train_date,String from_station_name,String to_station_name,String purpose_codes) {
        return ticketingDao.selectTickets(train_date,from_station_name,to_station_name,purpose_codes);
    }
}
