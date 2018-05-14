package com.secondeal.service.impl.account;

import com.secondeal.dao.account.UserActiveDao;
import com.secondeal.model.account.UserActive;
import com.secondeal.service.account.UserActionI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author:Mr.SSai
 * @Descriprtion:
 * @Date:15:59,2018/5/14
 * @Modified By:
 */
@Service
public class UserActionIImpl implements UserActionI {
    @Autowired
    UserActiveDao userActiveDao;
    @Override
    public int insert(UserActive userActive) {
        return userActiveDao.insert(userActive);
    }

    @Override
    public int update(String name) {
        return userActiveDao.updateLogin(name);
    }
}
