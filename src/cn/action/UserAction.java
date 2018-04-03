package cn.action;


import cn.bean.UserBean;
import cn.dao.UserMapper;
import cn.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author zhoumin
 */
@Controller("userAction")
@RequestMapping("/user")
public class UserAction {
    @Resource(name="userService")
    private UserService userService;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public UserService getUserService() {
        return userService;
    }

    @RequestMapping("/userLogin")
    public String userLogin(HttpSession session, String user_name ,String user_password) {
        List<UserBean> userBeanList = userService.selectUserAndPassword(user_name,user_password);
        if (userBeanList.size() > 0) {
            session.setAttribute("_USER_", userBeanList.get(0));
            return "/pages/common/queryTickets.jsp";
        } else
            return "ERROR";
    }

    @RequestMapping("/checkUser")
    public String checkUser(HttpSession session,String user_name,String user_question,String user_answer){
        List<UserBean> userBeanList = userService.selectQuestionAndAnswer(user_name,user_question,user_answer);
        if(userBeanList.size()>0)
            return "/pages/common/updatePassword.jsp";
        else {
            return "ERROR";
        }
    }
    @RequestMapping("/updatePassword")
    public String updatePassword(UserBean user){
        userService.updatePassword(user);
        return "/pages/common/login.jsp";
    }

    @RequestMapping("/userRegister")
    public String userRegister(UserBean user){
        int count = userService.countUser(user);
        if(count > 0 ){
            return "ERROR";
        }
        else {
            userService.insertUser(user);
            return "/pages/common/login.jsp";
        }
    }
    @RequestMapping("checkUserName")
    public String checkUserName(UserBean user){
        int count = userService.countUser(user);
        if(count>0)
            return "/pages/main.jsp";
        else
            return "ERROR";
    }

    @RequestMapping("authentication")
    public String authentication (HttpSession session,UserBean user){

            userService.updateUserRealName(user);
            UserBean userBean = userService.selectUser(user.getUser_id());
            session.setAttribute("_USER_",userBean);
            return "/pages/common/queryTickets.jsp";


    }





        @Test()
        public void test(){
            ApplicationContext ac= new ClassPathXmlApplicationContext("applicationContext.xml");
            System.out.println(ac.getBean("dataSource"));
            System.out.println(ac.getBean("sqlSessionFactory"));
            UserMapper dao=(UserMapper)ac.getBean("userMapper");
            UserBean user = new UserBean();
            user.setUser_name("zhoum");
            user.setUser_password("sss");
            dao.selectUserAndPassword("zhoum","123");
            dao.selectQuestionAndAnswer("zhoum","are u ok","是的");
            dao.countUser(user);
            dao.updatePassword(user);

    }

}