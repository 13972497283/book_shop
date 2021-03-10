package cn.shop.service;

import cn.shop.domain.Cart;
import com.github.pagehelper.PageInfo;
import vo.CartVo;

public interface OrderService {
    PageInfo<CartVo> findCartByPage(Integer page, Integer size, Integer carid);

    void deleteCartByCarid(Integer carid);

    PageInfo<Cart> findCartByUid(Integer uid,Integer page,Integer size);
}
