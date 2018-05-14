package com.secondeal.dao;

import com.secondeal.model.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminDao {
    List<Admin> getUser(@Param("username") String name);
}