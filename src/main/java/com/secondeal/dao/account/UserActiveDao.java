package com.secondeal.dao.account;

import com.secondeal.model.account.UserActive;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserActiveDao {
    int insert(UserActive userActive);

    int updateLogin(@Param("mobile") String mobile);
}