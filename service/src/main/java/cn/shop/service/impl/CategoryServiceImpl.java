package cn.shop.service.impl;

import cn.shop.dao.CategoryDao;
import cn.shop.domain.Category;
import cn.shop.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl  implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;

    /**
     * 查询所有商品分类
     * @return
     */
    @Override
    public List<Category> findAllCategory() {
        return categoryDao.selectAll();
    }

    @Override
    public PageInfo<Category> findCategoriesByCondition(Integer page, Integer size, String searchName) {
        PageHelper.startPage(page,size);
        List<Category> categories;
        if(searchName==null||searchName.length()==0){
            categories=categoryDao.selectAll();
        }
        else{
            categories=categoryDao.selectCategoriesBySearchName(searchName);
        }
        return new PageInfo<>(categories);
    }

    @Override
    public void addCategory(Integer cid,String cname) {
        if(cname==null||cname.length()==0) return;
        Category category = new Category();
        category.setCname(cname);
        if(cid==null){
            //添加商品类型
            categoryDao.insertSelective(category);
        }else{
            //修改商品类型
            category.setCid(cid);
            categoryDao.updateByPrimaryKeySelective(category);
        }
    }
    @Override
    public Category findCategoryByCid(Integer cid) {
        return categoryDao.selectByPrimaryKey(cid);
    }

    @Override
    public void deleteCategoryByCid(Integer cid) {
        categoryDao.deleteByPrimaryKey(cid);
    }

}
