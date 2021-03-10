package vo;

import cn.shop.domain.Category;
import cn.shop.domain.Products;

public class ProductsVo extends Products {
    private Category category;

    public ProductsVo(Products products) {
        this.setPid(products.getPid());
        this.setPname(products.getPname());
        this.setImgurl(products.getImgurl());
        this.setPdesc(products.getPdesc());
        this.setPrice(products.getPrice());
        this.setReadnum(products.getReadnum());
        this.setCid(products.getCid());
    }

    public ProductsVo() {
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "ProductsVo{" +
                "category=" + category +
                '}';
    }
}
