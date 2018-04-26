package cn.service;

import cn.bean.OrderBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zhoumin
 */
public interface OrderService {
    void insertTickets(OrderBean order);
    void updateTicket(String tickets_id);
    List<OrderBean> selectOrderByUserId(Integer user_id);
    List<OrderBean> selectGone(Integer int_id);
    List<OrderBean> selectNotGo(Integer int_id);
    void deleteTicketsByTicketsID(String tickets_id);
    int countOrder(OrderBean order);
    void insertEndorse(OrderBean order);
    List<OrderBean> selectTrip(Integer user_id);
}
