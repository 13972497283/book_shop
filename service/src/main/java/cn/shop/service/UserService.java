package cn.shop.service;

import cn.shop.domain.User;
import com.github.pagehelper.PageInfo;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

public interface UserService {
    User login(User user);

    Boolean register(User user);

    PageInfo<User> selectAdminUserList(Integer page, Integer size, String searchName);

    void deleteUserByPid(Integer uid);

    User findUSerByUid(Integer uid);

    void insertUser(User user);

    void updateUser(User user);
}
