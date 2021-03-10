package cn.shop.service.impl;

import cn.shop.dao.CartDao;
import cn.shop.dao.ProductsDao;
import cn.shop.dao.ShoppingCartDao;
import cn.shop.domain.Cart;
import cn.shop.domain.Products;
import cn.shop.domain.ShoppingCart;
import cn.shop.service.ShoppingCartService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import vo.ShoppingCartVo;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    private ShoppingCartDao shoppingCartDao;

    @Autowired
    private ProductsDao productsDao;

    @Autowired
    private CartDao cartDao;

    @Override
    public void addShoppingByPid(Integer pid, Integer uid) {
        Example example = new Example(ShoppingCart.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("pid",pid);
        criteria.andEqualTo("uid",uid);
        List<ShoppingCart> shoppingCarts = shoppingCartDao.selectByExample(example);
        if(shoppingCarts!=null&&shoppingCarts.size()!=0){
            //已经加入购物车，购物车数量增加1即可
            ShoppingCart shoppingCart = shoppingCarts.get(0);
            shoppingCart.setQuantity(shoppingCart.getQuantity()+1);
            shoppingCartDao.updateByPrimaryKey(shoppingCart);
        }
        else{
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setPid(pid);
            shoppingCart.setQuantity(1);
            shoppingCart.setUid(uid);
            shoppingCartDao.insert(shoppingCart);
        }
    }

    @Override
    public PageInfo<ShoppingCartVo> findShoppingCartByUid(Integer uid,Integer page,Integer size) {
        Example example = new Example(ShoppingCart.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid",uid);
        PageHelper.startPage(page,size);
        //通过uid查询所有购物车
        List<ShoppingCart> shoppingCarts = shoppingCartDao.selectByExample(example);
        PageInfo pageInfo=new PageInfo(shoppingCarts);
        List<ShoppingCartVo> collect = getShoppingCartVos(shoppingCarts);
        pageInfo.setList(collect);
        return pageInfo;
    }

    private List<ShoppingCartVo> getShoppingCartVos(List<ShoppingCart> shoppingCarts) {
        return shoppingCarts.stream().map(shoppingCart -> {
                ShoppingCartVo vo = new ShoppingCartVo();
                vo.setShoppingCart(shoppingCart);
                Products products = productsDao.selectByPrimaryKey(shoppingCart.getPid());
                vo.setProducts(products);
                return  vo;
            }).collect(Collectors.toList());
    }

    @Override
    public void updateShoppingCart(Integer id, Integer quantity) {
        ShoppingCart shoppingCart = shoppingCartDao.selectByPrimaryKey(id);
        shoppingCart.setQuantity(quantity);
        shoppingCartDao.updateByPrimaryKey(shoppingCart);
    }

    @Override
    public void deleteShoppingById(Integer id) {
        shoppingCartDao.deleteByPrimaryKey(id);
    }

    @Override
    public void saveCart(Integer uid) {
        //根据uid查询所有购物车
        Example example = new Example(ShoppingCart.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid",uid);
        List<ShoppingCart> shoppingCarts = shoppingCartDao.selectAll();
        List<ShoppingCartVo> shoppingCartVos = getShoppingCartVos(shoppingCarts);
        shoppingCartVos.forEach(vo -> {
            Cart cart = new Cart();
            cart.setCount(vo.getQuantity());
            cart.setPid(vo.getPid());
            cart.setImgurl(vo.getProducts().getImgurl());
            cart.setPname(vo.getProducts().getPname());
            cart.setPrice(vo.getProducts().getPrice());
            cart.setUid(uid);
            cartDao.insert(cart);
            shoppingCartDao.deleteByPrimaryKey(vo.getId());
        });
    }
}
