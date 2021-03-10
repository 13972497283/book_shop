package cn.shop.service;

import cn.shop.domain.Category;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CategoryService {
    List<Category> findAllCategory();

    PageInfo<Category> findCategoriesByCondition(Integer page, Integer size, String searchName);

    void addCategory(Integer cid,String cname);

    Category findCategoryByCid(Integer cid);

    void deleteCategoryByCid(Integer cid);

}
