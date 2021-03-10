package cn.shop.service.impl;

import cn.shop.dao.AdminsDao;
import cn.shop.domain.Admins;
import cn.shop.domain.User;
import cn.shop.service.AdminService;
import cn.shop.utils.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminsDao adminsDao;
    @Override
    public Boolean login(Admins admins) {
        if(admins==null) return false;
        Example example = new Example(Admins.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("adminname",admins.getAdminname());
        criteria.andEqualTo("adminpwd",admins.getAdminpwd());
        List<Admins> admins1 = adminsDao.selectByExample(example);


        if(admins1.size()==0){
            throw new BusinessException("用户名或密码错误");
        }
        return  true;
    }



}
