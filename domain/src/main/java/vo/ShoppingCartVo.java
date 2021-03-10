package vo;

import cn.shop.domain.Products;
import cn.shop.domain.ShoppingCart;

public class ShoppingCartVo  extends ShoppingCart {
    private  Products products;

    public ShoppingCartVo() {
    }

    public ShoppingCartVo(Products products) {
        this.products = products;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "ShoppingCartVo{" +
                "products=" + products +
                '}';
    }
    public void setShoppingCart(ShoppingCart shoppingCart){
        this.setId(shoppingCart.getId());
        this.setPid(shoppingCart.getPid());
        this.setQuantity(shoppingCart.getQuantity());
        this.setUid(shoppingCart.getUid());
    }
}
