package cn.shop.service.impl;

import cn.shop.dao.CategoryDao;
import cn.shop.dao.ProductsDao;
import cn.shop.domain.Category;
import cn.shop.domain.Products;
import cn.shop.service.ProductsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import vo.ProductsVo;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductsServiceImpl implements ProductsService {
    @Autowired
    private ProductsDao productsDao;

    @Autowired
    private CategoryDao categoryDao;

    /**‘
     * 查询所有商品
     * @return
     */
    @Override
    public List<Products> findAll() {
        return productsDao.selectAll();
    }

    /**
     *
     * @param condition 排序的条件（哪一列）
     * @param desc 排序的方式（降序或者升序）
     * @return
     */
    @Override
    public List<Products> findAllOderByCondition(String condition,String desc) {
        Example example = new Example(Products.class);
        //根据条件排序
        example.setOrderByClause(condition+" "+desc);
        return productsDao.selectByExample(example);
    }

    /**
     * 分页查询
     * @param cid
     * @param page
     * @param size
     * @return
     */
    @Override
    public PageInfo<Products>findProductsByPage(Integer cid, Integer page, Integer size,String searchName) {
        PageHelper.startPage(page,size);
        List<Products> products = null;
        if(cid!=null)
        products = productsDao.selectProductsByCid(cid);
        if(searchName!=null&&searchName.length()!=0){
            products=productsDao.selectProductsBySearch(searchName);
        }
        return  new PageInfo<>(products);
    }

    /**
     * 根据商品销量排序
     * @return
     */
    @Override
    public List<Products> findByCartNum() {
        return productsDao.selectProductsByCartNum();
    }

    /**
     * 根据pid查询分类
     * @param pid
     * @return
     */
    @Override
    public Category fingcategoryByPid(Integer pid) {
        return categoryDao.fingcategoryByPid(pid);
    }

    /**
     * 根据pid查询一个商品
     * @param pid
     * @return
     */
    @Override
    public Products findProductByPid(Integer pid) {
        return productsDao.selectByPrimaryKey(pid);
    }

    /**
     *
     * @param searchName
     * @param page
     * @param size
     * @return
     */
    @Override
    public PageInfo<ProductsVo> findAdminProductByPage(String searchName, Integer page, Integer size) {
        List<Products> products;
        PageHelper.startPage(page,size);
        if(searchName!=null&&searchName.length()!=0){
            products = productsDao.selectProductsBySearch(searchName);
        }else {
            products=productsDao.selectAll();
        }
        PageInfo pageInfo=new PageInfo(products);
        List<ProductsVo> collect = products.stream().map(product -> {
            ProductsVo productsVo = new ProductsVo(product);
            Category category = categoryDao.fingcategoryByPid(product.getPid());
            productsVo.setCategory(category);
            return productsVo;
        }).collect(Collectors.toList());
        pageInfo.setList(collect);
        return pageInfo;
    }

    /**
     * 保存商品
     * @param products
     */
    @Override
    public void saveProduct(Products products) {
        if(products.getPname()==null||products==null) return;
        if(products.getPid()==null)
        productsDao.insertSelective(products);
        else productsDao.updateByPrimaryKeySelective(products);
    }

    /**
     * 根据主键删除商品
     * @param pid
     */
    @Override
    public void deleteProductByPid(Integer pid) {
        productsDao.deleteByPrimaryKey(pid);
    }
}
