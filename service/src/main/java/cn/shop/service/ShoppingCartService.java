package cn.shop.service;

import com.github.pagehelper.PageInfo;
import vo.ShoppingCartVo;

public interface ShoppingCartService {
    void addShoppingByPid(Integer pid, Integer uid);

    PageInfo<ShoppingCartVo> findShoppingCartByUid(Integer uid,Integer page,Integer size);

    void updateShoppingCart(Integer id, Integer quantity);

    void deleteShoppingById(Integer id);

    void saveCart(Integer uid);
}
