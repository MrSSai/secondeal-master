package com.secondeal.service.impl;

import com.secondeal.dao.AdminDao;
import com.secondeal.model.Admin;
import com.secondeal.service.AdminI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminIImpl implements AdminI {
    @Autowired
    AdminDao adminDao;
    @Override
    public List<Admin> getUser(String username) {
        return adminDao.getUser(username);
    }
}
