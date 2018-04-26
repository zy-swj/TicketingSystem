package cn.dao;

import cn.bean.OrderBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.core.annotation.Order;

import java.util.List;

/**
 * @author zhoumin
 */
public interface OrderMapper {
    void insertTickets(@Param("order") OrderBean order);
    void updateTicket(@Param("tickets_id") String tickets_id);
    List<OrderBean> selectOrderByUserId(@Param("user_id")Integer int_id);
    List<OrderBean> selectGone(@Param("user_id")Integer int_id);
    List<OrderBean> selectNotGo(@Param("user_id")Integer int_id);
    void deleteTicketsByTicketsID(@Param("tickets_id") String tickets_id);
    int countOrder(@Param("order")OrderBean order);
    void insertEndorse(@Param("order")OrderBean order);
    List<OrderBean> selectTrip(@Param("user_id")Integer user_id);
}
