package cn.shop.service.impl;

import cn.shop.dao.UserDao;
import cn.shop.domain.User;
import cn.shop.service.UserService;
import cn.shop.utils.BusinessException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User login(User user) {
        if(user==null) return null;
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username",user.getUsername());
        criteria.andEqualTo("password",user.getPassword());
        List<User> users = userDao.selectByExample(example);
        if(users.size()==0){
            throw new BusinessException("用户名或密码错误");
        }
        return  users.get(0);
    }

    @Override
    public Boolean register(User user) {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username",user.getUsername());
        List<User> users = userDao.selectByExample(example);
        if(users.size()!=0){
            throw new BusinessException("用户名已存在");
        }
        userDao.insertSelective(user);
        return true;
    }


    @Override
    public PageInfo<User> selectAdminUserList(Integer page, Integer size, String searchName) {
        PageHelper.startPage(page,size);
        List<User> users;
        if(searchName==null||searchName.length()==0||searchName.trim()==""){
            users=userDao.selectAll();
        }else{
            users=userDao.selectAllBySearchName(searchName);
        }
        return new PageInfo<>(users);
    }

    @Override
    public void deleteUserByPid(Integer uid) {
        userDao.deleteByPrimaryKey(uid);
    }

    @Override
    public User findUSerByUid(Integer uid) {

        User user = userDao.selectByPrimaryKey(uid);

        return user;
    }

    @Override
    public void insertUser(User user) {
        userDao.insertSelective(user);

    }

    @Override
    public void updateUser(User user) {
        userDao.updateByPrimaryKeySelective(user);
    }
}
