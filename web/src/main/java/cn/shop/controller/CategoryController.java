package cn.shop.controller;

import cn.shop.domain.Category;
import cn.shop.service.CategoryService;
import cn.shop.utils.JavaUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("admin")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 根据条件分类查询商品类型
     * @param page
     * @param size
     * @param searchName
     * @return
     */
    @RequestMapping("typeList")
    public ModelAndView getCategoriesList(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                          @RequestParam(value = "size",defaultValue = "5") Integer size,
                                          String searchName){
        ModelAndView mv = new ModelAndView();
        PageInfo<Category> pageInfo = categoryService.findCategoriesByCondition(page,size,searchName);
        Integer[] startEnd = JavaUtils.calculationStartEnd(pageInfo.getPageNum(), pageInfo.getPages());
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("startEnd",startEnd);
        mv.setViewName("admin/index");
        mv.addObject("pa","type_list");
        if(searchName!=null&&searchName.length()!=0) mv.addObject("searchName",searchName);
        return mv;
    }

    /**
     * 添加商品类型
     * @param cid
     * @return
     */
    @RequestMapping("typeSave")
    public  String addCategory(Integer cid,String cname){
        categoryService.addCategory(cid,cname);
        return  "forward:typeList.do";
    }

    /**
     * 跳转到商品类型页面
     * @param cid
     * @return
     */
    @RequestMapping("toSave")
    public  ModelAndView toUpdateCategory(Integer cid){
        if(cid==null) throw  new RuntimeException("系统错误！");
        //根据id查询商品类型
        Category category=categoryService.findCategoryByCid(cid);
        ModelAndView mv = new ModelAndView();
        mv.addObject("type",category);
        mv.setViewName("admin/index");
        mv.addObject("pa","type_edit");
        return  mv;
    }

    /**
     * 删除商品类型
     * @param cid
     * @return
     */
    @RequestMapping("typeDelete")
    public String deleteCategory(Integer cid){
        if(cid==null) throw  new RuntimeException("系统错误！");
        categoryService.deleteCategoryByCid(cid);
        return  "forward:typeList.do";
    }
}
