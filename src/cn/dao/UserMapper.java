package cn.dao;

import cn.bean.UserBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zhoumin
 * @date 2018/3/13 19:57
 */
public interface UserMapper {
    List<UserBean> selectUserAndPassword(@Param("user_name")String user_name, @Param("user_password")String user_password);
    List<UserBean> selectQuestionAndAnswer(@Param("user_name")String user_name,@Param("user_question")String user_question ,@Param("user_answer")String user_answer);
    void insertUser(@Param("user") UserBean user);
    int countUser(@Param("user") UserBean user);
    void updatePassword(@Param("user") UserBean user);
    void updateUserRealName(@Param("user") UserBean user);
    UserBean selectUser(int user_id);
    void updatePhoneAndEmail(@Param("user") UserBean user);
}
