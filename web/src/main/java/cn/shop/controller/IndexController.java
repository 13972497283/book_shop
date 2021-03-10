package cn.shop.controller;

import cn.shop.domain.Cart;
import cn.shop.domain.Category;
import cn.shop.domain.Products;
import cn.shop.domain.ShoppingCart;
import cn.shop.service.CategoryService;
import cn.shop.service.OrderService;
import cn.shop.service.ProductsService;
import cn.shop.service.ShoppingCartService;
import cn.shop.utils.JavaUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import vo.CartVo;
import vo.ShoppingCartVo;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductsService productsService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private OrderService orderService;
    /**
     * 首页
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView();
        //查询所有商品类型
        List<Category> categories=categoryService.findAllCategory();
        //查询所有商品（根据商品销量降序排列）
        List<Products> products=productsService.findByCartNum();
        mv.setViewName("index/index");
        mv.addObject("typeList",categories);
        mv.addObject("products",products);
        return  mv;
    }

    /**
     * 根据条件查询商品
     * @param cid 分类id
     * @param page 起始页
     * @param size 每页大小
     * @return
     */
    @RequestMapping("goods")
    public ModelAndView findGoodsByCid(Integer cid,
                                       @RequestParam(value = "page",defaultValue = "1",required = false) Integer page,
                                       @RequestParam(value = "size",defaultValue = "4",required = false) Integer size,
                                       String searchName)
    {
        ModelAndView mv = new ModelAndView();
        //查询所有商品类型
        List<Category> categories=categoryService.findAllCategory();
        //从所有分类中取出当前商品的分类
        if(cid!=null){
            Category type = categories.stream().filter(category -> {
                return category.getCid() == cid;
            }).collect(Collectors.toList()).get(0);
            //添加当前商品的商品类型到到ModelAndView中
            mv.addObject("type",type);
        }
        //分页查询所有商品
        PageInfo<Products> pageInfo=productsService.findProductsByPage(cid,page,size,searchName);
        //计算分页的起始页和结束页
        Integer[] startEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        //添加所有商品分类到ModelAndView中
        mv.addObject("typeList",categories);
        //添加分页查询的结果集到ModelAndView中
        mv.addObject("pageInfo",pageInfo);
        //将起始页和结束页添加到ModelAndView中
        mv.addObject("startEnd",startEnd);
        mv.setViewName("index/goods");
        if(searchName!=null&&searchName.length()!=0){
            mv.setViewName("index/goods1");
            mv.addObject("searchName",searchName);
        }
        return  mv;
    }

    /**
     * 添加到购物车
     * @param pid
     * @param session
     * @return
     */
    @RequestMapping("addShoppingCart")
    @ResponseBody
    public  String addShoppingCart(Integer pid, HttpSession session){
        if(pid==null) throw new RuntimeException("系统错误！");
        Object uid = session.getAttribute("uid");
        if(uid==null) return "login";
        shoppingCartService.addShoppingByPid(pid,(Integer) uid);
        return "ok";
    }

    /**
     * 查看购物车
     * @param uid
     * @return
     */
    @RequestMapping("cart")
    public  ModelAndView cart(Integer uid,
                              @RequestParam(value = "page",defaultValue = "1") Integer page,
                              @RequestParam(value = "size",defaultValue = "5") Integer size,HttpSession session){
        ModelAndView mv = new ModelAndView();
        if(session.getAttribute("username")==null) {
            //还没有登录
            mv.setViewName("index/login");
            return mv;
        }
        PageInfo<ShoppingCartVo> pageInfo =shoppingCartService.findShoppingCartByUid(uid,page,size);
        Integer[] startEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        mv.addObject("startEnd",startEnd);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("index/cart");
        //计算订单总价
        List<ShoppingCartVo> list = pageInfo.getList();
        Double total= list.stream().mapToDouble(item -> item.getQuantity() * item.getProducts().getPrice()).sum();
        mv.addObject("total",Double.valueOf(String.format("%.2f", total )));
        return  mv;
    }

    /**
     * 更新购物车数量
     * @param id
     * @param quantity
     * @return
     */
    @RequestMapping("updateShoppingCart")
    public  String updateShoppingCart(Integer id,Integer quantity,HttpSession session){
        if(session.getAttribute("username")==null) return "index/login";
        shoppingCartService.updateShoppingCart(id,quantity);
        return  "forward:cart.do";
    }

    /**
     * 根据id删除购物车
     * @param id
     * @return
     */
    @RequestMapping("deleteShoppingCart")
    public  String deleteShoppingById(Integer id){
        if(id==null) throw new RuntimeException("系统错误！");
        shoppingCartService.deleteShoppingById(id);
        return  "forward:cart.do";
    }

    /**
     * 提交订单
     * @return
     */
    @RequestMapping("saveCart")
    public ModelAndView saveCart(Integer uid,HttpSession session){
        ModelAndView mv = new ModelAndView();
        if(session.getAttribute("username")==null) {
            //还没有登录
            mv.setViewName("index/login");
            return mv;
        }
        shoppingCartService.saveCart(uid);
        mv.addObject("msg","下单成功");
        mv.setViewName("index/payok");
        return mv;
    }

    @RequestMapping("order")
    public  ModelAndView order(Integer uid,
                               @RequestParam(value = "page",defaultValue = "1") Integer page,
                               @RequestParam(value = "size",defaultValue = "5") Integer size,HttpSession session){
        ModelAndView mv = new ModelAndView();
        if(session.getAttribute("username")==null) {
            //还没有登录
            mv.setViewName("index/login");
            return mv;
        }
        PageInfo<Cart> pageInfo = orderService.findCartByUid(uid,page,size);
        Integer[] startEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        mv.addObject("startEnd",startEnd);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("index/order");
        mv.addObject("uid",uid);
        return  mv;
    }
}
