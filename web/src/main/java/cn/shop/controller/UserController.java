package cn.shop.controller;

import cn.shop.domain.User;
import cn.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("index")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 登录功能
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("login.do")
    public ModelAndView login(User user,HttpServletRequest request){
        User loginUser=userService.login(user);
        ModelAndView mv = new ModelAndView();
        if(loginUser!=null){
            //登录成功
            HttpSession session = request.getSession();
            mv.setViewName("index");
            mv.addObject("username",user.getUsername());
            session.setAttribute("username",user.getUsername());
            session.setAttribute("uid",loginUser.getUid());
        }
        return mv;
    }

    /**
     * 注册功能
     * @param user
     * @return
     */
    @RequestMapping("register.do")
    public ModelAndView register(User user){
        ModelAndView mv = new ModelAndView();
        Boolean flag=userService.register(user);
        if(flag){
            //注册成功
            mv.addObject("user",user);
            //mv.addObject("pb","user_list");
            mv.setViewName("index/login");
        }
        return  mv;
    }

    /**
     * 退出功能
     * @param session
     * @return
     */
    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        //从session域中移除username
        session.removeAttribute("username");
        session.removeAttribute("uid");
        return "index";
    }


    /***用户个人中心的功能
     * 从首页进入个人中心***/

    @RequestMapping("my.do")
    public ModelAndView toUpdateUser(Integer uid){
        if(uid==null) throw new RuntimeException("系统错误！");
        ModelAndView mv = new ModelAndView();
        //根据主键查询用户
        User user = userService.findUSerByUid(uid);
        System.out.println(user);
        mv.addObject("user",user);
        mv.setViewName("index/my");
        mv.addObject("pa","my");
        return  mv;
    }

/**********从个人中心回到首页 **************/
    @RequestMapping("MY")
    public  ModelAndView saveMy(String username,String password,String name,String phone,String email,Integer uid){
        ModelAndView mv = new ModelAndView();
        //Products products = new Products();
        User user = new User();

        user.setUsername(username);
        user.setName(name);
        user.setPhone(phone);
        user.setEmail(email);
        if(password!=null){

            user.setPassword(password);
            userService.insertUser(user);
            //System.out.println("密码不为空！！添加insert");
        }else{
            user.setUid(uid);
            userService.updateUser(user);
            //System.out.println("密码为空！！修改update");
        }

        mv.setViewName("index");
        mv.addObject("pa","index");
        return mv;
    }

}
