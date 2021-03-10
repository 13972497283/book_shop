package cn.shop.service.impl;

import cn.shop.dao.CartDao;
import cn.shop.dao.UserDao;
import cn.shop.domain.Cart;
import cn.shop.domain.User;
import cn.shop.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import vo.CartVo;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private CartDao cartDao;
    @Autowired
    private UserDao userDao;
    @Override
    public PageInfo<CartVo> findCartByPage(Integer page, Integer size, Integer carid) {
        List<Cart> carts;
        PageHelper.startPage(page,size);
        if(carid!=null){
            Cart cart = cartDao.selectByPrimaryKey(carid);
            carts=new ArrayList<>();
            carts.add(cart);
        }
        else{
            carts = cartDao.selectAll();
        }
        PageInfo pageInfo=new PageInfo(carts);
        List<CartVo> cartVos = carts.stream().map(cart -> {
            CartVo cartVo = new CartVo();
            cartVo.setCart(cart);
            Integer uid = cart.getUid();
            User user = userDao.selectByPrimaryKey(uid);
            cartVo.setUser(user);
            return cartVo;
        }).collect(Collectors.toList());
        pageInfo.setList(cartVos);
        return pageInfo;
    }

    @Override
    public void deleteCartByCarid(Integer carid) {
        cartDao.deleteByPrimaryKey(carid);
    }

    @Override
    public PageInfo<Cart> findCartByUid(Integer uid,Integer page,Integer size) {
        Example example = new Example(Cart.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid",uid);
        PageHelper.startPage(page,size);
        List<Cart> carts = cartDao.selectByExample(example);
        return new PageInfo<>(carts);
    }
}
