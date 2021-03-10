package cn.shop.dao;

import cn.shop.domain.Products;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProductsDao extends Mapper<Products> {
    @Select("select * from products where cid=#{cid}")
    List<Products> selectProductsByCid(Integer cid);
    @Select("SELECT p.*  FROM products p  ORDER BY (SELECT SUM(c.`count`) FROM cart c WHERE c.pid=p.pid) DESC")
    List<Products> selectProductsByCartNum();

    @Select("select *  from products where pname like '%${value}%' or pdesc like '%${value}%' " +
            "OR (cid  IN (SELECT cid  FROM cart c WHERE c.pname LIKE '%${value}%')) ORDER BY readnum  DESC ")
    List<Products> selectProductsBySearch(String searchName);
}
