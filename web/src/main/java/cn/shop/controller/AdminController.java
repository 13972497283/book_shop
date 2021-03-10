package cn.shop.controller;

import cn.shop.domain.Admins;
import cn.shop.domain.User;
import cn.shop.service.*;
import cn.shop.domain.Category;
import cn.shop.domain.Products;
import cn.shop.utils.JavaUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import vo.CartVo;
import vo.ProductsVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private ProductsService productsService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private UploadService uploadService;

    @Autowired
    private  UserService userService;

    @Autowired
    private  OrderService orderService;

    /**
     * 分页查询商品信息
     * @param searchName
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("goodList")
    public ModelAndView findAllProduct(String searchName,
                                       @RequestParam(value = "page",defaultValue = "1") Integer page,
                                       @RequestParam(value = "size",defaultValue = "8") Integer size){
        ModelAndView mv = new ModelAndView();
        PageInfo<ProductsVo> pageInfo =productsService.findAdminProductByPage(searchName,page,size);
        Integer[] startEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        mv.addObject("startEnd",startEnd);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/index");
        if(searchName==null)
        mv.addObject("pa","good_list");
        else {
            mv.addObject("searchName",searchName);
            mv.addObject("pa","good_list1");
        }
        return mv;
    }

    /**
     * 跳转到商品添加列
     * @return
     */
    @RequestMapping("toGoodAdd")
    public  ModelAndView toGoodAdd(){
        List<Category> categories = categoryService.findAllCategory();
        ModelAndView mv = new ModelAndView();
        mv.addObject("typeList",categories);
        mv.setViewName("admin/index");
        mv.addObject("pa","good_add");
        return mv;
    }

    /**
     * 保存商品
     * @param
     * @param
     * @return
     */
    @RequestMapping("goodSave")
    public  ModelAndView saveProduct(String pname,Double price,String pdesc,Integer cid, MultipartFile imgurl,Integer pid){
        ModelAndView mv = new ModelAndView();
        Products products = new Products();
        if(imgurl!=null&&imgurl.getSize()!=0){
            String imgurlStr=uploadService.upload(imgurl);
            products.setImgurl(imgurlStr);
        }else products.setImgurl(null);
        products.setCid(cid);
        products.setPdesc(pdesc);
        products.setPname(pname);
        products.setPrice(price);
        if(pid!=null)
            products.setPid(pid);
        productsService.saveProduct(products);
        mv.setViewName("forward:goodList.do");
        mv.addObject("pa","good_list");
        return mv;
    }

    /**
     * 删除商品
     * @return
     */
    @RequestMapping("goodDelete")
    public  String deleteProduct(Integer pid){
        if(pid==null) throw  new RuntimeException("系统错误");
        ModelAndView mv = new ModelAndView();
        productsService.deleteProductByPid(pid);
        return "forward:goodList.do";
    }

    /**
     * 把商品信息转发到商品更改页面
     * @param pid
     * @return
     */
    @RequestMapping("goodEdit")
    public ModelAndView toUpdateProduct(Integer pid){
        if(pid==null) throw new RuntimeException("系统错误！");
        ModelAndView mv = new ModelAndView();
        //根据主键查询商品
        Products product = productsService.findProductByPid(pid);
        //查询所有分类
        List<Category> allCategory = categoryService.findAllCategory();
        mv.addObject("good",product);
        mv.addObject("typeList",allCategory);
        mv.setViewName("admin/index");
        mv.addObject("pa","good_edit");
        return  mv;
    }


    /**
     * 管理员登录
     * @param admins
     * @param request
     * @return
     */
    @RequestMapping("login")
    public ModelAndView login(Admins admins, HttpServletRequest request){

        Boolean flag=adminService.login(admins);

        ModelAndView mv = new ModelAndView();
        if(flag) {
            HttpSession session = request.getSession();
            mv.setViewName("admin/index");
            mv.addObject("adminname", admins.getAdminname());
            session.setAttribute("adminname", admins.getAdminname());
        }
        return mv;
    }

    //用户列表
    @RequestMapping("userList")
    public ModelAndView userList(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                 @RequestParam(value = "size",defaultValue = "5") Integer size,
                                 String searchName){
        ModelAndView mv = new ModelAndView();
        PageInfo<User>pageInfo=userService.selectAdminUserList(page,size,searchName);
        //计算分页的开始还有结束页
        Integer[] calculationStartEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        mv.addObject("pageInfo",pageInfo);
        if(searchName!=null) mv.addObject("searchName",searchName);
        mv.addObject("pa","user_list");
        mv.setViewName("admin/index");
        mv.addObject("startEnd",calculationStartEnd);
        return  mv;
    }


    /**
     * 删除用户
     * @return
     */
    @RequestMapping("userDelete")
    public  String deleteUser(Integer uid){
        if(uid==null) throw  new RuntimeException("系统错误");
        ModelAndView mv = new ModelAndView();
        userService.deleteUserByPid(uid);
        return "forward:userList.do";
    }


    /**
     * 把用户信息转发到商品更改页面
     * @param uid
     * @return
     */
    @RequestMapping("userEdit")
    public ModelAndView toUpdateUser(Integer uid){
        if(uid==null) throw new RuntimeException("系统错误！");
        ModelAndView mv = new ModelAndView();
        //根据主键查询用户
        User user = userService.findUSerByUid(uid);
        System.out.println(user);
        mv.addObject("user",user);
        mv.setViewName("admin/index");
        mv.addObject("pa","user_edit");
        return  mv;
    }


    /**
     * 跳转到用户添加
     * @return
     */
    @RequestMapping("toUserAdd")
    public  ModelAndView toUserAdd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/index");
        mv.addObject("pa","user_list_add");
        return mv;
    }



    /**
     * 保存用户
     * @param
     * @param
     * @return
     */
    @RequestMapping("userSave")
    public  ModelAndView saveUser(String username,String password,String name,String phone,String email,Integer uid){
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

        mv.setViewName("forward:userList.do");
        mv.addObject("pa","user_list");
        return mv;
    }

    @RequestMapping("logOut.do")
    public String logout(HttpSession session){
        //从session域中移除username
        session.removeAttribute("adminname");
        return "/admin/login";
    }

    /**
     * 获取订单列表
     * @param page
     * @param size
     * @param carid
     * @return
     */
    @RequestMapping("orderList")
    public ModelAndView orderList(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                  @RequestParam(value = "size",defaultValue = "5") Integer size,
                                  Integer carid){
        ModelAndView mv = new ModelAndView();
        PageInfo<CartVo> pageInfo= orderService.findCartByPage(page,size,carid);
        Integer[] startEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        mv.addObject("startEnd",startEnd);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("pa","order");
        if(carid!=null)
        mv.addObject("carid",carid);
        mv.setViewName("admin/index");
        return  mv;
    }

    /**
     * 根据商品id删除商品
     * @param carid
     * @return
     */
    @RequestMapping("orderDelete")
    public String orderDelete(Integer carid){
        if(carid==null) throw new RuntimeException("系统错误！");
        orderService.deleteCartByCarid(carid);
        return "forward:orderList.do";
    }
}
