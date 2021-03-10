package vo;

import cn.shop.domain.Cart;
import cn.shop.domain.User;

public class CartVo {
    private Cart cart;
    private User user;

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "CartVo{" +
                "cart=" + cart +
                ", user=" + user +
                '}';
    }

    public CartVo() {
    }

    public CartVo(Cart cart, User user) {
        this.cart = cart;
        this.user = user;
    }
}
