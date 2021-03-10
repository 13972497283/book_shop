package cn.shop.service;

import cn.shop.domain.Category;
import cn.shop.domain.Products;
import com.github.pagehelper.PageInfo;
import vo.ProductsVo;

import java.util.List;

public interface ProductsService {
    List<Products> findAll();

    List<Products> findAllOderByCondition(String condition,String desc);

    PageInfo<Products>findProductsByPage(Integer cid, Integer page, Integer size,String searchName);

    List<Products> findByCartNum();

    Category fingcategoryByPid(Integer pid);

    Products findProductByPid(Integer pid);

    PageInfo<ProductsVo> findAdminProductByPage(String searchName, Integer page, Integer size);

    void saveProduct(Products products);

    void deleteProductByPid(Integer pid);
}
