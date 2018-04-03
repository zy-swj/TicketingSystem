package cn.service.serviceImpl;

import cn.bean.UserBean;
import cn.dao.UserMapper;
import cn.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author zhoumin
 * @date 2018/3/13 20:03
 */
@Service("userService")
public class UserServiceImpl implements UserService {


    @Resource(name="userMapper")
    private UserMapper userMapper;
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    public UserMapper getUserMapper() {
        return userMapper;
    }

    @Override
    public List<UserBean> selectUserAndPassword(String user_name, String user_password) {
        return userMapper.selectUserAndPassword(user_name,user_password);
    }

    @Override
    public List<UserBean> selectQuestionAndAnswer(String user_name, String user_question, String user_answer) {
        return userMapper.selectQuestionAndAnswer(user_name,user_question,user_answer);
    }

    @Override
    //事务注解  可重复读取=>有事务则加入没有则创建=>是否只可读取  否
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly = false)
    public void insertUser(UserBean user) {
      userMapper.insertUser(user);
    }

    @Override
    public int countUser(UserBean user) {
        return userMapper.countUser(user);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly = false)
    public void updatePassword(UserBean user) {
        userMapper.updatePassword(user);
    }

    @Override
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly = false)
    public void updateUserRealName(UserBean user) {
        userMapper.updateUserRealName(user);
    }

    @Override
    public UserBean selectUser(int user_id) {
        return userMapper.selectUser(user_id);
    }
}
