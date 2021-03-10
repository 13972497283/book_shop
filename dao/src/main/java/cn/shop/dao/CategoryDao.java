package cn.shop.dao;

import cn.shop.domain.Category;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CategoryDao  extends Mapper<Category> {
    @Select("select * from category where cid in (select cid from products where pid=#{pid}) ")
    Category fingcategoryByPid(Integer pid);

    @Select("select * from category where cname like '%${value}%' ")
    List<Category> selectCategoriesBySearchName(String searchName);
}
