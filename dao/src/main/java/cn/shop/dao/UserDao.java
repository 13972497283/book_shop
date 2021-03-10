package cn.shop.dao;

import cn.shop.domain.User;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserDao extends Mapper<User> {
    @Select("select * from user where username like '%${value}%' ")
    List<User> selectAllBySearchName(String searchName);
}
