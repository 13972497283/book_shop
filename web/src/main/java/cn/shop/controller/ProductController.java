package cn.shop.controller;

import cn.shop.dao.CategoryDao;
import cn.shop.dao.ProductsDao;
import cn.shop.domain.Category;
import cn.shop.domain.Products;
import cn.shop.service.CategoryService;
import cn.shop.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("index")
public class ProductController {
    @Autowired
    private ProductsService productsService;

    @Autowired
    private CategoryService categoryService;
    /**
     * 根据商品id查询商品详情
     * @param pid
     * @return
     */
    @RequestMapping("detail")
    public ModelAndView findProductByPid(Integer pid){
        ModelAndView mv = new ModelAndView();
        if(pid==null) throw  new RuntimeException("系统错误！");
        //根据pid查询商品分类
        Category category=productsService.fingcategoryByPid(pid);
        //根据pid查询某个商品
        Products product=productsService.findProductByPid(pid);
        //查询全部分类
        List<Category> typeList = categoryService.findAllCategory();
        mv.addObject("category",category);
        mv.addObject("product",product);
        mv.addObject("typeList",typeList);
        mv.setViewName("index/detail");
        return  mv;
    }

}
